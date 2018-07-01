package com.fz.travel.service;

import com.fz.travel.bean.News;

public interface NewsService {
    public void insert(News news);

    public void deleteByNews(News news);

    public void selectAllNews();

    public void selectByHeadLine(String title);
}
