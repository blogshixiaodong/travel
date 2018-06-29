package com.fz.travel.dao.impl;

import com.fz.travel.bean.*;
import com.fz.travel.dao.TouristLineDao;
import com.fz.travel.dao.TouristNoteDao;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashSet;
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

    @Before
    public void before() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");

        touristLine = new TouristLine();

        touristLineDao = (TouristLineDao)ctx.getBean("touristLineDaoImpl");

        pageContainer = new PageContainer<>();
        pageContainer.setCurrentPageNo(1);
        pageContainer.setPageSize(5);
    }

    public Scenery createScenery(Integer id) {
        Scenery scenery = new Scenery();
        scenery.setSceneryId(id);
        return scenery;
    }


    @Test
    public void insertTouristLine() throws Exception {
        Set<Scenery> scenerySet = new HashSet<>();
        for(int i = 1; i <= 3; i++) {
            scenerySet.add(createScenery(i));
        }

        touristLine.setScenerySet(scenerySet);
        touristLine.setTouristLinePrice(999.9);

        touristLineDao.insertTouristLine(touristLine);
    }

    @Test
    public void deleteTouristLine() throws Exception {
    }

    @Test
    public void updateTouristLine() throws Exception {
    }

    @Test
    public void selectTouristLineById() throws Exception {

        touristLine =  touristLineDao.selectTouristLineById(1);

        System.out.println(touristLine);

    }

    @Test
    public void selectTouristLineList() throws Exception {

        touristLineDao.setPageContainer(pageContainer);

        pageContainer = touristLineDao.selectTouristLineList();

        System.out.println(pageContainer.getList());

    }

}