package com.example.dao.impl;

import com.example.bean.Cart;
import com.example.bean.Order;
import com.example.dao.BaseDao;
import com.example.dao.OrderDao;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    Cart cart = new Cart();

    @Override
    public int saveOrderId(Order order) {
        String sql = "insert into t_order(order_id,create_time,price,status,user_id) values(?,?,?,?,?)";

        return update(sql, order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserid());
    }

    @Override
    public List<Order> queryOrders() {
        String sql = "SELECT order_id orderId,create_time createTime,price,user_id userid,status FROM t_order";
        List<Order> list = queryAll(Order.class, sql);
        return list;
    }

    @Override
    public int changeOrderStatus(String id, Integer status) {
        String sql = "UPDATE t_order SET status=? WHERE order_id=?";
        int update = update(sql, status, id);
        return update;

    }

    @Override
    public List<Order> queryOrdersByUserId(Integer id) {
        String sql = "SELECT order_id orderId,create_time createTime,price,user_id userid,status FROM t_order where user_id=?";
        List<Order> orders = queryAll(Order.class, sql, id);
        return orders;
    }
}
