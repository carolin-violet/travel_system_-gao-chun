package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.OrderForm;
import com.carolin_violet.travel_system.bean.ScenicSpot;
import com.carolin_violet.travel_system.bean.TouristRoute;
import com.carolin_violet.travel_system.bean.vo.OrderVo2;
import com.carolin_violet.travel_system.service.OrderFormService;
import com.carolin_violet.travel_system.service.ScenicSpotService;
import com.carolin_violet.travel_system.service.TouristRouteService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


/**
 * @ClassName ItemOrderController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/27 15:49
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemOrderController {

    @Autowired
    private OrderFormService orderFormService;

    @Autowired
    private ScenicSpotService scenicSpotService;

    @Autowired
    private TouristRouteService touristRouteService;

    // 游客查询自己的历史订单
    @GetMapping("getAllOrder/{touristId}/{isPaid}")
    public R getAllOrder(@PathVariable String touristId, @PathVariable Integer isPaid) {
        // 游客查询到自己所有的订单
        QueryWrapper<OrderForm> wrapper = new QueryWrapper<>();
        wrapper.eq("tourist_id", touristId);

        if (isPaid == 0) {
            wrapper.eq("is_paid", isPaid);
        }
        List<OrderForm> orderForms = orderFormService.list(wrapper);

        // 每一个订单再查询对应的名称(景点、线路拼团)
        List<OrderVo2> orderList = new ArrayList<>();
        for (OrderForm order: orderForms) {
            System.out.println(order.toString());
            OrderVo2 orderItem = new OrderVo2();
            BeanUtils.copyProperties(order, orderItem);

            if ("scenic".equals(order.getMark())) {
                ScenicSpot scenicSpot = scenicSpotService.getById(order.getCommodityId());
                orderItem.setTitle("门票:" + scenicSpot.getName());
            } else if ("route".equals(order.getMark())) {
                TouristRoute touristRoute = touristRouteService.getById(order.getCommodityId());
                orderItem.setTitle("拼团:" + touristRoute.getTitle());
            }

            orderList.add(orderItem);
        }

        return R.ok().data("rows", orderList);
    }

    // 游客新增订单，可以是拼单也可以是单买门票
    @PostMapping("addOrder")
    public R addOrder(@RequestBody OrderForm orderForm) {
        boolean save = orderFormService.save(orderForm);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改订单信息,支付后修改订单信息为支付成功
    @PutMapping("updateOrder")
     public R updateOrder(@RequestBody OrderForm orderForm) {
        boolean flag = orderFormService.updateById(orderForm);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 游客删除自己的订单
    @DeleteMapping("delOrder/{id}")
    public R delOrder(@PathVariable String id) {
        boolean flag = orderFormService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
    //
}
