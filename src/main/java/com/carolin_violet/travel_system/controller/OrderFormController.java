package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.OrderForm;
import com.carolin_violet.travel_system.bean.vo.OrderVo;
import com.carolin_violet.travel_system.service.OrderFormService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author carolin-violet
 * @since 2022-06-27
 */
@RestController
@RequestMapping("/travel_system/order")
@CrossOrigin
public class OrderFormController {

    @Autowired
    private OrderFormService orderFormService;

    // 根据时间、mark进行分页条件查询
    @PreAuthorize("hasAnyAuthority('ROLE_ORDER')")
    @PostMapping("pageOrder/{current}/{limit}")
    public R getPageOrder(@RequestBody OrderVo orderVo, @PathVariable long current, @PathVariable long limit) {

        Page<OrderForm> orderPage = new Page<>(current, limit);
        QueryWrapper<OrderForm> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        if (orderVo.getDate() != null) {
            wrapper.eq("appointment_time", orderVo.getDate());
        }

        if (orderVo.getMark() != null) {
            wrapper.eq("mark", orderVo.getMark());
        }

        orderFormService.page(orderPage, wrapper);

        long total = orderPage.getTotal();

        List<OrderForm> records = orderPage.getRecords();

        return R.ok().data("rows", records).data("total", total);
    }

    // 修改订单信息
    @PreAuthorize("hasAnyAuthority('ROLE_ORDER')")
    @PostMapping("updateOrder")
    public R updateOrder(@RequestBody OrderForm orderForm) {
        boolean flag = orderFormService.updateById(orderForm);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 删除订单
    @PreAuthorize("hasAnyAuthority('ROLE_ORDER')")
    @DeleteMapping("{id}")
    public R deleteOrder(@PathVariable String id) {
        boolean flag = orderFormService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}

