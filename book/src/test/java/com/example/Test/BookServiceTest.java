package com.example.Test;

import com.example.bean.Book;
import com.example.service.controller.BookService;
import com.example.service.impl.BookServiceImpl;
import com.example.bean.Page;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

public class BookServiceTest {
    BookService bookService = new BookServiceImpl();
    @Test
    public void addBook() {
        bookService.addBook(new Book(null,"C#程序设计基础","人民教育",new BigDecimal(49.9),1450,2000,null));
    }

    @Test
    public void updateBook() {
        bookService.updateBook(new Book(21,"QT图形化界面编程","人民教育",new BigDecimal(49.9),800,2000,null));
    }

    @Test
    public void queryBook() {
        Book book = bookService.queryBook(21);
        System.out.println(book);
    }

    @Test
    public void deleteBook() {
        bookService.deleteBook(21);
    }

    @Test
    public void list() {
        List<Book> bookList = bookService.list();
        for (Book book : bookList) {
            System.out.println(book);
        }
    }
    @Test
    public void queryPageByPrice(){
        Page page = bookService.pageByPrice(1, 4, 100, 999);
        System.out.println(page);
    }
    @Test
    public void queryPageCountByPrice(){

    }
}