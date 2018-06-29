package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.dao.TouristNoteDao;

import java.util.Date;
import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:48
 */
public class TouristNoteDaoImpl extends AbstractBaseDao<TouristNote> implements TouristNoteDao {

    private PageContainer<TouristNote> pageContainer;

    @Override
    public void insertTouristNote(TouristNote touristNote) {
        this.save(touristNote);
    }

    @Override
    public void deleteTouristNote(TouristNote touristNote) {
        this.delete(touristNote);
    }

    @Override
    public void updateTouristNote(TouristNote touristNote) {
        this.update(touristNote);
    }

    @Override
    public PageContainer<TouristNote> getTouristNoteList() {
        return null;
    }

    @Override
    public List<TouristNote> gettouristNoteList(Date date) {
        return null;
    }

    @Override
    public PageContainer<TouristNote> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<TouristNote> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
