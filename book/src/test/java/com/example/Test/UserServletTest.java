package com.example.Test;

import com.example.bean.User;
import com.example.service.controller.UserService;
import com.example.service.impl.UserImplService;
import org.junit.Test;

public class UserServletTest {
    UserService userService = new UserImplService();
    @Test
    public void registUser() {
        userService.registUser(new User(null, "Tom", "123456", "Tom@126.com"));
    }

    @Test
    public void login() {
        User login = userService.login(new User(null, "Jerry", "jerry", null));
        if (login != null){
        System.out.println("登录成功");
        }else System.out.println("登录失败");
    }

    @Test
    public void inspectUsername() {
        if (userService.inspectUsername("11")){
            System.out.println("用户名已存在");
        }
    }
}