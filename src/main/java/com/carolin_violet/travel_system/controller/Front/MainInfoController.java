package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.*;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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
public class MainInfoController {

    @Autowired
    private DelicacyService delicacyService;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private ScenicSpotService scenicSpotService;

    @Autowired
    private PhotosService photosService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private TouristService touristService;

    // 获取所有旅馆信息(旅馆主页)
    @GetMapping("hotels")
    public R getHotels() {
        List<Hotel> hotelList = hotelService.list(null);
        return R.ok().data("hotelList", hotelList);
    }

    // 获取所有美食信息(美食主页)
    @GetMapping("delicacies")
    public R getDelicacies() {
        List<Delicacy> delicacyList = delicacyService.list(null);
        return R.ok().data("delicacyList", delicacyList);
    }

    // 获取所有景点信息(景点主页)
    @GetMapping("scenic-spots")
    public R getScenicSpots() {
        List<ScenicSpot> scenicSpotList = scenicSpotService.list(null);
        return R.ok().data("scenicSpotList", scenicSpotList);
    }

    // 获取旅馆详情(旅馆主页),包括5张轮播图壁纸,详情描述、最近的5条评论，好评总数、差评总数
    @GetMapping("hotel/{id}")
    public R getHotelDetail(@PathVariable String id) {
        // 5张轮播图
        QueryWrapper<Photos> wrapper1 = new QueryWrapper<>();
        wrapper1.eq("mark_id", id).orderByDesc("create_time").last("limit 5");
        List<Photos> photosList = photosService.list(wrapper1);

        // 旅馆信息
        Hotel hotel = hotelService.getById(id);

        // 最近5条评论
        Page<Comment> commentPage = new Page<>(1, 5);
        QueryWrapper<Comment> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("mark_id", id).orderByDesc("create_time");
        commentService.page(commentPage, wrapper2);
        List<Comment> records = commentPage.getRecords();
        long commentNum = commentPage.getTotal();

        // 获取好评数与差评数
        QueryWrapper<Comment> wrapper3 = new QueryWrapper<>();
        wrapper3.eq("sentiment", 2).eq("mark_id", id);
        int positiveNum = commentService.count(wrapper3);
        QueryWrapper<Comment> wrapper4 = new QueryWrapper<>();
        wrapper4.eq("sentiment", 0).eq("mark_id", id);
        int negativeNum = commentService.count(wrapper4);

        return R.ok().data("photosList", photosList)
                .data("description", hotel.getDescription())
                .data("positiveNum", positiveNum)
                .data("negativeNum", negativeNum)
                .data("commentNum", commentNum);
    }


    // 获取美食详情(美食主页),包括5张轮播图壁纸,详情描述、最近的5条评论，好评总数、差评总数
    @GetMapping("delicacy/{id}")
    public R getDelicacyDetail(@PathVariable String id) {
        // 5张轮播图
        QueryWrapper<Photos> wrapper1 = new QueryWrapper<>();
        wrapper1.eq("mark_id", id).orderByDesc("create_time").last("limit 5");
        List<Photos> photosList = photosService.list(wrapper1);

        // 美食信息
        Delicacy delicacy = delicacyService.getById(id);

        // 最近5条评论
        Page<Comment> commentPage = new Page<>(1, 5);
        QueryWrapper<Comment> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("mark_id", id).orderByDesc("create_time");
        commentService.page(commentPage, wrapper2);
        List<Comment> records = commentPage.getRecords();
        long commentNum = commentPage.getTotal();

        List CommentDetailList = new ArrayList();
        for (Comment comment : records) {
            Map<String, String> map = new HashMap<>();
            map.put("comment", comment.getComment());
            map.put("time", comment.getCreateTime().toString());

            QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
            wrapper.eq("id", comment.getTouristId());
            Tourist tourist = touristService.getOne(wrapper);

            map.put("name", tourist.getNickName());

            CommentDetailList.add(map);
        }

        // 获取好评数与差评数
        QueryWrapper<Comment> wrapper3 = new QueryWrapper<>();
        wrapper3.eq("sentiment", 2).eq("mark_id", id);
        int positiveNum = commentService.count(wrapper3);
        QueryWrapper<Comment> wrapper4 = new QueryWrapper<>();
        wrapper4.eq("sentiment", 0).eq("mark_id", id);
        int negativeNum = commentService.count(wrapper4);

        return R.ok().data("photosList", photosList)
                .data("description", delicacy.getDescription())
                .data("CommentDetailList", CommentDetailList)
                .data("positiveNum", positiveNum)
                .data("negativeNum", negativeNum)
                .data("commentNum", commentNum);
    }

    // 获取景点详情(景点主页),包括5张轮播图壁纸,详情描述、最近的5条评论，好评总数、差评总数
    @GetMapping("scenic-spot/{id}")
    public R getScenicSpotDetail(@PathVariable String id) {
        // 5张轮播图
        QueryWrapper<Photos> wrapper1 = new QueryWrapper<>();
        wrapper1.eq("mark_id", id).orderByDesc("create_time").last("limit 5");
        List<Photos> photosList = photosService.list(wrapper1);

        // 景点信息
        ScenicSpot scenicSpot = scenicSpotService.getById(id);

        // 最近5条评论
        Page<Comment> commentPage = new Page<>(1, 5);
        QueryWrapper<Comment> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("mark_id", id).orderByDesc("create_time");
        commentService.page(commentPage, wrapper2);
        List<Comment> records = commentPage.getRecords();
        long commentNum = commentPage.getTotal();

        List CommentDetailList = new ArrayList();
        for (Comment comment : records) {
            Map<String, String> map = new HashMap<>();
            map.put("comment", comment.getComment());
            map.put("time", comment.getCreateTime().toString());

            QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
            wrapper.eq("id", comment.getTouristId());
            Tourist tourist = touristService.getOne(wrapper);

            map.put("name", tourist.getNickName());

            CommentDetailList.add(map);
        }

        // 获取好评数与差评数
        QueryWrapper<Comment> wrapper3 = new QueryWrapper<>();
        wrapper3.eq("sentiment", 2).eq("mark_id", id);
        int positiveNum = commentService.count(wrapper3);
        QueryWrapper<Comment> wrapper4 = new QueryWrapper<>();
        wrapper4.eq("sentiment", 0).eq("mark_id", id);
        int negativeNum = commentService.count(wrapper4);

        return R.ok().data("photosList", photosList)
                .data("description", scenicSpot.getDescription())
                .data("CommentDetailList", CommentDetailList)
                .data("positiveNum", positiveNum)
                .data("negativeNum", negativeNum)
                .data("commentNum", commentNum)
                .data("price",scenicSpot.getPrice())
                .data("discountPrice", scenicSpot.getDiscountPrice());
    }

}
