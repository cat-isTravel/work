package com.example.dao;

import com.example.bean.Book;

import java.util.List;

public interface BookDao {
    public Book queryOneById(Integer id);
    public List<Book>queryList();
    public int update(Book book);
    public int delete(Integer id);
    public int add(Book book);
    public int queryPageTotalCount();
    public int queryPageTotalCountByPrice(int min,int max);
    public List<Book> queryPageItem(int begin,int end);
    public List<Book> queryPageByPrice(int begin,int end,int min,int max);
}
