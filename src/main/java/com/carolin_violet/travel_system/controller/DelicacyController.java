package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Delicacy;
import com.carolin_violet.travel_system.bean.conditionQuery.DelicacyQuery;
import com.carolin_violet.travel_system.service.DelicacyService;
import com.carolin_violet.travel_system.service.PhotosService;
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
@RequestMapping("/travel_system/delicacy")
@CrossOrigin
public class DelicacyController {
    @Autowired
    private DelicacyService delicacyService;

    @Autowired
    private PhotosService photosService;

    // 分页查询所有美食
    @GetMapping("findAll/{cur}/{limit}")
    @PreAuthorize("hasAnyAuthority('ROLE_DELICACY')")
    public R findAllDelicacy(@PathVariable long cur, @PathVariable long limit) {
        Page<Delicacy> delicacyPage = new Page<>(cur, limit);
        QueryWrapper<Delicacy> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("popular");

        delicacyService.page(delicacyPage, wrapper);

        long total = delicacyPage.getTotal();
        List<Delicacy> records = delicacyPage.getRecords();
        return R.ok().data("items", records).data("total", total);
    }

    // 添加美食信息
    @PreAuthorize("hasAnyAuthority('ROLE_DELICACY')")
    @PostMapping("addDelicacy")
    public R addDelicacy(@RequestBody Delicacy delicacy) {
        System.out.println("-------------------------------");
        System.out.println(delicacy.getDescription());
        boolean save = delicacyService.save(delicacy);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改美食信息
    @PreAuthorize("hasAnyAuthority('ROLE_DELICACY')")
    @PutMapping("updateDelicacy")
    public R updateDelicacy(@RequestBody Delicacy delicacy) {
        delicacyService.removePhoto(delicacyService.getById(delicacy).getPicture());
        boolean flag = delicacyService.updateById(delicacy);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 删除美食信息
    @PreAuthorize("hasAnyAuthority('ROLE_DELICACY')")
    @DeleteMapping("{id}")
    public R removeDelicacy(@PathVariable String id) {
        photosService.removePhotos(id);  // 删除更多的照片
        delicacyService.removePhoto(delicacyService.getById(id).getPicture());
        boolean flag = delicacyService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}

