package com.fz.travel.controller;

import com.fz.travel.bean.Message;
import com.fz.travel.service.MessageService;
import com.opensymphony.xwork2.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.fz.travel.bean.PageContainer;

@Controller
public class MessageController extends BaseController {
    @Autowired
    private MessageService messageService;

    private Message message;

    private String jsonResult = "";

    private PageContainer<Message> pageContainer;

    //添加留言
    public String creatMessage(){
        messageService.addMessage(message);
        return Action.SUCCESS;
    }
    //删除留言
    String deleteMessageByMessageId(){
        if(messageService.removeByMessage(message.getMessageId()).equals("删除留言成功"))
        {
            return Action.SUCCESS;
        }
        else return  Action.ERROR;
    }
    //回复留言
    public String replyMessage(){
       messageService.reply(message);
       return Action.SUCCESS;
    }
    //按留言时间查询留言
    public String  queryMessageByMessageTime(){
        pageContainer = messageService.queryByMessageTime(message.getMessageTime(),pageContainer);
        jsonResult = pageContainer.toJson("messageSet");
        return Action.SUCCESS;
    }
    //显示所有留言
    public String queryAllScenery(){
        pageContainer = messageService.queryAllMessage(pageContainer);
        jsonResult = pageContainer.toJson("messageSet");
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
