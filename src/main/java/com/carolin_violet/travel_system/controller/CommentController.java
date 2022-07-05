package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Comment;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.service.CommentService;
import com.carolin_violet.travel_system.utils.BaiDuSentiment;
import com.carolin_violet.travel_system.utils.R;
import com.google.gson.JsonObject;
import org.json.JSONArray;
import org.json.JSONObject;
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
 * @since 2022-05-30
 */
@RestController
@RequestMapping("/travel_system/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    // 分页查询查看所有评论
    @GetMapping("findAll/{cur}/{limit}")
    @PreAuthorize("hasAnyAuthority('ROLE_COMMENT')")
    public R findAllComment(@PathVariable long cur, @PathVariable long limit) {
        Page<Comment> commentPage = new Page<>(cur, limit);
        QueryWrapper<Comment> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        commentService.page(commentPage, wrapper);

        long total = commentPage.getTotal();
        List<Comment> records = commentPage.getRecords();
        return R.ok().data("rows", records).data("total", total);
    }

    // 逻辑删除评论
    @PreAuthorize("hasAnyAuthority('ROLE_COMMENT')")
    @DeleteMapping("{id}")
    public R removeComment(@PathVariable String id) {
        boolean flag = commentService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 查找没有进行情感分析的评论进行情感分析
    @PreAuthorize("hasAnyAuthority('ROLE_COMMENT')")
    @PostMapping("analyse-sentiment")
    public R analyseSentiment() {
        Integer count = 0;
        List<Comment> list = commentService.list(null);
        for (Comment comment : list) {
            if (comment.getSentiment() == null) {
                JSONObject sentimentRes = new BaiDuSentiment().getSentimentRes(comment.getComment());
                Object o = sentimentRes.getJSONArray("items").getJSONObject(0).get("sentiment");
                Integer sentiment = (Integer) o;
                comment.setSentiment(sentiment);
                commentService.updateById(comment);
                // 百度云免费接口每次只能处理2条
                count += 1;
                if (count == 2) return R.ok();
            }
        }
        return R.ok();
    }
}

