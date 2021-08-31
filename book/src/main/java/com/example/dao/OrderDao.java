package com.example.dao;

import com.example.bean.Cart;
import com.example.bean.Order;
import com.example.bean.User;

import java.util.List;

public interface OrderDao {
    public int saveOrderId(Order order);
    public List<Order> queryOrders();
    public int changeOrderStatus(String id,Integer status);
    public List<Order> queryOrdersByUserId(Integer id);
}
