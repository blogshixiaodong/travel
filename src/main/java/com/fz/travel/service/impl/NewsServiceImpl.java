package com.fz.travel.service.impl;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;
import com.fz.travel.dao.impl.NewsDaoImpl;
import com.fz.travel.service.NewsService;

public class NewsServiceImpl implements NewsService {
    private PageContainer<News> pageContainer;

    private NewsDao newsDao = new NewsDaoImpl();
    @Override
    public void insert(News news) {
        newsDao.insert(news);
    }

    @Override
    public void delete(News news) {
        newsDao.delete(news);
    }

    @Override
    public void selectAllNews() {
        pageContainer = newsDao.selectAllNews();
    }

    @Override
    public void selectByTitle(String title) {
        pageContainer = newsDao.selectByTitle(title);
    }
}