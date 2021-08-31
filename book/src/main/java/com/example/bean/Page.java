package com.example.bean;

import java.util.List;

public class Page<T> {
    private Integer pageNo;
    public static final Integer PAGE_SIZE = 4;
    private Integer pageTotal;
    private List<T> item;
    private Integer pageTotalCount;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Page() {
    }

    public Page(Integer pageNo, Integer pageTotal, List<T> item, Integer pageTotalCount) {
        this.pageNo = pageNo;
        this.pageTotal = pageTotal;
        this.item = item;
        this.pageTotalCount = pageTotalCount;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        if (pageNo < 1){
            pageNo = 1;
        }
        if (pageNo > pageTotal){
            pageNo = pageTotal;
        }
        this.pageNo = pageNo;
    }


    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public List<T> getItem() {
        return item;
    }

    public void setItem(List<T> item) {
        this.item = item;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", pageTotal=" + pageTotal +
                ", item=" + item +
                ", pageTotalCount=" + pageTotalCount +
                '}';
    }
}
