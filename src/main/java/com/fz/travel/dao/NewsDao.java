package com.fz.travel.dao;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;

import java.io.Serializable;

public interface NewsDao extends PageDao {
    public void insertNews(News news);

    public void deleteByNews(News news);

    public News selectByNewsId(Serializable newsId);

    public PageContainer<News> selectAllNews();

    public PageContainer<News> selectByHeadLine(String headLine);
}
