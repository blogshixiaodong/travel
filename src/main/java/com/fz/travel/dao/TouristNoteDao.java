package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;

import java.util.Date;
import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:42
 */
public interface TouristNoteDao extends PageDao<TouristNote> {

    void insertTouristNote(TouristNote touristNote);

    void deleteTouristNote(TouristNote touristNote);

    void updateTouristNote(TouristNote touristNote);

    PageContainer<TouristNote> getTouristNoteList();

    List<TouristNote> gettouristNoteList(Date date);

}
