package com.example.service.impl;

import com.example.bean.Book;
import com.example.bean.Page;
import com.example.dao.BookDao;
import com.example.dao.impl.BookDaoImpl;
import com.example.service.controller.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {
    private BookDao bookDao = new BookDaoImpl();
    @Override
    public void addBook(Book book) {
        bookDao.add(book);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.update(book);
    }

    @Override
    public void deleteBook(Integer id) {
        bookDao.delete(id);
    }

    @Override
    public Book queryBook(Integer id) {
        Book book = bookDao.queryOneById(id);
        return book;
    }

    @Override
    public List<Book> list() {
        return bookDao.queryList();
    }

    @Override
    public Page<Book> page(Integer pageNo, Integer pageSize) {
        Page<Book> page = new Page<>();
        int i = bookDao.queryPageTotalCount();
        page.setPageTotalCount(i);
        int pageTotal = i / pageSize;
        if (i % pageSize > 0){
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setUrl("manager/bookServlet?action=page");
        List<Book> bookList = bookDao.queryPageItem((pageNo - 1) * pageSize, pageSize);

        page.setItem(bookList);
        return page;

    }

    @Override
    public Page pageByPrice(Integer pageNo, Integer pageSize, Integer min, Integer max) {
        Page page = new Page();
        int i = bookDao.queryPageTotalCountByPrice(min, max);
        page.setPageTotalCount(i);
        page.setPageTotalCount(i);
        int pageTotal = i / pageSize;
        if (i % pageSize > 0){
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setUrl("client/bookServlet?action=queryByPrice");
        List<Book> bookList = bookDao.queryPageByPrice((pageNo - 1) * pageSize, pageSize, min, max);
        page.setItem(bookList);
        return page;
    }
}
