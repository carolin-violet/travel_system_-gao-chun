package com.carolin_violet.travel_system.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.DeleteObjectsRequest;
import com.aliyun.oss.model.DeleteObjectsResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Feedback;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.bean.vo.FeedbackVo;
import com.carolin_violet.travel_system.mapper.FeedbackMapper;
import com.carolin_violet.travel_system.service.FeedbackService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.utils.OssPropertiesUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author carolin-violet
 * @since 2022-05-22
 */
@Service
public class FeedbackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements FeedbackService {

    @Autowired
    private PhotosService photosService;

    // 添加反馈
    @Override
    public void addFeedback(FeedbackVo feedbackVo) {
        // 1. 添加反馈获取id
        Feedback feedback = new Feedback();
        BeanUtils.copyProperties(feedbackVo, feedback);
        baseMapper.insert(feedback);

        String id = feedback.getId();

        // 2.判断添加图片
        List<String> photoList = feedbackVo.getPhotoUrlList();
        if (photoList.size() > 0) {
            for (int i = 0; i < photoList.size(); i++) {
                Photos photo = new Photos();
                photo.setMarkId(id);
                photo.setPicture(photoList.get(i));
                photosService.save(photo);
            }
        }

    }
}
