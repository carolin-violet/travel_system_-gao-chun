package com.carolin_violet.travel_system.controller.Front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Tourist;
import com.carolin_violet.travel_system.bean.vo.TouristVo;
import com.carolin_violet.travel_system.service.*;
import com.carolin_violet.travel_system.utils.JwtUtils;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName BaseInfo
 * @Description TODO
 * @Author zj
 * @Date 2022/6/5 20:36
 * @Version 1.0
 */

@RestController
@RequestMapping("/travel_system/front")
@CrossOrigin
public class BaseInfoController {

    @Autowired
    private TouristService touristService;

    // 游客登录
    @PostMapping("login")
    public R login(@RequestBody TouristVo touristVo) {
        QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
        System.out.println(touristVo.toString());
        wrapper.eq("telephone", touristVo.getTelephone());
        Tourist tourist = touristService.getOne(wrapper);
        // 判断游客是否存在
        if (tourist!=null) {
            // 判断密码是否正确
            boolean matches = BCrypt.checkpw(touristVo.getPassword(), tourist.getPassword());
            if (matches) {
                String token = JwtUtils.getJwtToken(tourist.getId(), tourist.getNickName());
                return R.ok().data("token", token).data("info", tourist);
            } else {
                return R.error().message("密码错误");
            }
        } else {
            return R.error().message("登录失败");
        }
    }

    // 游客注册
    @PostMapping("register")
    public R register(@RequestBody Tourist tourist) {
        QueryWrapper<Tourist> wrapper = new QueryWrapper<>();
        wrapper.eq("telephone", tourist.getTelephone());
        Tourist one = touristService.getOne(wrapper);
        if (one != null) {
            return R.error().message("该手机号已经被注册");
        }
        tourist.setPassword(BCrypt.hashpw(tourist.getPassword(), BCrypt.gensalt()));
        boolean save = touristService.save(tourist);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 游客修改信息
    @PutMapping("updateInfo")
    public R updateInfo(@RequestBody Tourist tourist) {
        tourist.setPassword(BCrypt.hashpw(tourist.getPassword(), BCrypt.gensalt()));
        boolean save = touristService.updateById(tourist);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
