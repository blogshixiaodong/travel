package com.fz.travel.service;

import com.fz.travel.bean.Message;

import java.util.Date;

public interface MessageService {
    public void insert(Message message);

    public void delete(Message message);

    public void selectAllMessage();

    public void selectBytitle(Date time);
}
