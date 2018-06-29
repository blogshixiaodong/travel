package com.fz.travel.controller;

import com.fz.travel.bean.Message;
import com.fz.travel.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController extends BaseController {

    private MessageService messageService;

    private Message message;
}
