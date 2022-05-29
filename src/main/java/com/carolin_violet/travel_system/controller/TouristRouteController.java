package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.RouteDetail;
import com.carolin_violet.travel_system.bean.TouristRoute;
import com.carolin_violet.travel_system.service.RouteDetailService;
import com.carolin_violet.travel_system.service.TouristRouteService;
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
 * @since 2022-05-22
 */
@RestController
@RequestMapping("/travel_system/tourist-route")
@CrossOrigin
public class TouristRouteController {
    @Autowired
    private TouristRouteService touristRouteService;

    @Autowired
    RouteDetailService routeDetailService;

    // 查询所有线路
    @PreAuthorize("hasAnyAuthority('ROLE_ROUTE')")
    @GetMapping("findAll/{cur}/{limit}")
    public R findAllRoutes(@PathVariable long cur, @PathVariable long limit) {
        Page<TouristRoute> touristRoutePage = new Page<>(cur, limit);
        QueryWrapper<TouristRoute> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        touristRouteService.page(touristRoutePage, wrapper);

        List<TouristRoute> records = touristRoutePage.getRecords();
        long total = touristRoutePage.getTotal();
        return R.ok().data("items", records).data("total", total);
    }

    // 添加线路并返回线路id
    @PreAuthorize("hasAnyAuthority('ROLE_ROUTE')")
    @PostMapping("addRoute")
    public R addRoute(@RequestBody TouristRoute touristRoute) {
        boolean save = touristRouteService.save(touristRoute);
        if (save) {
            return R.ok().data("id", touristRoute.getId());
        } else {
            return R.error();
        }
    }

    // 修改线路基本信息
    @PreAuthorize("hasAnyAuthority('ROLE_ROUTE')")
    @PutMapping("updateRoute")
    public R updateRoute(@RequestBody TouristRoute touristRoute) {
        boolean flag = touristRouteService.updateById(touristRoute);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 删除线路,并且删除线路对应的站点信息
    @PreAuthorize("hasAnyAuthority('ROLE_ROUTE')")
    @DeleteMapping("{id}")
    public R removeRoute(@PathVariable String id) {
        // 根据线路id删除
        QueryWrapper<RouteDetail> wrapper = new QueryWrapper<>();
        wrapper.eq("route_id", id);
        routeDetailService.remove(wrapper);

        // 根据线路id删除线路
        touristRouteService.removeById(id);

        return R.ok();
    }
}

