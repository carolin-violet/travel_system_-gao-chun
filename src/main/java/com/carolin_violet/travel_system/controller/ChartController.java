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


    @GetMapping("panel")
    public R getPanel() {
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

        return R.ok().data("panel", panel);
    }

    @GetMapping("baseCount")
    public R getBaseCount() {
        // 查询景点、美食、旅馆、线路的总数统计
        List baseCount = new ArrayList();

        int scenicSpotCount = scenicSpotService.count(null);
        int hotelCount = hotelService.count(null);
        int delicacyCount = delicacyService.count(null);
        int routeCount = touristRouteService.count(null);

        Map scenicSpotCountMap = new HashMap();
        scenicSpotCountMap.put("name", "景点");
        scenicSpotCountMap.put("value", scenicSpotCount);
        baseCount.add(scenicSpotCountMap);
        Map hotelCountMap = new HashMap();
        hotelCountMap.put("name", "旅馆");
        hotelCountMap.put("value", hotelCount);
        baseCount.add(hotelCountMap);
        Map delicacyCountMap = new HashMap();
        delicacyCountMap.put("name", "美食");
        delicacyCountMap.put("value", delicacyCount);
        baseCount.add(delicacyCountMap);
        Map routeCountMap = new HashMap();
        routeCountMap.put("name", "线路");
        routeCountMap.put("value", routeCount);
        baseCount.add(routeCountMap);

        return R.ok().data("baseCount", baseCount);
    }

    @GetMapping("isPaid")
    public R getIsPaid() {

        // 支付订单与未支付订单占比
        List isPaidList = new ArrayList();
        QueryWrapper<OrderForm> isPaidWrapper = new QueryWrapper<>();
        isPaidWrapper.eq("is_paid", 0);
        int not_paid = orderFormService.count(isPaidWrapper);
        int orderCount = orderFormService.count(null);
        int paid = orderCount - not_paid;

        Map paidMap = new HashMap();
        paidMap.put("name", "已支付");
        paidMap.put("value", paid);
        isPaidList.add(paidMap);

        Map notPaidMap = new HashMap();
        notPaidMap.put("name", "未支付");
        notPaidMap.put("value", not_paid);
        isPaidList.add(notPaidMap);

        return R.ok().data("isPaid", isPaidList);
    }

    @GetMapping("scenicAndRoute")
    public R getScenicAndRoute() {

        // 门票和拼团的订单总数占比
        List scenicAndRouteList = new ArrayList();
        QueryWrapper<OrderForm> markWrapper = new QueryWrapper<>();
        markWrapper.eq("mark", "scenic");
        int scenicOrderCount = orderFormService.count(markWrapper);
        int orderCount = orderFormService.count(null);
        int routeOrderCount = orderCount - scenicOrderCount;

        Map scenicMap = new HashMap();
        scenicMap.put("name", "景点门票");
        scenicMap.put("value", scenicOrderCount);
        scenicAndRouteList.add(scenicMap);

        Map routeMap = new HashMap();
        routeMap.put("name", "线路拼团");
        routeMap.put("value", routeOrderCount);
        scenicAndRouteList.add(routeMap);

        return R.ok().data("scenicAndRoute", scenicAndRouteList);
    }

    @GetMapping("comment")
    public R getComment() {
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

        return R.ok().data("comment", allCommentInfo);
    }

    // 查询近一年的交易总额
    @GetMapping("income")
    public R getIncome() {
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
            // 去年12月显示今年12月的处理方法
            if (dateList.get(i).split("-")[1].equals("12") && i != 11) {
                System.out.println(dateList.get(i));
                dateList.set(i, calendar.get(Calendar.YEAR) -1  + "-12");
            }
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
        return R.ok().data("income", incomeMap);
    }

    // 月份需要加0 则调用此方法
    private String formatMonth (Integer month){
        if(month<10){
            return "0"+month;
        }
        return ""+ month;
    }
}
