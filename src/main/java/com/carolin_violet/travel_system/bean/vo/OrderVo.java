package com.carolin_violet.travel_system.bean.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName OrderVo
 * @Description TODO
 * @Author zj
 * @Date 2022/6/28 10:07
 * @Version 1.0
 */

@Data
public class OrderVo {
    private String mark;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "GMT+8")
    private Date date;
}
