package com.fz.travel.service;

import com.fz.travel.bean.News;

public interface NewsService {
    public void insert(News news);

    public void delete(News news);

    public void selectAllNews();

    public void selectByTitle(String title);
}
