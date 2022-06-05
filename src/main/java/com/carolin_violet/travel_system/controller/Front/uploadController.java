package com.carolin_violet.travel_system.controller.Front;

import com.carolin_violet.travel_system.bean.Comment;
import com.carolin_violet.travel_system.bean.vo.FeedbackVo;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @ClassName PictureController
 * @Description TODO
 * @Author zj
 * @Date 2022/6/5 20:38
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class uploadController {

    @Autowired
    private TravelNoteService travelNoteService;

    @Autowired
    private OssService ossService;

    @Autowired
    private FeedbackService feedbackService;


    @Autowired
    private CommentService commentService;

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

    // 游客添加评论
    @PostMapping("addComment")
    public R addComment(@RequestBody Comment comment) {
        boolean save = commentService.save(comment);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
