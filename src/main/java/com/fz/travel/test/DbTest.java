package com.fz.travel.test;

import com.fz.travel.bean.TouristNote;
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
    public void test() {
        Visitor visitor = session.get(Visitor.class, 1);
        System.out.println(visitor);
        TouristNote note = session.get(TouristNote.class, 1);
        System.out.println(note);

    }

    @After
    public void after(){
        transaction.commit();
        session.close();
        sessionFactory.close();
    }
}
