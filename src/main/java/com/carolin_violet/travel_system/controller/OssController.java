package com.carolin_violet.travel_system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.service.OssService;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName OssController
 * @Description TODO
 * @Author zj
 * @Date 2022/5/23 10:38
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/oss/picture")
@CrossOrigin
public class OssController {
    @Autowired
    private OssService ossService;

    @Autowired
    private PhotosService photosService;

    // 新增相关物件时添加相关展示图片
    @PostMapping
    public R uploadOssPicture(MultipartFile file) {
        String url = ossService.uploadFileAvatar(file);
        return R.ok().data("url", url);
    }

    // 根据mark_id查询所有图片
    @GetMapping("{id}/findAll")
    public R findAllPictureByMarkId(@PathVariable String id) {
        QueryWrapper<Photos> wrapper = new QueryWrapper<>();
        wrapper.eq("mark_id", id);
        List<Photos> list = photosService.list(wrapper);

        List<String> photoList = new ArrayList<>();
        for (Photos photo :
                list) {
            photoList.add(photo.getPicture());
        }
        return R.ok().data("items", photoList);
    }

    // 根据物件mark_id添加更多的详情图片
    @PostMapping("addPhoto/{id}")
    public R uploadOssPictureByMarkId(@PathVariable String id, MultipartFile file) {
        String url = ossService.uploadFileAvatar(file);
        Photos photo = new Photos();
        photo.setPicture(url);
        photo.setMarkId(id);
        boolean save = photosService.save(photo);
        if (save) {
            return R.ok().data("url", url);
        } else {
            return R.error();
        }
    }

    // 根据图片url删除
    @PreAuthorize("hasAnyAuthority('ROLE_MANAGER','ROLE_HOTEL','ROLE_DELICACY','ROLE_SCENIC','ROLE_ROUTE','ROLE_NOTICE','ROLE_NOTE','ROLE_FEEDBACK')")
    @DeleteMapping("/{mark_id}")
    public R delPhoto(@PathVariable String mark_id, @RequestParam String url) {

        if (url != null) {
            // 删除阿里云oss的图片
            photosService.removeRemotePhoto(url);

            // 删除图片记录
            QueryWrapper<Photos> wrapper = new QueryWrapper<>();
            wrapper.eq("mark_id", mark_id).eq("picture", url);
            photosService.remove(wrapper);
            return R.ok();
        } else {
            return R.error();
        }
    }

}
