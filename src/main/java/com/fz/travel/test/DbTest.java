package com.fz.travel.test;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.NewsDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */
public class DbTest {

    public SessionFactory sessionFactory;
    public Session session;
    public Transaction transaction;
    NewsDao newsDao;
    @Before
    public void before(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        newsDao = (NewsDao)ctx.getBean("newDaoImpl");
        //sessionFactory = (SessionFactory)ctx.getBean("sessionFactory");
        //session = sessionFactory.openSession();
       //transaction = session.beginTransaction();
    }

    public void test() {
        PageContainer pageContainer;
        News news=new News();
        news.setNewsId(2);
       newsDao.insert(news);
    }
}
