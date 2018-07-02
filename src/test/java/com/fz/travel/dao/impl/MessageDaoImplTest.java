package com.fz.travel.dao.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.MessageDao;
import com.fz.travel.dao.TouristNoteDao;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.Serializable;
import java.util.Date;
import java.text.SimpleDateFormat;

import static org.junit.Assert.*;

public class MessageDaoImplTest {
    private MessageDao messageDao;
    private Message message;
    private PageContainer<Message> pageContainer;
    @Before
    public void before() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        messageDao = (MessageDaoImpl)ctx.getBean("messageDaoImpl");
        pageContainer = new PageContainer<>();
        pageContainer.setCurrentPageNo(1);
        pageContainer.setPageSize(5);
    }

    @Test
    public void selectByMessageId() throws Exception {
        message = messageDao.selectByMessageId(1);
        System.out.println(message);

    }

    @Test
    public void reply() throws Exception {
        messageDao.setPageContainer(pageContainer);
        pageContainer =messageDao.selectAllMessage();
        message = pageContainer.getList().get(0);
        message.setReplayInfo("213123");
        message.setReplayTime(new Date());
        messageDao.reply(message);
    }

    @Test
    public void insert() throws Exception {
        Message message = new Message();
        message.setMessageInfo("hello");
        message.setMessageTime(new Date());
        messageDao.insertMessage(message);

    }

    @Test
    public void deleteByMessage() throws Exception {
        messageDao.setPageContainer(pageContainer);
        pageContainer =messageDao.selectAllMessage();
        message = pageContainer.getList().get(0);
        messageDao.deleteByMessage(message);
    }

    @Test
    public void selectAllMessage() throws Exception {
        messageDao.setPageContainer(pageContainer);
        pageContainer = messageDao.selectAllMessage();
        System.out.println(pageContainer.getList());
    }

    @Test
    public void selectByTime() throws Exception {
        messageDao.setPageContainer(pageContainer);
        String time = "2018-06-30";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date strtodate = formatter.parse(time);
        pageContainer =  messageDao.selectByTime(new Date());
        System.out.println(pageContainer.getList());
    }

}