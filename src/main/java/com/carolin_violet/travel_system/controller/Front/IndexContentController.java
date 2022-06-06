package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Delicacy;
import com.carolin_violet.travel_system.bean.Hotel;
import com.carolin_violet.travel_system.bean.ScenicSpot;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName IndexContentController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:07
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class IndexContentController {

    @Autowired
    private DelicacyService delicacyService;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private ScenicSpotService scenicSpotService;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    // 获取首屏数据(首页)
    @GetMapping("getIndexContent")
    public R getIndexContent() {
        // 先从redis缓存获取首屏信息，没有就重新查询数据库
        Map indexData = (Map) redisTemplate.opsForValue().get("indexData");
        if (indexData == null) {
            QueryWrapper<Delicacy> wrapper1 = new QueryWrapper<>();
            wrapper1.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
            List<Delicacy> delicacyList = delicacyService.list(wrapper1);

            QueryWrapper<Hotel> wrapper2 = new QueryWrapper<>();
            wrapper2.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
            List<Hotel> hotelList = hotelService.list(wrapper2);

            QueryWrapper<ScenicSpot> wrapper3 = new QueryWrapper<>();
            wrapper3.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
            List<ScenicSpot> scenicSpotList = scenicSpotService.list(wrapper3);

            Map<String, List> map = new HashMap<>();
            map.put("hotelList", hotelList);
            map.put("delicacyList", delicacyList);
            map.put("scenicSpotList", scenicSpotList);

            redisTemplate.opsForValue().set("indexData", map, 1, TimeUnit.DAYS);
            indexData = map;
        }
        return R.ok().data("items", indexData);
    }
}
