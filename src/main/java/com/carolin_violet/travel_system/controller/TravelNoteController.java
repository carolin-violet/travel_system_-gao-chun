package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.TravelNote;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.TravelNoteService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
@RequestMapping("/api/travel-note")
public class TravelNoteController {

    @Autowired
    private TravelNoteService travelNoteService;

    // 分页查询游记
    @PreAuthorize("hasAnyAuthority('ROLE_NOTE')")
    @RequestMapping("pageNote/{current}/{limit}")
    public R getPageNote(@PathVariable long current, @PathVariable long limit) {
        Page<TravelNote> travelNotePage = new Page<>(current, limit);

        QueryWrapper<TravelNote> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        travelNoteService.page(travelNotePage, wrapper);

        long total = travelNotePage.getTotal();

        List<TravelNote> records = travelNotePage.getRecords();

        return R.ok().data("total", total).data("rows", records);

    }


    // 添加游记
    @PreAuthorize("hasAnyAuthority('ROLE_NOTE')")
    @PostMapping("addNote")
    public R addNote(@RequestBody TravelNoteVo travelNoteVo) {
        travelNoteService.addNote(travelNoteVo);
        return R.ok();
    }

    // 删除游记
    @PreAuthorize("hasAnyAuthority('ROLE_NOTE')")
    @DeleteMapping("{id}")
    public R removeNote(@PathVariable String id) {
        travelNoteService.removePhotos(id);
        travelNoteService.removeById(id);
        return R.ok();
    }
}
