package com.carolin_violet.travel_system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.carolin_violet.travel_system.bean.Manager;
import com.carolin_violet.travel_system.bean.security.SecurityUser;
import com.carolin_violet.travel_system.security.TokenManager;
import com.carolin_violet.travel_system.service.ManagerService;
import com.carolin_violet.travel_system.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName ManagerInfoController
 * @Description TODO
 * @Author zj
 * @Date 2022/5/22 9:10
 * @Version 1.0
 */
@RestController
@RequestMapping("/travel_system/manager")
@CrossOrigin
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @Autowired
    private RedisTemplate redisTemplate;

    // 查询所有管理员信息
    @PreAuthorize("hasAnyAuthority('ROLE_MANAGER')")
    @GetMapping("findAll")
    public R findAllManager() {
        List<Manager> list = managerService.list(null);
        return R.ok().data("items", list);
    }

    // 添加管理员信息
    @PreAuthorize("hasAnyAuthority('ROLE_MANAGER')")
    @PostMapping("addManager")
    public R addManager(@RequestBody Manager manager) {
        // 用Bcrypt对密码加密
        manager.setPassword(new BCryptPasswordEncoder().encode(manager.getPassword()));
        boolean save = managerService.save(manager);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 修改管理员信息
    @PreAuthorize("hasAnyAuthority('ROLE_MANAGER')")
    @PutMapping("updateManager")
    public R updateManager(@RequestBody Manager manager) {
        // 用Bcrypt对密码加密
        manager.setPassword(new BCryptPasswordEncoder().encode(manager.getPassword()));
        boolean flag = managerService.updateById(manager);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 逻辑删除管理员
    @PreAuthorize("hasAnyAuthority('ROLE_MANAGER')")
    @DeleteMapping("{id}")
    public R removeManger(@PathVariable String id) {
        boolean flag = managerService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    // 登录后获取管理员信息
    @GetMapping("getInfo")
    public R getInfo(@RequestParam String token) {
        if (token != null) {
            //从token获取手机号
            String username = new TokenManager().getUserFromToken(token);
             SecurityUser user = (SecurityUser) redisTemplate.opsForValue().get("securityUser:" + username);
            QueryWrapper<Manager> wrapper = new QueryWrapper<>();
            wrapper.eq("telephone", username);
            Manager manager = managerService.getOne(wrapper);
            return R.ok().data("info", manager).data("roles", user.getPermissionValueList());
        } else {
            return R.error().message("获取信息失败");
        }
    }

}
