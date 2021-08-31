package com.example.dao;

import com.example.bean.User;

public interface UserDao {
    public User queryUserByUserName(String username);
    public int addUser(User user);
    public User queryUserByNameAndPassword(String username,String password);

}
