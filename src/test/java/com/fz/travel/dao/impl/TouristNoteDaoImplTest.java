package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.TouristNoteDao;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * @author Shixiaodong
 * @date 2018/6/29 20:37
 */
public class TouristNoteDaoImplTest {

    private Visitor visitor;

    private TouristNote touristNote;

    private TouristNoteDao touristNoteDao;

    private PageContainer<TouristNote> pageContainer;

    @Before
    public void before() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        visitor = new Visitor();
        touristNote = new TouristNote();
        touristNoteDao = (TouristNoteDao)ctx.getBean("touristNoteDaoImpl");
        pageContainer = new PageContainer<>();
        pageContainer.setCurrentPageNo(1);
        pageContainer.setPageSize(5);
    }


    @Test
    public void insertTouristNote() throws Exception {

        visitor.setVisitorId(1);

//        touristNote.setTouristNoteHeadLine("标题1");
//        touristNote.setTouristNoteInfo("内同");
//        touristNote.setTouristNoteTime(new Date());
//        touristNote.setVisitor(visitor);

        touristNoteDao.insertTouristNote(touristNote);
    }

    @Test
    public void deleteTouristNote() throws Exception {

        //touristNote.setTouristNoteId(2);

//        touristNoteDao.deleteTouristNote(touristNote);

    }

    @Test
    public void updateTouristNote() throws Exception {
        visitor.setVisitorId(2);

//        touristNote.setTouristNoteId(1);
//        touristNote.setTouristNoteHeadLine("update line");
//        touristNote.setTouristNoteInfo("update info");
//        touristNote.setTouristNoteTime(new Date());
//        touristNote.setVisitor(visitor);

        touristNoteDao.updateTouristNote(touristNote);
    }

    @Test
    public void selectTouristNoteListByVisitorId() throws Exception {
        touristNoteDao.setPageContainer(pageContainer);
        pageContainer = touristNoteDao.selectTouristNoteListByVisitorId(1);

        System.out.println(pageContainer.getList());
    }

    @Test
    public void selectTouristNoteListByDate() throws Exception {
        touristNoteDao.setPageContainer(pageContainer);
        pageContainer = touristNoteDao.selectTouristNoteListByDate(new Date());

        System.out.println(pageContainer.getList());
    }

    @Test
    public void selectTouristNoteListByHeadLine() throws Exception {
        touristNoteDao.setPageContainer(pageContainer);
        pageContainer = touristNoteDao.selectTouristNoteListByHeadLine("li");

        System.out.println(pageContainer.getList());
    }

    @Test
    public void selectTouristNoteListByVisitorIdAndDate() throws Exception {
        touristNoteDao.setPageContainer(pageContainer);
        pageContainer = touristNoteDao.selectTouristNoteListByVisitorIdAndDate(1, new Date());

        System.out.println(pageContainer.getList());
    }

}