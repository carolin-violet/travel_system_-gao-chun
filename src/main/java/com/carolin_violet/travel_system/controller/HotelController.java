package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.carolin_violet.travel_system.bean.Hotel;
import com.carolin_violet.travel_system.bean.conditionQuery.HotelQuery;
import com.carolin_violet.travel_system.service.HotelService;
import com.carolin_violet.travel_system.service.PhotosService;
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
 * @since 2022-05-22
 */
@RestController
@RequestMapping("/travel_system/hotel")
public class HotelController {
    @Autowired
    private HotelService hotelService;

    @Autowired
    private PhotosService photosService;

    // 查找所有旅馆, 按展示优先级降序排序
    @PreAuthorize("hasAnyAuthority('ROLE_HOTEL')")
    @GetMapping("findAll/{cur}/{limit}")
    public R findAllHotel(@PathVariable long cur, @PathVariable long limit) {
        Page<Hotel> hotelPage = new Page<>(cur, limit);
        QueryWrapper<Hotel> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("popular");

        hotelService.page(hotelPage, wrapper);

        long total = hotelPage.getTotal();
        List<Hotel> records = hotelPage.getRecords();
        return R.ok().data("items", records).data("total", total);
    }

    // 添加旅馆
    @PreAuthorize("hasAnyAuthority('ROLE_HOTEL')")
    @PostMapping("addHotel")
    public R addHotel(@RequestBody Hotel hotel) {
        boolean save = hotelService.save(hotel);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改旅馆信息
    @PreAuthorize("hasAnyAuthority('ROLE_HOTEL')")
    @PutMapping("updateHotel")
    public R updateHotel(@RequestBody Hotel hotel) {
        hotelService.removePhoto(hotelService.getById(hotel).getPicture());
        boolean flag = hotelService.updateById(hotel);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 逻辑删除旅馆
    @PreAuthorize("hasAnyAuthority('ROLE_HOTEL')")
    @DeleteMapping("{id}")
    public R removeHotel(@PathVariable String id) {
        photosService.removePhotos(id);  // 删除更多的照片
        hotelService.removePhoto(hotelService.getById(id).getPicture());
        boolean flag = hotelService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}

