package com.example.service.controller;

import com.example.bean.User;

public interface UserService {
    public void registUser(User user);
    public User login(User user);
    public boolean inspectUsername(String username);

}
