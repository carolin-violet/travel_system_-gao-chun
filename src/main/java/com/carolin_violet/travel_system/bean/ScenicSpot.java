package com.carolin_violet.travel_system.bean;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author carolin-violet
 * @since 2022-05-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ScenicSpot implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 景点id
     */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 景点名称
     */
    private String name;

    /**
     * 景点介绍
     */
    private String description;

    /**
     * 景点图片
     */
    private String picture;

    /**
     * 展示优先级(用户主网站展示),可以自定义划分为1、2、3、4、5这5个等级
     */
    private Integer popular;

    private Float price;

    private Float discountPrice;

    /**
     * 逻辑删除
     */
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer isDeleted;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date modifyTime;


}
