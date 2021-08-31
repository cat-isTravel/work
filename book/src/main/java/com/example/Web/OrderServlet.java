package com.example.Web;

import com.example.bean.*;
import com.example.service.controller.OrderService;
import com.example.service.impl.OrderServiceImpl;
import com.example.utils.JdbcUtils;
import com.example.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends BaseServlet{

    private OrderService orderService = new OrderServiceImpl();
    protected void creatOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        User user = (User) req.getSession().getAttribute("user");
        if (user == null){
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
            return;
        }
        String orderId = orderService.createOrder(cart, user.getId());
        req.getSession().setAttribute("orderId", orderId);
        resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");

    }

    protected void queryMyOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null){
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
            return;
        }
        List<Order> list = orderService.showMyOrders(user.getId());

        req.setAttribute("MyOrder",list);
        req.getRequestDispatcher("/pages/order/order.jsp").forward(req, resp);

    }

    protected void queryOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> list = orderService.showAllOrders();
        req.setAttribute("AllOrder",list);
        req.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(req, resp);
    }

    protected void sendOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer status = WebUtils.parseInt(req.getParameter("status"), 0);
        String order_id = req.getParameter("order_id");
        status = 1;
        orderService.sendOrder(order_id,status);
        resp.sendRedirect(req.getHeader("Referer"));
    }

}
