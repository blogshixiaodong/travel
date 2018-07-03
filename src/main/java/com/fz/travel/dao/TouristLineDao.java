package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;

import java.io.Serializable;

/**
 * @author Shixiaodong
 * @date 2018/6/29 21:24
 */
public interface TouristLineDao extends PageDao<TouristLine> {

    Integer insertTouristLine(TouristLine touristLine);

    void deleteTouristLine(TouristLine touristLine);

    void updateTouristLine(TouristLine touristLine);

    /********** 旅游线路查询 **********/

    //线路长度查询

    //根据线路编号查询
    TouristLine selectTouristLineById(Serializable touristLineId);

    //根据游记名称查询
    PageContainer<TouristLine> selectTouristLineByName(String touristLineName);

    //查询所有线路
    PageContainer<TouristLine> selectTouristLineList();

    /*
    * @Description:根据用户编号，查询该用户已预定的路线
    * @param :  [visitorId]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.TouristLine>
    */
    PageContainer<TouristLine> selectTouristLineListByVisitorId(Integer visitorId);

}
