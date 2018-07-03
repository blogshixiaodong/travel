package com.fz.travel.bean;


import java.io.Serializable;
import java.util.Date;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class Message implements Serializable {

    private Integer messageId;

    private String messageInfo;

    private String replayInfo;

    private Date messageTime;

    private Date replayTime;

    private Visitor visitor;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageInfo() {
        return messageInfo;
    }

    public void setMessageInfo(String messageInfo) {
        this.messageInfo = messageInfo;
    }

    public String getReplayInfo() {
        return replayInfo;
    }

    public void setReplayInfo(String replayInfo) {
        this.replayInfo = replayInfo;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

    public Date getReplayTime() {
        return replayTime;
    }

    public void setReplayTime(Date replayTime) {
        this.replayTime = replayTime;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", messageInfo='" + messageInfo + '\'' +
                ", replayInfo='" + replayInfo + '\'' +
                ", messageTime=" + messageTime +
                ", replayTime=" + replayTime +
                ", visitor=" + visitor +
                '}';
    }
}
