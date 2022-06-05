package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Delicacy;
import com.carolin_violet.travel_system.bean.Hotel;
import com.carolin_violet.travel_system.bean.ScenicSpot;
import com.carolin_violet.travel_system.service.DelicacyService;
import com.carolin_violet.travel_system.service.HotelService;
import com.carolin_violet.travel_system.service.ScenicSpotService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName IndexInfoController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/5 20:38
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class IndexInfoController {

    @Autowired
    private DelicacyService delicacyService;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private ScenicSpotService scenicSpotService;


        // 获取首屏数据
    @GetMapping("getIndexContent")
    public R getIndexContent() {
        QueryWrapper<Delicacy> wrapper1 = new QueryWrapper<>();
        wrapper1.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
        List<Delicacy> delicacyList = delicacyService.list(wrapper1);

        QueryWrapper<Hotel> wrapper2 = new QueryWrapper<>();
        wrapper2.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
        List<Hotel> hotelList = hotelService.list(wrapper2);

        QueryWrapper<ScenicSpot> wrapper3 = new QueryWrapper<>();
        wrapper3.orderByDesc("popular").orderByDesc("create_time").last("limit 5");
        List<ScenicSpot> scenicSpotList = scenicSpotService.list(wrapper3);
        return R.ok().data("delicacyList", delicacyList).data("hotelList", hotelList).data("scenicSpotList", scenicSpotList);
    }
}
