package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.OrderForm;
import com.carolin_violet.travel_system.bean.ScenicSpot;
import com.carolin_violet.travel_system.bean.TouristRoute;
import com.carolin_violet.travel_system.bean.vo.OrderVo2;
import com.carolin_violet.travel_system.service.OrderFormService;
import com.carolin_violet.travel_system.service.ScenicSpotService;
import com.carolin_violet.travel_system.service.TouristRouteService;
import com.carolin_violet.travel_system.utils.JwtUtils;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    // 游客查询没支付的订单
    @GetMapping("getUnPaidOrder/{touristId}")
    public R getUnPaidOrder(@PathVariable String touristId, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(touristId)) {
            return R.error().message("身份错误！");
        }

        // 游客查询到自己所有的订单
        QueryWrapper<OrderForm> wrapper = new QueryWrapper<>();
        wrapper.eq("tourist_id", touristId).eq("is_paid", 0);
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


    // 游客根据订单时间倒序分页查询所有历史订单
    @GetMapping("order/{touristId}/{cur}/{limit}")
    public R getPageOrder(@PathVariable String touristId, @PathVariable long cur, @PathVariable long limit, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(touristId)) {
            return R.error().message("身份错误！");
        }


        Page<OrderForm> orderFormPage = new Page<>(cur, limit);
        QueryWrapper<OrderForm> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time").eq("tourist_id", touristId);
        orderFormService.page(orderFormPage, wrapper);

        long total = orderFormPage.getTotal();
        List<OrderForm> records = orderFormPage.getRecords();

        // 每一个订单再查询对应的名称(景点、线路拼团)
        List<OrderVo2> orderList = new ArrayList<>();
        for (OrderForm order: records) {
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

        return R.ok().data("rows", orderList).data("total", total);
    }

    // 游客新增订单，可以是拼单也可以是单买门票
    @PostMapping("addOrder")
    public R addOrder(@RequestBody OrderForm orderForm, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(orderForm.getTouristId())) {
            return R.error().message("身份错误！");
        }

        boolean save = orderFormService.save(orderForm);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改订单信息,支付后修改订单信息为支付成功
    @PutMapping("updateOrder")
     public R updateOrder(@RequestBody OrderForm orderForm, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(orderForm.getTouristId())) {
            return R.error().message("身份错误！");
        }

        boolean flag = orderFormService.updateById(orderForm);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 游客删除自己的订单
    @DeleteMapping("delOrder/{id}")
    public R delOrder(@PathVariable String id, HttpServletRequest httpServletRequest) {

        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(orderFormService.getById(id).getTouristId())) {
            return R.error().message("身份错误！");
        }

        boolean flag = orderFormService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
    //
}
