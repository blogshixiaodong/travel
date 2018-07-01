package com.fz.travel.controller;

import com.fz.travel.bean.TouristNote;
import com.fz.travel.service.TouristNoteService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * @author Shixiaodong
 * @date 2018/6/29 9:02
 */
public class TouristNoteControllerTest {


    private TouristNoteService touristNoteService;
    @Before
    public void before() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");

        touristNoteService = (TouristNoteService)applicationContext.getBean("touristNoteServiceImpl");
    }

    @Test
    public void test() {
        TouristNote touristNote;

    }

}