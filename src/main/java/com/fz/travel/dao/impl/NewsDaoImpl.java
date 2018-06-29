package com.fz.travel.dao.impl;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;

import java.io.Serializable;

public class NewsDaoImpl extends AbstractBaseDao<News> implements NewsDao{
    private  String hql1="select * from NEWS"
    @Override
    public void insert(News news) {
     this.save(news);
    }

    @Override
    public void delete(News news) {

        this.delete(news);
    }

    @Override
    public PageContainer<News> selectAllNews() {
            this.list();
    }

    @Override
    public PageContainer<News> selectByTitle(String title) {

    }
}
