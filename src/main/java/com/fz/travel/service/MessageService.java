package com.fz.travel.service;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.PageContainer;

import java.util.Date;

public interface MessageService {
    //添加留言
    public void addMessage(Message message);
   //回复留言
    public void reply(Message message);
  //删除留言
    public String removeByMessage(Integer messageId);
  //查询所有留言
    public PageContainer<Message> queryAllMessage(PageContainer<Message> pageContainer);
  //按时间查询留言
    public PageContainer<Message> queryByMessageTime(Date time, PageContainer<Message> pageContainer);
}
