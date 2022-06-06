package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Notice;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.service.NoticeService;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.utils.R;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName ItemNoticeController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:46
 * @Version 1.0
 */
@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemNoticeController {

    @Autowired
    private NoticeService noticeService;

    // 分页查询公告信息
    @GetMapping("notice/{cur}/{limit}")
    public R getNotice(@PathVariable long cur, @PathVariable long limit) {
        Page<Notice> noticePage = new Page<>(cur, limit);
        QueryWrapper<Notice> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        noticeService.page(noticePage, wrapper);

        long total = noticePage.getTotal();
        List<Notice> records = noticePage.getRecords();

        return R.ok().data("items", records).data("total", total);
    }
}
