package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.TravelNote;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.service.TravelNoteService;
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
@RequestMapping("/travel_system/travel-note")
@CrossOrigin
public class TravelNoteController {

    @Autowired
    private TravelNoteService travelNoteService;

    @Autowired
    private PhotosService photosService;

    // 分页查询游记
    @PreAuthorize("hasAnyAuthority('ROLE_NOTE')")
    @RequestMapping("pageNote/{current}/{limit}/{tourist_id}")
    public R getPageNote(@PathVariable long current, @PathVariable long limit, @PathVariable String tourist_id) {
        Page<TravelNote> travelNotePage = new Page<>(current, limit);

        QueryWrapper<TravelNote> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        if (tourist_id != null) wrapper.eq("tourist_id", tourist_id);

        travelNoteService.page(travelNotePage, wrapper);

        long total = travelNotePage.getTotal();

        List<TravelNote> records = travelNotePage.getRecords();

        return R.ok().data("total", total).data("rows", records);

    }

    // 删除游记
    @PreAuthorize("hasAnyAuthority('ROLE_NOTE')")
    @DeleteMapping("{id}")
    public R removeNote(@PathVariable String id) {
        photosService.removePhotos(id);
        travelNoteService.removeById(id);
        return R.ok();
    }
}
