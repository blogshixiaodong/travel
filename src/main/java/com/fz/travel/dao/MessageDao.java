package com.fz.travel.dao;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;
import java.util.Date;

public interface MessageDao extends PageDao<Message> {
    public void reply(Message message);

    public void insert(Message message);

    public void deleteByMessage(Message message);

    public PageContainer<Message> selectByMessageId(Serializable messageId);

    public PageContainer<Message> selectAllMessage();

    public PageContainer<Message> selectByTime(Date time);
}
