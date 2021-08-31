package com.example.Web;

import com.example.service.controller.BookService;
import com.example.service.impl.BookServiceImpl;
import com.example.bean.Page;
import com.example.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClientBookServlet extends BaseServlet{
    private BookService bookService = new BookServiceImpl();
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Page page = bookService.page(pageNo, Page.PAGE_SIZE);
        page.setUrl("client/bookServlet?action=page");
        req.setAttribute("page", page);
        req.getRequestDispatcher("/client/index.jsp").forward(req, resp);
    }
    protected void pageByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer min = WebUtils.parseInt(req.getParameter("min"), 0);
        Integer max = WebUtils.parseInt(req.getParameter("max"), Integer.MAX_VALUE);
        Page page = bookService.pageByPrice(pageNo, Page.PAGE_SIZE,min,max);
        page.setUrl("client/bookServlet?action=pageByPrice&min="+min+"&max="+max);
        req.setAttribute("page", page);
        req.getRequestDispatcher("/client/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
