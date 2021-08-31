package com.example.service.impl;

import com.example.bean.*;
import com.example.dao.BookDao;
import com.example.dao.OrderDao;
import com.example.dao.OrderItemDao;
import com.example.dao.impl.BookDaoImpl;
import com.example.dao.impl.OrderDaoImpl;
import com.example.dao.impl.OrderItemDaoImpl;
import com.example.service.controller.OrderService;

import javax.swing.text.Caret;
import java.util.Collection;
import java.util.Date;
import java.util.List;


public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    OrderItemDao orderItemDao = new OrderItemDaoImpl();
    BookDao bookDao = new BookDaoImpl();
    @Override
    public String createOrder(Cart cart, Integer id) {
        String orderId = System.currentTimeMillis()+""+id;
        orderDao.saveOrderId(new Order(orderId,new Date(),cart.getTotalPrice(),id,0));
        Collection<CartItem> values = cart.getItems().values();

        for (CartItem value : values) {
            OrderItem orderItem = new OrderItem(null,value.getName(),value.getCount(),value.getPrice(),value.getTotalPrice(),orderId);
            orderItemDao.saveOrderItem(orderItem);
            Book book = bookDao.queryOneById(value.getId());
            book.setSales(book.getSales() + value.getCount());
            book.setStock(book.getStock() - value.getCount());
            bookDao.update(book);
        }

        cart.clear();
        return orderId;
    }

    @Override
    public List<Order> showAllOrders() {
        List<Order> list = orderDao.queryOrders();
        return list;
    }

    @Override
    public void sendOrder(String OrderId,Integer status) {
        orderDao.changeOrderStatus(OrderId,status);
    }

    @Override
    public Cart showOrderInfo() {
        return null;
    }

    @Override
    public List<Order> showMyOrders(Integer id) {
        List<Order> list = orderDao.queryOrdersByUserId(id);
        return list;
    }

    @Override
    public void receiverOrder(String OrderId) {

    }
}
