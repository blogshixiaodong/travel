package com.fz.travel.service;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;

public interface NewsService {
    //新建新闻
    public void addNews(News news);
    //删除新闻
    public String removeByNews(Integer newsId);
    //更改新闻
    public void updateNews(News news);
    //按先问ID查询
    public News queryByNewsId(Integer newsId);
    //查询所有新闻
    public PageContainer<News> queryAllNews(PageContainer<News> pageContainer);
    //按标题查询留言
    public PageContainer<News> queryByHeadLine(String headLine,PageContainer<News> pageContainer);
}
