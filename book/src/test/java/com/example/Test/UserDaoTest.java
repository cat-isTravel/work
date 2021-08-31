package com.example.Test;

import com.example.bean.User;
import com.example.dao.impl.UserImplement;
import org.junit.Test;

import java.util.Locale;

public class UserDaoTest {

    @Test
    public void queryUserByUserName() {
        UserImplement userImpl = new UserImplement();
        System.out.println(userImpl.queryUserByUserName("admin"));
    }

    @Test
    public void addUser() {
        UserImplement userImpl = new UserImplement();
        User user = new User();
        user.setUsername("Jerry");
        user.setPassword("jerry");
        user.setEmail("jerry@126.com");
        userImpl.addUser(user);
        System.out.println(userImpl.queryUserByUserName("jerry".toUpperCase(Locale.ROOT)));
    }

    @Test
    public void queryUserByNameAndPassword() {
        UserImplement userImpl = new UserImplement();
        System.out.println(userImpl.queryUserByNameAndPassword("admin", "111"));
    }
}