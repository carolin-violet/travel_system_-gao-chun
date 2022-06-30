package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.RouteDetail;
import com.carolin_violet.travel_system.bean.TouristRoute;
import com.carolin_violet.travel_system.service.RouteDetailService;
import com.carolin_violet.travel_system.service.TouristRouteService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ItemRouteController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:45
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemRouteController {
    @Autowired
    private TouristRouteService touristRouteService;

    @Autowired
    private RouteDetailService routeDetailService;

    @GetMapping("getRouteInfo")
    public R getRouteInfo() {

        List<TouristRoute> touristRouteList = touristRouteService.list(null);

        List routeDetailList = new ArrayList();
        for (TouristRoute route: touristRouteList) {
            Map map = new HashMap();
            map.put("id", route.getId());
            map.put("title", route.getTitle());
            map.put("reason", route.getReason());
            map.put("description", route.getDescription());
            map.put("price", route.getPrice());
            map.put("discountPrice", route.getDiscountPrice());

            QueryWrapper<RouteDetail> wrapper = new QueryWrapper<>();
            wrapper.eq("route_id", route.getId());
            List<RouteDetail> siteList = routeDetailService.list(wrapper);
            map.put("siteList", siteList);
            map.put("showContent", false);

            routeDetailList.add(map);
        }
        return R.ok().data("items", routeDetailList);
    }
}
