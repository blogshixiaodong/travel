package com.fz.travel.dao;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;

import java.io.Serializable;

public interface NewsDao extends PageDao {
    public void insert(News news);

    public void deleteByNews(News news);


    public PageContainer<News> selectAllNews();

    public PageContainer<News> selectByHeadLine(String headLine);
}
