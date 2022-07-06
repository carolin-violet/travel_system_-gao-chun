package com.carolin_violet.travel_system.controller.Front;

import com.carolin_violet.travel_system.bean.Comment;
import com.carolin_violet.travel_system.bean.vo.FeedbackVo;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.BaiDuSentiment;
import com.carolin_violet.travel_system.utils.JwtUtils;
import com.carolin_violet.travel_system.utils.R;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName PictureController
 * @Description 可上传的操作
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
    public R uploadTouristPicture(MultipartFile file, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.checkToken(httpServletRequest)) {
            return R.error().message("身份错误！");
        }

        String url = ossService.uploadFileAvatar(file);
        return R.ok().data("url", url);
    }


    // 添加游记
    @PostMapping("addNote")
    public R addNote(@RequestBody TravelNoteVo travelNoteVo, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(travelNoteVo.getTouristId())) {
            return R.error().message("身份错误！");
        }

        travelNoteService.addNote(travelNoteVo);
        return R.ok();
    }


    // 上传反馈
    @PostMapping("addFeedback")
    public R addFeedback(@RequestBody FeedbackVo feedbackVo, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(feedbackVo.getTouristId())) {
            return R.error().message("身份错误！");
        }

        feedbackService.addFeedback(feedbackVo);
        return R.ok();
    }

    // 游客添加评论
    @PostMapping("addComment")
    public R addComment(@RequestBody Comment comment, HttpServletRequest httpServletRequest) {

        // 身份验证
        if (!JwtUtils.getMemberIdByJwtToken(httpServletRequest).equals(comment.getTouristId())) {
            return R.error().message("身份错误！");
        }


        // 评论情感分析
        JSONObject sentimentRes = new BaiDuSentiment().getSentimentRes(comment.getComment());
        Object o = sentimentRes.getJSONArray("items").getJSONObject(0).get("sentiment");
        Integer sentiment = (Integer) o;
        comment.setSentiment(sentiment);

        boolean save = commentService.save(comment);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
