package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Comment;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.service.CommentService;
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
    public R findAllDelicacy(@PathVariable long cur, @PathVariable long limit) {
        Page<Comment> commentPage = new Page<>(cur, limit);
        QueryWrapper<Comment> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");

        commentService.page(commentPage, wrapper);

        long total = commentPage.getTotal();
        List<Comment> records = commentPage.getRecords();
        return R.ok().data("items", records).data("total", total);
    }

    // 逻辑删除评论
    @PreAuthorize("hasAnyAuthority('ROLE_COMMENT')")
    @DeleteMapping("{id}")
    public R removeHotel(@PathVariable String id) {
        boolean flag = commentService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}

