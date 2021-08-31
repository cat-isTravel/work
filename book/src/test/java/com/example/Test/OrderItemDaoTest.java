package com.example.Test;

import com.example.bean.OrderItem;
import com.example.dao.OrderItemDao;
import com.example.dao.impl.OrderItemDaoImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderItemDaoTest {
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();

    @Test
    public void saveOrderItem() {
        orderItemDao.saveOrderItem(new OrderItem(null, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90),"1112334"));
    }

    @Test
    public void queryOrderItemByOrderId() {
    }
}