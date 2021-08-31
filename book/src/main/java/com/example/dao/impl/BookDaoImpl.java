package com.example.dao.impl;

import com.example.bean.Book;
import com.example.dao.BaseDao;
import com.example.dao.BookDao;

import java.util.List;

public class BookDaoImpl extends BaseDao implements BookDao {
    @Override
        public Book queryOneById(Integer id) {
        String sql = "SELECT *FROM t_book WHERE id=?";
        Book book = queryOne(Book.class, sql, id);
        return book;
    }

    @Override
    public List<Book> queryList() {
        String sql = "SELECT *FROM t_book";
        List<Book> books = queryAll(Book.class, sql);
        return books;
    }

    @Override
    public int update(Book book) {
       String sql = "UPDATE t_book SET `name`=?,author=?,price=?,sales=?,stock=?,img_path=? WHERE id=?";
        int update = update(sql, book.getName(), book.getAuthor(), book.getPrice(), book.getSales(), book.getStock(), book.getImg_path(), book.getId());
        return update;
    }

    @Override
    public int delete(Integer id) {
        String sql = "DELETE FROM t_book WHERE id=?";
        int update = update(sql, id);
        return update;
    }

    @Override
    public int add(Book book) {
        String sql = "insert into t_book(`name`,`author`,`price`,`sales`,`stock`,`img_path`)values(?,?,?,?,?,?);";
        int update = update(sql, book.getName(), book.getAuthor(), book.getPrice(), book.getSales(), book.getStock(), book.getImg_path());
        return update;
    }

    @Override
    public int queryPageTotalCount() {
        String sql = "select count(*) from t_book";
        Number o = (Number) queryRow(sql);
        return o.intValue();
    }

    @Override
    public List<Book> queryPageItem(int begin,int end) {
        String sql = "select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path`imgPath from t_book limit ?,?";
        List<Book> bookList = queryAll(Book.class, sql, begin, end);
        return bookList;
    }

    @Override
    public int queryPageTotalCountByPrice(int min, int max) {
        String sql = "select count(*) from t_book WHERE price BETWEEN ? AND ?";
        Number o = (Number) queryRow(sql,min,max);
        return o.intValue();
    }

    @Override
    public List<Book> queryPageByPrice(int begin, int end, int min, int max) {
        String sql = "select `id`,`name`,`author`,`price`,`sales`,`stock`,`img_path`imgPath from t_book where price between ? and ? order by price limit ?,?";
        List<Book> bookList = queryAll(Book.class, sql, min,max,begin, end);
        return bookList;
    }
}
