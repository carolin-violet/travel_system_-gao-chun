package com.carolin_violet.travel_system.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.DeleteObjectsRequest;
import com.aliyun.oss.model.DeleteObjectsResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Photos;
import com.carolin_violet.travel_system.bean.TravelNote;
import com.carolin_violet.travel_system.bean.vo.TravelNoteVo;
import com.carolin_violet.travel_system.handler.MyException;
import com.carolin_violet.travel_system.mapper.TravelNoteMapper;
import com.carolin_violet.travel_system.service.PhotosService;
import com.carolin_violet.travel_system.service.TravelNoteService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class TravelNoteServiceImpl extends ServiceImpl<TravelNoteMapper, TravelNote> implements TravelNoteService {

    @Autowired
    private PhotosService photosService;


    // 添加游记
    @Override
    public void addNote(TravelNoteVo travelNoteVo) {

        // 获取图片列表
        List<String> photoList = travelNoteVo.getPhotoUrlList();

        // 添加游记获取id
        TravelNote travelNote = new TravelNote();
        BeanUtils.copyProperties(travelNoteVo, travelNote);
        int insert = baseMapper.insert(travelNote);
        if (insert == 0) {
            throw new MyException(20001, "上传游记失败");
        }

        String id = travelNote.getId();

        // 添加图片
        for (int i = 0; i < photoList.size(); i++) {
            Photos photo = new Photos();
            photo.setMarkId(id);
            photo.setPicture(photoList.get(i));
            boolean save = photosService.save(photo);
            if (!save) {
                throw new MyException(20001, "添加图片失败");
            }
        }
    }

}
