package com.fz.travel.dao.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.MessageDao;

import java.io.Serializable;
import java.util.Date;

public class MessageDaoImpl extends AbstractBaseDao<Message> implements MessageDao{

    private PageContainer<Message> pageContainer;
    @Override
    public void reply(Message message, String reply) {

    }

    @Override
    public void insert(Message message) {
      this.save(message);
    }

    @Override
    public void delete(Message message) {
       this.delete(message);
    }

    @Override
    public PageContainer<Message> selectAllMessage() {
        String hql = "select * from MESSAGE";
        return this.list(hql, pageContainer);
    }

    @Override
    public PageContainer<Message> selectByTime(Date time) {
        String hql = "select * from MESSAGE where messageTime=?";
        return this.list(hql,pageContainer,time);
    }

    @Override
    public PageContainer<Message> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<Message> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
