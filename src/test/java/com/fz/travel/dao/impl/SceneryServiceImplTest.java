package com.fz.travel.dao.impl;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import com.fz.travel.service.HotelService;
import com.fz.travel.service.SceneryService;
import com.fz.travel.service.impl.SceneryServiceImpl;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/** 
* SceneryServiceImpl Tester. 
* 
* @author:jiangjiamin
* @since <pre>���� 29, 2018</pre> 
* @version 1.0 
*/ 
public class SceneryServiceImplTest { 
    private ApplicationContext ctx;
    private SceneryService sceneryService;

    @Before
    public void before() throws Exception {
        ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        sceneryService = (SceneryServiceImpl) ctx.getBean("sceneryServiceImpl");
    } 

    @After
    public void after() throws Exception { 
    
    } 

    @Test
    public void testAddScenery() throws Exception { 
        Scenery scenery = new Scenery();
        scenery.setSceneryPrice(16.0);
        scenery.setSceneryPhoto("c://");
        scenery.setSceneryOpenTime(new Date());
        scenery.setSceneryName("changshang");
        scenery.setSceneryIntroduce("showGood");
        sceneryService.addScenery(scenery);
    } 
    @Test
    public void testUpdateScenery() throws Exception {
        Scenery scenery = new Scenery();
        scenery.setSceneryId(4);
        scenery.setSceneryPrice(16.0);
        scenery.setSceneryPhoto("c://");
        scenery.setSceneryOpenTime(new Date());
        scenery.setSceneryName("ruiyunshang");
        scenery.setSceneryIntroduce("showNice");
        sceneryService.updateScenery(scenery);
    } 
    @Test
    public void testDeleteSceneryBySceneryId() throws Exception { 
        sceneryService.deleteSceneryBySceneryId(5);
    } 
    @Test
    public void testQueryAllScenery() throws Exception { 
        PageContainer<Scenery> pageContainer = new PageContainer<Scenery>();
        pageContainer.setCurrentPageNo(1);
        pageContainer = sceneryService.queryAllScenery(pageContainer);
        System.out.println(pageContainer.getList());
    } 
    @Test
    public void testQuerySceneryBySceneryId() throws Exception { 
        Scenery scenery = sceneryService.querySceneryBySceneryId(5);
    }

} 
