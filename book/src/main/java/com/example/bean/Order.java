package com.example.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.logging.SimpleFormatter;


public class Order {
    private String orderId;
    private Date createTime;
    private BigDecimal price;
    private Integer userid;
    private Integer status = 0;
    public Order() {
    }

    public Order(String orderId, Date createTime, BigDecimal price, Integer userid, Integer status) {
        this.orderId = orderId;
        this.createTime = createTime;
        this.price = price;
        this.userid = userid;
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", createTime=" + createTime +
                ", price=" + price +
                ", userid=" + userid +
                ", status=" + status +
                '}';
    }
}
