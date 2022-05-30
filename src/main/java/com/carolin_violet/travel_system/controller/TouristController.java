package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Delicacy;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.bean.vo.FeedbackVo;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.FeedbackService;
import com.carolin_violet.travel_system.service.OssService;
import com.carolin_violet.travel_system.service.TouristService;
import com.carolin_violet.travel_system.service.TravelNoteService;
import com.carolin_violet.travel_system.utils.JwtUtils;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author carolin-violet
 * @since 2022-05-30
 */
@RestController
@RequestMapping("/travel_system/tourist")
@CrossOrigin
public class TouristController {
    @Autowired
    private TouristService touristService;


    // 分页查询查看所有游客信息
    @GetMapping("findAll/{cur}/{limit}")
    @PreAuthorize("hasAnyAuthority('ROLE_TOURIST')")
    public R findAllDelicacy(@PathVariable long cur, @PathVariable long limit) {
        Page<Tourist> touristPage = new Page<>(cur, limit);
        QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        touristService.page(touristPage, wrapper);

        long total = touristPage.getTotal();
        List<Tourist> records = touristPage.getRecords();
        return R.ok().data("items", records).data("total", total);
    }

    // 逻辑删除游客
    // TODO 删除游客游记、反馈、照片
    @PreAuthorize("hasAnyAuthority('ROLE_TOURIST')")
    @DeleteMapping("{id}")
    public R removeHotel(@PathVariable String id) {
        boolean flag = touristService.removeAll(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }


}

