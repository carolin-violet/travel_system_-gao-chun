package com.carolin_violet.travel_system.bean.vo;

import lombok.Data;

/**
 * @ClassName OrderVo2
 * @Description TODO
 * @Author zj
 * @Date 2022/6/29 15:39
 * @Version 1.0
 */

@Data
public class OrderVo2 {

    // 商品id
    private String id;

    // 商品信息(名称，主题)
    private String title;

    // 商品单价
    private Float price;

    // 商品折扣价
    private Float discountPrice;

    // 商品总金额
    private Float amount;
}
