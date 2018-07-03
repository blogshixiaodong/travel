package com.fz.travel.dao.impl;

import com.fz.travel.bean.*;
import com.fz.travel.dao.TouristLineDao;
import com.fz.travel.dao.TouristNoteDao;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

/**
 * @author Shixiaodong
 * @date 2018/6/29 22:19
 */
public class TouristLineDaoImplTest {

    private TouristLine touristLine;

    private TouristLineDao touristLineDao;

    private PageContainer<TouristLine> pageContainer;

//    @Before
//    public void before() {
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
//
//        touristLine = new TouristLine();
//
//        touristLineDao = (TouristLineDao)ctx.getBean("touristLineDaoImpl");
//
//        pageContainer = new PageContainer<>();
//        pageContainer.setCurrentPageNo(1);
//        pageContainer.setPageSize(5);
//    }
//
//      @Test
//    public LineScenery createLineScenery(Integer sceneryId) {
//        LineScenery lineScenery = new LineScenery();
//
//
//        Scenery scenery = new Scenery();
//        scenery.setSceneryId(sceneryId);
//        lineScenery.setScenery(scenery);
//        lineScenery.setOrder(sceneryId);
//
//        return lineScenery;
//    }
//
//
//    @Test
//    public void insertTouristLine() throws Exception {
//        //TouristLine touristLine = new TouristLine();
////        touristLine.setTouristLineId(2);
////
////        Set<LineScenery> lineScenerySet = new HashSet<LineScenery>();
////        List<Scenery> sceneryList = new ArrayList<Scenery>();
////        Scenery scenery1 = new Scenery();
////        Scenery scenery2 = new Scenery();
////        Scenery scenery3 = new Scenery();
////        scenery1.setSceneryId(3);
////        scenery2.setSceneryId(4);
////        scenery3.setSceneryId(5);
////        sceneryList.add(scenery1);
////        sceneryList.add(scenery2);
////        sceneryList.add(scenery3);
////        int i = 0;
////
////
////        touristLine.setLineScenerySet(lineScenerySet);
////        touristLine.setTouristLinePrice(999.9);
////        touristLineDao.insertTouristLine(touristLine);
//       // touristLineDao.insertTouristLine(touristLine);
//
//    }
//
//    @Test
//    public void deleteTouristLine() throws Exception {
//        //TouristLine touristLine =
//    }
//
//    @Test
//    public void updateTouristLine() throws Exception {
//    }
//
//    @Test
//    public void selectTouristLineById() throws Exception {
//
//        touristLine =  touristLineDao.selectTouristLineById(1);
//
//        System.out.println(touristLine);
//        for(LineScenery lineScenery : touristLine.getLineScenerySet()){
//            System.out.println(lineScenery.getScenery());
//        }
//
//    }
//
//    @Test
//    public void selectTouristLineList() throws Exception {
//
//        touristLineDao.setPageContainer(pageContainer);
//
//        pageContainer = touristLineDao.selectTouristLineList();
//
//        System.out.println(pageContainer.getList());
//
//    }

}