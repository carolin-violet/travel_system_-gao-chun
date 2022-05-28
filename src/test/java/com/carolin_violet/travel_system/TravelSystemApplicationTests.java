package com.carolin_violet.travel_system;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class TravelSystemApplicationTests {

    @Test
    void contextLoads() {
        String str = "Zj123456!";
        String encodedPassword = new BCryptPasswordEncoder().encode(str);
        System.out.println(encodedPassword);

        // 使用正确密码验证密码是否正确
        boolean flag = new BCryptPasswordEncoder().matches(encodedPassword, str);
        System.out.println(flag);

        // 使用错误密码验证密码是否正确
        flag = new BCryptPasswordEncoder().matches(encodedPassword, "545");
        System.out.println(flag);

    }

}
