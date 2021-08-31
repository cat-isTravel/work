package com.example.service.controller;

import com.example.bean.Book;
import com.example.bean.Page;

import java.util.List;

public interface BookService {
    public void addBook(Book book);
    public void updateBook(Book book);
    public Book queryBook(Integer id);
    public void deleteBook(Integer id);
    public List<Book> list();

    public Page page(Integer pageNo, Integer pageSize);

    public Page pageByPrice(Integer pageNo, Integer pageSize, Integer min, Integer max);
}
