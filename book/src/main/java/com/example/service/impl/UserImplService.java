package com.example.service.impl;

import com.example.bean.User;
import com.example.dao.UserDao;
import com.example.dao.impl.UserImplement;
import com.example.service.controller.UserService;

public class UserImplService implements UserService {
    private UserDao userDao = new UserImplement();
    @Override
    public void registUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public User login(User user) {
        User user1 = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
        return user1;
    }

    @Override
    public boolean inspectUsername(String username) {
        User user = userDao.queryUserByUserName(username);
        if (user == null){
            return false;
        }
        if (user.getUsername() == null){
            return false;
        }
        else return true;
    }
}
