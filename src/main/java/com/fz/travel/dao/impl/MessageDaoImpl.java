package com.fz.travel.dao.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.MessageDao;

import java.io.Serializable;
import java.util.Date;

public class MessageDaoImpl extends AbstractBaseDao<Message> implements MessageDao{
    @Override
    public void reply(Message message, String reply) {

    }

    @Override
    public void insert(Message message) {
      this.save(message);
    }

    @Override
    public void delete(Message message) {

    }

    @Override
    public PageContainer<Message> selectAllMessage() {
        return null;
    }

    @Override
    public PageContainer<Message> selectByTime(Date time) {
        return null;
    }
}
