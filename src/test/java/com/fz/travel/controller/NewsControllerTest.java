package com.fz.travel.controller;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;
import com.fz.travel.dao.impl.NewsDaoImpl;
import com.fz.travel.service.NewsService;
import com.opensymphony.xwork2.Action;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class NewsControllerTest {
    private NewsService newsService;
    private PageContainer<News> pageContainer;
    private News news;
    @Before
    public void before() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        newsService = (NewsService) ctx.getBean("newsService");
        pageContainer = new PageContainer<>();
        pageContainer.setCurrentPageNo(1);
        pageContainer.setPageSize(5);

    }
    @Test
    public void createNews() throws Exception {
    }

    @Test
    public void deleteNewsByNewsId() throws Exception {
    }

    @Test
    public void queryNewsByNewsHeadLine() throws Exception {
    }

    @Test
    public void queryNewsByNewsId() throws Exception {
    }

    @Test
    public void queryAllNews() throws Exception {
        pageContainer = newsService.queryAllNews(pageContainer);

        System.out.println(pageContainer.getList());

    }

}