package com.fz.travel.controller;

import com.fz.travel.bean.TouristNote;

import com.fz.travel.service.TouristNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:51
 */
@Controller
public class TouristNoteController extends BaseController {


    private TouristNote touristNote;

    @Autowired
    private TouristNoteService touristNoteService;




}
