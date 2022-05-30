package com.carolin_violet.travel_system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.bean.vo.FeedbackVo;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.FeedbackService;
import com.carolin_violet.travel_system.service.OssService;
import com.carolin_violet.travel_system.service.TouristService;
import com.carolin_violet.travel_system.service.TravelNoteService;
import com.carolin_violet.travel_system.utils.JwtUtils;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 *  所有前台访问的接口
 * </p>
 *
 * @author carolin-violet
 * @since 2022-05-30
 */
@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class FrontController {

    @Autowired
    private TravelNoteService travelNoteService;

    @Autowired
    private OssService ossService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private TouristService touristService;

    // 游客登录
    @PostMapping("login")
    public R login(@RequestBody Tourist tourist) {
        QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
        wrapper.eq("telephone", tourist.getTelephone()).eq("password", tourist.getPassword());
        Tourist tourist1 = touristService.getOne(wrapper);
        if (tourist1!=null) {
            String token = JwtUtils.getJwtToken(tourist1.getId(), tourist1.getNickName());
            return R.ok().data("token", token);
        } else {
            return R.error().message("登录失败");
        }
    }

    // 游客注册
    @PostMapping("register")
    public R register(@RequestBody Tourist tourist) {
        boolean save = touristService.save(tourist);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }


    // 游客修改信息
    @PostMapping("updateInfo")
    public R updateInfo(@RequestBody Tourist tourist) {
        boolean save = touristService.save(tourist);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }


    // 游客上传图片
    @PostMapping("upload/picture")
    public R uploadTouristPicture(MultipartFile file) {
        String url = ossService.uploadFileAvatar(file);
        return R.ok().data("url", url);
    }


    // 添加游记
    @PostMapping("addNote")
    public R addNote(@RequestBody TravelNoteVo travelNoteVo) {
        travelNoteService.addNote(travelNoteVo);
        return R.ok();
    }


    // 上传反馈
    @PostMapping("addFeedback")
    public R addFeedback(@RequestBody FeedbackVo feedbackVo) {
        feedbackService.addFeedback(feedbackVo);
        return R.ok();
    }

    // TODO 。。。。(首屏数据做redis缓存)
    // 获取首屏数据


    // 获取酒店列表数据(简介和封面图)


    // 获取酒店详情数据(评论、轮播图、简介)


    // 获取美食列表数据(简介和封面图)


    // 获取美食详情数据(评论、轮播图、简介)


    // 获取旅馆列表数据(简介和封面图)


    // 获取旅馆详情数据(评论、轮播图、简介)


    // 获取酒店列表数据(简介和封面图)


    // 获取酒店详情数据(评论、轮播图、简介)

}

