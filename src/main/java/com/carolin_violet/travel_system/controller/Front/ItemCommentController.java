package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Comment;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ItemCommentController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/6 10:26
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class ItemCommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private TouristService touristService;


    // 根据mark_id分页查询相关评论
    @GetMapping("comment/{id}/{cur}/{limit}")
    public R getPageComment(@PathVariable String id, @PathVariable long cur, @PathVariable long limit) {

        // 最近5条评论
        Page<Comment> commentPage = new Page<>(cur, limit);
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

            map.put("nickName", tourist.getNickName());
            map.put("id", comment.getId());

            CommentDetailList.add(map);
        }
        return R.ok().data("CommentDetailList", CommentDetailList).data("commentNum", commentNum);
    }

}
