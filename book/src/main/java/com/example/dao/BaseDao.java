package com.example.dao;

import com.example.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public abstract class BaseDao {
    private QueryRunner queryRunner = new QueryRunner();
    public Integer update(String sql,Object ...args){
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.update(conn,sql,args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }

    }
    /**
        查询返回一个javaBeen实例
     */
    public <T>T queryOne(Class<T>clazz,String sql,Object ...args){
        Connection conn = JdbcUtils.getConnection();
        try {
            T t = queryRunner.query(conn, sql, new BeanHandler<T>(clazz), args);
            return t;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }

    }
    /**
     * 查询返回多个JavaBeen实例
     *
     * */
    public <T>List<T>queryAll(Class<T>clazz,String sql,Object ...args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            List<T> list = queryRunner.query(conn, sql, new BeanListHandler<T>(clazz), args);
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
    }
    /**
     *
     * 返回一行一列数据
     * */
    public Object queryRow(String sql,Object ...args){
        Connection conn = JdbcUtils.getConnection();
        try {
            Object o = queryRunner.query(conn, sql, new ScalarHandler(), args);
            return o;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
    }
}
