package com.fz.travel.service.impl;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.MessageDao;
import com.fz.travel.dao.impl.MessageDaoImpl;
import com.fz.travel.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class MessageServiceImpl implements MessageService {
    PageContainer<Message> pageContainer;
    @Autowired
    private MessageDao messageDao;
    @Override
    public void addMessage(Message message) {
        messageDao.insertMessage(message);
    }

    @Override
    public String removeByMessage(Integer messageId) {
        Message message = messageDao.selectByMessageId(messageId);
        if(message == null){
            return "留言不存在";
        }
         else
           messageDao.deleteByMessage(message);
            return  "删除留言成功";

    }
    @Override
    public void reply(Message message){
        message.setReplayTime(new Date("YY-MM-DD"));
        messageDao.reply(message);

    }
    @Override
    public PageContainer<Message> queryAllMessage(PageContainer<Message> pageContainer) {
        messageDao.setPageContainer(pageContainer);
        return  messageDao.selectAllMessage();
    }

    @Override
    public PageContainer<Message> queryByMessageTime(Date time,PageContainer<Message> pageContainer) {
        messageDao.setPageContainer(pageContainer);
        return messageDao.selectByTime(time);
    }
}
