package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.bean.TravelNote;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.service.TouristService;
import com.carolin_violet.travel_system.service.TravelNoteService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ItemNoteController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:46
 * @Version 1.0
 */
@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemNoteController {

    @Autowired
    private TravelNoteService travelNoteService;

    @Autowired
    private PhotosService photosService;

    @Autowired
    private TouristService touristService;

    // 分页查询游记信息
    @GetMapping("note/{cur}/{limit}/{tourist_id}")
    public R getNote(@PathVariable long cur, @PathVariable long limit, @PathVariable String tourist_id) {
        Page<TravelNote> travelNotePage = new Page<>(cur, limit);
        QueryWrapper<TravelNote> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        if (tourist_id != null) wrapper.eq("tourist_id", tourist_id);

        travelNoteService.page(travelNotePage, wrapper);

        List<TravelNote> records = travelNotePage.getRecords();
        long total = travelNotePage.getTotal();

        List noteList = new ArrayList();
        for (TravelNote travelNote : records) {
            Map map = new HashMap();

            map.put("content", travelNote.getContent());
            map.put("time", travelNote.getCreateTime());
            map.put("id", travelNote.getId());

            QueryWrapper<Photos> wrapper1 = new QueryWrapper<>();
            wrapper1.eq("mark_id", travelNote.getId());
            List<Photos> photos = photosService.list(wrapper1);
            map.put("photos", photos);


            QueryWrapper<Tourist> wrapper2 = new QueryWrapper<>();
            wrapper2.eq("id", travelNote.getTouristId());
            Tourist tourist = touristService.getOne(wrapper2);
            map.put("nickName", tourist.getNickName());

            noteList.add(map);

        }
        return R.ok().data("total", total).data("items", noteList);
    }

    // 删除游记
    @DeleteMapping("delNote/{id}")
    public R delNote(@PathVariable String id) {
        photosService.removePhotos(id);
        travelNoteService.removeById(id);
        return R.ok();
    }
}
