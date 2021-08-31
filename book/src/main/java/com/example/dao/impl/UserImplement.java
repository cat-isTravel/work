package com.example.dao.impl;

import com.example.bean.User;
import com.example.dao.BaseDao;
import com.example.dao.UserDao;

public class UserImplement extends BaseDao implements UserDao {
    @Override
    public User queryUserByUserName(String username) {
        String sql = "SELECT *FROM t_user where username=?";
        return super.queryOne(User.class, sql, username);

    }

    @Override
    public int addUser(User user) {
       String sql = "INSERT INTO t_user(username,password,email)values(?,?,?)";
       return update(sql, user.getUsername(),user.getPassword(),user.getEmail());
    }

    @Override
    public User queryUserByNameAndPassword(String username, String password) {
        String sql = "SELECT *FROM t_user where username=? and password=?";
        return super.queryOne(User.class, sql, username,password);
    }
}
