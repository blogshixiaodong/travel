package com.fz.travel.service;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;

import java.util.Date;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:51
 */

public interface TouristNoteService {

    //保存游记
    void saveTouristNote(TouristNote touristNote);

    /***********查看游记**********/

    //通过标题模糊查询
    PageContainer<TouristNote> queryTouristNoteListByHeadLine(String headLine, PageContainer<TouristNote> pageContainer);

    //通过时间查询
    PageContainer<TouristNote> queryTouristNoteListByDate(Date date, PageContainer<TouristNote> pageContainer);

    //通过用户的Id查询
    PageContainer<TouristNote> queryTouristNoteListByVisitorId(Integer visitorId, PageContainer<TouristNote> pageContainer);

    //通过用户的Id和时间查询
    PageContainer<TouristNote> queryTouristNoteListByVisitorIdAndDate(Integer visitorId, Date date, PageContainer<TouristNote> pageContainer);

}
