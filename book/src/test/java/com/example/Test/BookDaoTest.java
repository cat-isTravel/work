package com.example.Test;

import com.example.bean.Book;
import com.example.dao.BookDao;
import com.example.dao.impl.BookDaoImpl;
import com.example.bean.Page;
import org.junit.Test;

import java.util.List;

public class BookDaoTest {
    private BookDao bookDao = new BookDaoImpl();

    @Test
    public void queryPageTotalCount() {
        System.out.println(bookDao.queryPageTotalCount());
    }

    @Test
    public void queryPageItem() {
        for (Book book : bookDao.queryPageItem(0, Page.PAGE_SIZE)) {
            System.out.println(book);
        }
    }
    @Test
    public void queryByPrice(){
        List<Book> bookList = bookDao.queryPageByPrice(0, 4, 1, 50);
        for (Book book : bookList) {
            System.out.println(book);
        }
    }
    @Test
    public void queryCountByPrice(){
        int i = bookDao.queryPageTotalCountByPrice(1, 50);
        System.out.println(i);
    }
}