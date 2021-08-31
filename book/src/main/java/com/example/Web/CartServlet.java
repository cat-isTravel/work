package com.example.Web;

import com.example.bean.Book;
import com.example.bean.Cart;
import com.example.bean.CartItem;
import com.example.dao.BookDao;
import com.example.dao.impl.BookDaoImpl;
import com.example.service.controller.BookService;
import com.example.service.impl.BookServiceImpl;
import com.example.utils.WebUtils;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends BaseServlet{
    private BookService bookService = new BookServiceImpl();
    protected void addCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        // 调用bookService.queryBookById(id):Book得到图书的信息
        Book book = bookService.queryBook(id);
        // 把图书信息，转换成为CartItem商品项
        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        // 调用Cart.addItem(CartItem);添加商品项
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);

        // 最后一个添加的商品名称
        req.getSession().setAttribute("bookName", cartItem.getName());
        req.getSession().setAttribute("cart",cart);
        // 重定向回原来商品所在的地址页面
        resp.sendRedirect(req.getHeader("Referer"));

    }
    protected void AjaxAddCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = WebUtils.parseInt(req.getParameter("id"), 0);
        // 调用bookService.queryBookById(id):Book得到图书的信息
        Book book = bookService.queryBook(id);
        // 把图书信息，转换成为CartItem商品项
        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        // 调用Cart.addItem(CartItem);添加商品项
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);

        Map<String,Object> CartMap = new HashMap<>();
        Gson gson = new Gson();
        CartMap.put("cartTotalCount", cart.getTotalCount());
        CartMap.put("bookName", cartItem.getName());

        String toJson = gson.toJson(CartMap);

        resp.getWriter().write(toJson);

    }
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = WebUtils.parseInt(req.getParameter("id"), 0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        cart.deleteItem(id);
        resp.sendRedirect(req.getHeader("Referer"));

    }
    protected void cleanCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        cart.clear();
        req.getSession().invalidate();
        resp.sendRedirect(req.getHeader("Referer"));
    }
    protected void updateItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer count = WebUtils.parseInt(req.getParameter("count"), 1);
        Integer bookId = WebUtils.parseInt(req.getParameter("bookId"), 0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        cart.updateCount(bookId,count);
        resp.sendRedirect(req.getHeader("Referer"));
    }
}
