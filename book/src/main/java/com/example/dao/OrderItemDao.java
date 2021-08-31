package com.example.dao;

import com.example.bean.Cart;
import com.example.bean.OrderItem;

public interface OrderItemDao {
    public Integer saveOrderItem(OrderItem orderItem);
    public Cart queryOrderItemByOrderId(Integer id);
}
