package com.fz.travel.service.impl;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;
import com.fz.travel.dao.impl.NewsDaoImpl;
import com.fz.travel.service.NewsService;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {
    private NewsDao newsDao;
    @Override
    public void addNews(News news) {
        newsDao.insertNews(news);
    }

    @Override
    public String removeByNews(Integer newsId) {
        News news = newsDao.selectByNewsId(newsId);
        if(news  == null){
            return "新闻不存在";
        }
        else
            newsDao.deleteByNews(news);
        return  "删除新闻成功";
    }
     @Override
     public News queryByNewsId(Integer newsId){
        return newsDao.selectByNewsId(newsId);
     }
    @Override
    public PageContainer<News> queryAllNews(PageContainer<News> pageContainer) {
        newsDao.setPageContainer(pageContainer);
        return newsDao.selectAllNews();
    }

    @Override
    public PageContainer<News> queryByHeadLine(String headLine,PageContainer<News> pageContainer) {
        newsDao.setPageContainer(pageContainer);
        return  newsDao.selectByHeadLine(headLine);
    }
}