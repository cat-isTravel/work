package com.example.Test;

import com.example.service.controller.OrderService;
import com.example.service.impl.OrderServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class OrderServiceTest {
    OrderService orderService = new OrderServiceImpl();
    @Test
    public void createOrder() {
    }

    @Test
    public void showAllOrders() {
    }

    @Test
    public void sendOrder() {
        orderService.sendOrder("16290084470161",1);
    }

    @Test
    public void showOrderInfo() {
    }

    @Test
    public void showMyOrders() {
    }

    @Test
    public void receiverOrder() {
    }
}