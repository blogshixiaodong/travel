package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.dao.TouristNoteDao;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:48
 */
@Repository
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
    public TouristNote selectTouristNoteById(Serializable touristNoteId) {
        return this.get(touristNoteId);
    }

    @Override
    public PageContainer<TouristNote> selectTouristNoteList() {
        String hql = "FROM TouristNote";
        return this.list(hql, pageContainer);
    }

    @Override
    public PageContainer<TouristNote> selectTouristNoteListByVisitorId(Integer visitorId) {
        String hql = "FROM TouristNote t where t.visitor.visitorId = ?";
        return this.list(hql, pageContainer, visitorId);
    }

    @Override
    public PageContainer<TouristNote> selectTouristNoteListByDate(Date date) {
        String hql = "FROM TouristNote t where t.touristNoteTime = STR_TO_DATE(?,'%Y-%m-%d')";
        return this.list(hql, pageContainer, date);
    }

    @Override
    public PageContainer<TouristNote> selectTouristNoteListByHeadLine(String headLine) {
        String hql = "FROM TouristNote t where t.touristNoteHeadLine like ?";
        return this.list(hql, pageContainer, "%" + headLine + "%");
    }

    @Override
    public PageContainer<TouristNote> selectTouristNoteListByVisitorIdAndDate(Integer visitorId, Date date) {
        String hql = "FROM TouristNote t where t.visitor.visitorId = ? AND t.touristNoteTime = STR_TO_DATE(?,'%Y-%m-%d')";
        return this.list(hql, pageContainer, visitorId, date);
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
