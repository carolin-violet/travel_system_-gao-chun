package com.carolin_violet.travel_system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.*;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName ChartController
 * @Description TODO
 * @Author zj
 * @Date 2022/7/3 11:14
 * @Version 1.0
 */
@RestController
@RequestMapping("/travel_system/chart")
@CrossOrigin
public class ChartController {

    @Autowired
    private HotelService hotelService;

    @Autowired
    private DelicacyService delicacyService;

    @Autowired
    private ScenicSpotService scenicSpotService;

    @Autowired
    private TouristRouteService touristRouteService;

    @Autowired
    private TouristService touristService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private TravelNoteService travelNoteService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private OrderFormService orderFormService;

    // 查询管理主页的所有数据
    @GetMapping("statistics")
    public R getStatistics() {
        // 查询计数板的信息
        int touristCount = touristService.count(null);
        int commentCount = commentService.count(null);
        int noteCount = travelNoteService.count(null);
        int feedbackCount = feedbackService.count(null);
        Map<String, Integer> panel = new HashMap<>();
        panel.put("touristCount", touristCount);
        panel.put("commentCount", commentCount);
        panel.put("noteCount", noteCount);
        panel.put("feedbackCount", feedbackCount);

        // 查询景点、美食、旅馆、线路的总数统计
        int scenicSpotCount = scenicSpotService.count(null);
        int hotelCount = hotelService.count(null);
        int delicacyCount = delicacyService.count(null);
        int routeCount = touristRouteService.count(null);
        Map<String, Integer> baseCount = new HashMap<>();
        baseCount.put("景点", scenicSpotCount);
        baseCount.put("旅馆", hotelCount);
        baseCount.put("美食", delicacyCount);
        baseCount.put("拼团线路", routeCount);

        // 支付订单与未支付订单占比
        QueryWrapper<OrderForm> isPaidWrapper = new QueryWrapper<>();
        isPaidWrapper.eq("is_paid", 0);
        int not_paid = orderFormService.count(isPaidWrapper);
        int orderCount = orderFormService.count(null);
        int paid = orderCount - not_paid;
        Map<String, Integer> isPaid = new HashMap<>();
        isPaid.put("已支付", paid);
        isPaid.put("未支付", not_paid);

        // 门票和拼团的订单总数占比
        QueryWrapper<OrderForm> markWrapper = new QueryWrapper<>();
        markWrapper.eq("mark", "scenic");
        int scenicOrderCount = orderFormService.count(markWrapper);
        int routeOrderCount = orderCount - scenicOrderCount;
        Map<String, Integer> scenicAndRoute = new HashMap<>();
        scenicAndRoute.put("门票", scenicOrderCount);
        scenicAndRoute.put("拼团", routeOrderCount);

        // 评论统计
        List<Map> allCommentInfo = new ArrayList<>();
        // 景点相关评论
        List<ScenicSpot> scenicSpotList = scenicSpotService.list(null);
        for (ScenicSpot scenicSpot: scenicSpotList) {
            QueryWrapper<Comment> wrapper = new QueryWrapper<>();
            wrapper.eq("mark_id", scenicSpot.getId());
            int singleAllCount = commentService.count(wrapper);
            wrapper.eq("sentiment", 2);
            int positiveCount = commentService.count(wrapper);
            int negativeCount = singleAllCount - positiveCount;
            List<Integer> commentList = new ArrayList<>();
            commentList.add(positiveCount);
            commentList.add(negativeCount);
            Map<String, Object> singleComment = new HashMap<>();
            singleComment.put("mark", "景点");
            singleComment.put("name", scenicSpot.getName());
            singleComment.put("value", commentList);

            allCommentInfo.add(singleComment);
        }
        // 美食相关评论
        List<Delicacy> delicacyList = delicacyService.list(null);
        for (Delicacy delicacy: delicacyList) {
            QueryWrapper<Comment> wrapper = new QueryWrapper<>();
            wrapper.eq("mark_id", delicacy.getId());
            int singleAllCount = commentService.count(wrapper);
            wrapper.eq("sentiment", 2);
            int positiveCount = commentService.count(wrapper);
            int negativeCount = singleAllCount - positiveCount;
            List<Integer> commentList = new ArrayList<>();
            commentList.add(positiveCount);
            commentList.add(negativeCount);
            Map<String, Object> singleComment = new HashMap<>();
            singleComment.put("mark", "美食");
            singleComment.put("name", delicacy.getName());
            singleComment.put("value", commentList);

            allCommentInfo.add(singleComment);
        }
        // 旅馆相关评论
        List<Hotel> hotelList = hotelService.list(null);
        for (Hotel hotel: hotelList) {
            QueryWrapper<Comment> wrapper = new QueryWrapper<>();
            wrapper.eq("mark_id", hotel.getId());
            int singleAllCount = commentService.count(wrapper);
            wrapper.eq("sentiment", 2);
            int positiveCount = commentService.count(wrapper);
            int negativeCount = singleAllCount - positiveCount;
            List<Integer> commentList = new ArrayList<>();
            commentList.add(positiveCount);
            commentList.add(negativeCount);
            Map<String, Object> singleComment = new HashMap<>();
            singleComment.put("mark", "旅馆");
            singleComment.put("name", hotel.getName());
            singleComment.put("value", commentList);

            allCommentInfo.add(singleComment);
        }
        // 拼团线路相关评论
        List<TouristRoute> touristRouteList = touristRouteService.list(null);
        for (TouristRoute touristRoute: touristRouteList) {
            QueryWrapper<Comment> wrapper = new QueryWrapper<>();
            wrapper.eq("mark_id", touristRoute.getId());
            int singleAllCount = commentService.count(wrapper);
            wrapper.eq("sentiment", 2);
            int positiveCount = commentService.count(wrapper);
            int negativeCount = singleAllCount - positiveCount;
            List<Integer> commentList = new ArrayList<>();
            commentList.add(positiveCount);
            commentList.add(negativeCount);
            Map<String, Object> singleComment = new HashMap<>();
            singleComment.put("mark", "线路");
            singleComment.put("name", touristRoute.getTitle());
            singleComment.put("value", commentList);

            allCommentInfo.add(singleComment);
        }

        // 查询近一年的交易总额

        // 先查询最近12个月
        List<String> dateList = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        // 月份最大为11 最小为0 所以设置初始月份时加1
        // 需要获取到当前月份所以设置初始月份时需要加2
        calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH)+2);
        for (int i = 0; i < 12; i++) {
            calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH)-1);
            // 需要判断月份是否为0  如果0则需要转换成12
            dateList.add(calendar.get(Calendar.YEAR)+"-"+ this.formatMonth(calendar.get(Calendar.MONTH)==0?12:calendar.get(Calendar.MONTH)));
        }

        Map<String, Double> incomeMap = new HashMap<>();
        for (int i = 0; i < dateList.size(); i++) {
            incomeMap.put(dateList.get(i), 0.00);
        }
        // 查询所有数据并格式化订单创建时间
        List<OrderForm> orderFormList = orderFormService.list(null);
        for (int i = 0; i < orderFormList.size(); i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            String strDate = sdf.format(orderFormList.get(i).getCreateTime());
            // 如果订单创建时间在最近12个月内
            if (dateList.contains(strDate)) {
                incomeMap.put(strDate, incomeMap.get(strDate)+orderFormList.get(i).getAmount());
            }
        }

        return R.ok().data("panel", panel)
                .data("baseCount", baseCount)
                .data("isPaid", isPaid)
                .data("scenicAndRoute", scenicAndRoute)
                .data("allCommentInfo", allCommentInfo)
                .data("income", incomeMap);
    }

    // 月份需要加0 则调用此方法
    private String formatMonth (Integer month){
        if(month<10){
            return "0"+month;
        }
        return ""+ month;
    }
}
