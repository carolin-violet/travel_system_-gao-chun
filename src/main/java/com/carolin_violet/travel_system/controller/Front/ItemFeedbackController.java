package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Feedback;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.service.FeedbackService;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.service.TouristService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ItemFeedbackController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:46
 * @Version 1.0
 */
@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemFeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private PhotosService photosService;

    @Autowired
    private TouristService touristService;

    // 分页查询反馈信息
    @GetMapping("feedback/{cur}/{limit}/{tourist_id}")
    public R getFeedback(@PathVariable long cur, @PathVariable long limit, @PathVariable String tourist_id) {
        Page<Feedback> feedbackPage = new Page<>(cur, limit);
        QueryWrapper<Feedback> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        if (tourist_id != null) wrapper.eq("tourist_id", tourist_id);


        feedbackService.page(feedbackPage, wrapper);

        List<Feedback> records = feedbackPage.getRecords();
        long total = feedbackPage.getTotal();

        List feedbackList = new ArrayList();
        for (Feedback feedback : records) {
            Map map = new HashMap();

            map.put("content", feedback.getContent());
            map.put("time", feedback.getCreateTime());
            map.put("id", feedback.getId());

            QueryWrapper<Photos> wrapper1 = new QueryWrapper<>();
            wrapper1.eq("mark_id", feedback.getId());
            List<Photos> photos = photosService.list(wrapper1);
            map.put("photos", photos);


            QueryWrapper<Tourist> wrapper2 = new QueryWrapper<>();
            wrapper2.eq("id", feedback.getTouristId());
            Tourist tourist = touristService.getOne(wrapper2);
            map.put("nickName", tourist.getNickName());

            feedbackList.add(map);

        }
        return R.ok().data("total", total).data("items", feedbackList);
    }

    @DeleteMapping("delFeedback/{id}")
    public R delFeedback(@PathVariable String id) {
        photosService.removePhotos(id);
        feedbackService.removeById(id);
        return R.ok();
    }
}
