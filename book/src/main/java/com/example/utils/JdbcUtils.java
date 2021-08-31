package com.example.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
    private static DruidDataSource druidDataSource = null;
    private static ThreadLocal<Connection> cons = new ThreadLocal<>();
    static {

        try {
            Properties properties = new Properties();
//            File file = new File("src/main/resources/jdbc.properties");
//            System.out.println(file.getAbsolutePath());
            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            properties.load(inputStream);
            druidDataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Connection getConnection(){
        Connection conn = cons.get();
        if (conn == null){
            try {
                conn = druidDataSource.getConnection();
                cons.set(conn);
                conn.setAutoCommit(false);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return conn;
    }

    public static void commitAndClose(){
        Connection conn = cons.get();
        if (conn != null){
            try {
                conn.commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        cons.remove();
    }

    public static void rollbackAndClose(){
        Connection conn = cons.get();
        if (conn != null){
            try {
                conn.rollback();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        cons.remove();
    }





/*    public static void close(Connection conn){
        if (conn != null){
            try {
                conn.close();
            } catch (Exception throwables) {
                throwables.printStackTrace();
            }
        }
        }

 */

}
