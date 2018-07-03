package com.fz.travel.controller;

import com.fz.travel.bean.Message;
import com.fz.travel.bean.Visitor;
import com.fz.travel.service.MessageService;
import com.opensymphony.xwork2.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.fz.travel.bean.PageContainer;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MessageController extends BaseController {
    @Autowired
    private MessageService messageService;

    private Message message;

    private String jsonResult = "";

    private PageContainer<Message> pageContainer;

    //添加留言
    public String creatMessage(){
        getSession().get("visitor");
        Visitor visitor =  (Visitor) getSession().get("visitor");
        Date date = new Date();
        if(visitor!=null){
            message.setVisitor(visitor);
            message.setMessageTime(date);
            messageService.addMessage(message);
            return  Action.SUCCESS;
        }
        else
          return Action.ERROR;
    }
    //删除留言
    public String deleteMessageByMessageId(){
       messageService.removeByMessage(message.getMessageId());

            return Action.SUCCESS;

    }
    //回复留言
    public String replyMessage(){
        Date date = new Date();
        Message message1 = messageService.queryByMessageId(message.getMessageId());
        message.setReplayTime(date);
        message.setMessageInfo(message1.getMessageInfo());
        message.setMessageTime(message1.getMessageTime());
        message.setVisitor(message1.getVisitor());
        messageService.reply(message);
        return Action.SUCCESS;
    }
    //按留言时间查询留言

    public String  queryMessageByMessageInfo(){
        pageContainer = messageService.queryByMessageInfo(message.getMessageInfo(),pageContainer);
        jsonResult = pageContainer.toJson("visitor");
        return Action.SUCCESS;
    }
    //显示所有留言
    public String queryAllMessage(){
        pageContainer = messageService.queryAllMessage(pageContainer);
        jsonResult = pageContainer.toJson("visitor");
        return Action.SUCCESS;
    }

    //get and set
    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public PageContainer<Message> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<Message> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
