package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;
import com.fz.travel.bean.News;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class NewsDaoImplTest {
    private NewsDao newsDao;
    private PageContainer<News> pageContainer;
    private News news;
    @Before
    public void before() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        newsDao = (NewsDaoImpl)ctx.getBean("newsDaoImpl");
        pageContainer = new PageContainer<>();
        pageContainer.setCurrentPageNo(1);
        pageContainer.setPageSize(5);

    }
    @Test
    public void insert() throws Exception {
         News news = new News();
         news.setNewsContent("adasdad");

         newsDao.insertNews(news);
    }

    @Test
    public void deleteByNews() throws Exception {
        newsDao.setPageContainer(pageContainer);
        pageContainer = newsDao.selectAllNews();
        news = pageContainer.getList().get(1);
        newsDao.deleteByNews(news);
    }

    @Test
    public void selectAllNews() throws Exception {
        newsDao.setPageContainer(pageContainer);
        pageContainer = newsDao.selectAllNews();
        System.out.println(pageContainer.getList());
    }


    @Test
    public void selectByHeadLine() throws Exception {
        newsDao.setPageContainer(pageContainer);
        String headLine="123";
        pageContainer =  newsDao.selectByHeadLine(headLine);
        System.out.println(pageContainer.getList());

    }

}