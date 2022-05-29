package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.ScenicSpot;
import com.carolin_violet.travel_system.bean.conditionQuery.ScenicSpotQuery;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.service.ScenicSpotService;
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
@RequestMapping("/travel_system/scenic-spot")
@CrossOrigin
public class ScenicSpotController {

    @Autowired
    private ScenicSpotService scenicSpotService;

    @Autowired
    private PhotosService photosService;

    // 查询所有景点
    @PreAuthorize("hasAnyAuthority('ROLE_SCENIC')")
    @GetMapping("findAll/{cur}/{limit}")
    public R findAllScenicSpot(@PathVariable long cur, @PathVariable long limit) {
        Page<ScenicSpot> scenicSpotPage = new Page<>(cur, limit);
        QueryWrapper<ScenicSpot> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("popular");

        scenicSpotService.page(scenicSpotPage, wrapper);
        List<ScenicSpot> records = scenicSpotPage.getRecords();
        long total = scenicSpotPage.getTotal();
        return R.ok().data("items", records).data("total", total);
    }

    // 添加景点
    @PreAuthorize("hasAnyAuthority('ROLE_SCENIC')")
    @PostMapping("addScenicSpot")
    public R AddScenicSpot(@RequestBody ScenicSpot scenicSpot) {
        boolean save = scenicSpotService.save(scenicSpot);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改景点信息
    @PreAuthorize("hasAnyAuthority('ROLE_SCENIC')")
    @PutMapping("updateScenicSpot")
    public R updateScenicSpot(@RequestBody ScenicSpot scenicSpot) {
        scenicSpotService.removePhoto(scenicSpotService.getById(scenicSpot).getPicture());
        boolean flag = scenicSpotService.updateById(scenicSpot);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 删除景点
    @PreAuthorize("hasAnyAuthority('ROLE_SCENIC')")
    @DeleteMapping("{id}")
    public R removeScenicSpot(@PathVariable String id) {
        photosService.removePhotos(id);  // 删除更多的照片
        scenicSpotService.removePhoto(scenicSpotService.getById(id).getPicture());
        boolean flag = scenicSpotService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

}

