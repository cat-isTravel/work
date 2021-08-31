package com.example.dao.impl;

import com.example.bean.Cart;
import com.example.bean.OrderItem;
import com.example.dao.BaseDao;
import com.example.dao.OrderItemDao;

public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {

    @Override
    public Integer saveOrderItem(OrderItem orderItem) {
        String sql = "insert into t_order_item(name,count,price,total_price,order_id) values(?,?,?,?,?)";
        Integer update = update(sql, orderItem.getName(), orderItem.getCount(), orderItem.getPrice(), orderItem.getTotalPrice(), orderItem.getOrderId());
        return update;
    }

    @Override
    public Cart queryOrderItemByOrderId(Integer id) {
        return null;
    }
}
