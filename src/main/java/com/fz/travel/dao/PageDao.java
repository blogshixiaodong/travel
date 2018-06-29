package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public interface PageDao<T> {
    PageContainer<T> getPageContainer();

    void setPageContainer(PageContainer<T> pageContainer);
}
