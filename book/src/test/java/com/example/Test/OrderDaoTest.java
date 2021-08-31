package com.example.Test;

import com.example.bean.Order;
import com.example.dao.OrderDao;
import com.example.dao.impl.OrderDaoImpl;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class OrderDaoTest {
    private OrderDao orderDao = new OrderDaoImpl();
    @Test
    public void saveOrderId() {
        orderDao.saveOrderId(new Order("1112334", new Date(), new BigDecimal(90),1,0));

    }

    @Test
    public void queryOrders() {
        List<Order> list = orderDao.queryOrders();
        for (Order order : list) {
            System.out.println(order);
        }
    }

    @Test
    public void changeOrderStatus() {
    }

    @Test
    public void queryOrdersByUserId() {
        List<Order> list = (List<Order>) orderDao.queryOrdersByUserId(1);
        for (Order order : list) {
            System.out.println(order);
        }
    }
}