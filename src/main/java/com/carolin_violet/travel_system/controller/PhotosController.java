package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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
@RequestMapping("/travel_system/photos")
public class PhotosController {
    @Autowired
    private PhotosService photosService;

    // 根据游记、反馈等的id获取相关所有图片对象信息(目前好像并没有用到)
    @RequestMapping("{id}")
    public R getPhotos(@PathVariable String id) {
        QueryWrapper<Photos> wrapper = new QueryWrapper<>();
        wrapper.eq("mark_id", id).select("picture", "id");
        List<Photos> list = photosService.list(wrapper);
        return R.ok().data("pictures", list);
    }
}

