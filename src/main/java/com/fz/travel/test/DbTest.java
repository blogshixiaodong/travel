package com.fz.travel.test;

import com.fz.travel.bean.News;
import com.fz.travel.bean.Visitor;
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

    @Before
    public void before(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        sessionFactory = (SessionFactory)ctx.getBean("sessionFactory");
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();
    }

    @Test
    public void test(){
        //String hql = "SELECT COUNT(*) FROM User u LEFT JOIN u.engclassSet ec LEFT JOIN ec.timeSheetSet ts WHERE u.userId = 40000 AND ec.engclassId = 70000 AND STR_TO_DATE(ts.recordTime,'%Y-%m-%d') = STR_TO_DATE('2015-05-08','%Y-%m-%d') ";
        //Query query = session.createQuery(hql);
        //System.out.println(query.uniqueResult());
        Visitor visitor = (Visitor) session.get(Visitor.class, 1);
        News news=(News)session.get(News.class,1);

        System.out.println(visitor.getHotelSet());
    }

    @After
    public void after(){
        transaction.commit();
        session.close();
        sessionFactory.close();
    }
}
