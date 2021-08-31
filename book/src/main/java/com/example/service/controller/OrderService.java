package com.example.service.controller;

import com.example.bean.Cart;
import com.example.bean.CartItem;
import com.example.bean.Order;
import com.example.bean.User;

import java.util.List;

public interface OrderService {
    public String createOrder(Cart cart,Integer id);
    public List<Order> showAllOrders();
    public void sendOrder(String OrderId,Integer status);
    public Cart showOrderInfo();
    public List<Order> showMyOrders(Integer id);
    public void receiverOrder(String OrderId);
}
