package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.OrderForm;
import com.carolin_violet.travel_system.service.OrderFormService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    // 游客查询自己的历史订单
    @GetMapping("getAllOrder/{tourisId}")
    public R getAllOrder(@PathVariable String tourisId) {
        QueryWrapper<OrderForm> wrapper = new QueryWrapper<OrderForm>();
        wrapper.eq("tourist_id", tourisId);

        List<OrderForm> orderForms = orderFormService.list(wrapper);
        return R.ok().data("rows", orderForms);
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
    @PostMapping("updateOrder")
     public R updateOrder(@RequestBody OrderForm orderForm) {
        boolean flag = orderFormService.updateById(orderForm);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 取消订单
    @DeleteMapping("{id}")
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
