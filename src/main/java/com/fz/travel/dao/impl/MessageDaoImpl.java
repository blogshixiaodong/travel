package com.fz.travel.dao.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.MessageDao;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

@Repository
public class MessageDaoImpl extends AbstractBaseDao<Message> implements MessageDao{

    private PageContainer<Message> pageContainer;
    @Override
    public void reply(Message message) {
       this.update(message);
    }

    @Override
    public void insertMessage(Message message) {
      this.save(message);
    }

    @Override
    public void deleteByMessage(Message message) {
       this.delete(message);
    }

    @Override
    public Message selectByMessageId(Serializable messageId) {
       return this.get(messageId);
    }

    @Override
    public PageContainer<Message> selectAllMessage() {
        String hql = "FROM Message";
        return this.list(hql, pageContainer);
    }

    @Override
    public PageContainer<Message> selectByMessageInfo(String messageInfo) {
        String hql = "FROM Message WHERE messageInfo LIKE ?";
        return this.list(hql, pageContainer, "%" + messageInfo + "%");
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
