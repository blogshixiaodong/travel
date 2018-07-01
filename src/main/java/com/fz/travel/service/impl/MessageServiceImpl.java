package com.fz.travel.service.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.MessageDao;
import com.fz.travel.dao.impl.MessageDaoImpl;
import com.fz.travel.service.MessageService;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class MessageServiceImpl implements MessageService {
    PageContainer<Message> pageContainer;
    MessageDao messageDao = new MessageDaoImpl();
    @Override
    public void insert(Message message) {
        messageDao.insert(message);
    }

    @Override
    public void delete(Message message) {

         messageDao.deleteByMessage(message);
    }

    @Override
    public void selectAllMessage() {
        pageContainer = messageDao.selectAllMessage();
    }

    @Override
    public void selectBytitle(Date time) {
        pageContainer = messageDao.selectByTime(time);
    }
}