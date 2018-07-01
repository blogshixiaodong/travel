package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.dao.TouristNoteDao;
import com.fz.travel.service.TouristNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:52
 */
@Service
public class TouristNoteServiceImpl implements TouristNoteService {

    @Autowired
    private TouristNoteDao touristNoteDao;

    @Override
    public void saveTouristNote(TouristNote touristNote) {
        touristNoteDao.insertTouristNote(touristNote);
    }

    @Override
    public PageContainer<TouristNote> queryTouristNoteListByHeadLine(String headLine, PageContainer<TouristNote> pageContainer) {
        touristNoteDao.setPageContainer(pageContainer);
        return touristNoteDao.selectTouristNoteListByHeadLine(headLine);
    }

    @Override
    public PageContainer<TouristNote> queryTouristNoteListByDate(Date date, PageContainer<TouristNote> pageContainer) {
        touristNoteDao.setPageContainer(pageContainer);
        return touristNoteDao.selectTouristNoteListByDate(date);
    }

    @Override
    public PageContainer<TouristNote> queryTouristNoteListByVisitorId(Integer visitorId, PageContainer<TouristNote> pageContainer) {
        touristNoteDao.setPageContainer(pageContainer);
        return touristNoteDao.selectTouristNoteListByVisitorId(visitorId);
    }

    @Override
    public PageContainer<TouristNote> queryTouristNoteListByVisitorIdAndDate(Integer visitorId, Date date, PageContainer<TouristNote> pageContainer) {
        touristNoteDao.setPageContainer(pageContainer);
        return touristNoteDao.selectTouristNoteListByVisitorIdAndDate(visitorId, date);
    }
}
