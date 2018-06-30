package com.fz.travel.service;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import javafx.scene.Scene;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public interface SceneryService {
    /*
    * @Description:添加景点信息
    * @param :  [scenery]
    * @return : java.lang.Long
    */
    Long addScenery(Scenery scenery);

    /*
    * @Description:修改景点信息
    * @param :  [scenery]
    * @return : void
    */
    void updateScenery(Scenery scenery);

    /*
    * @Description:根据景点编号删除景点信息
    * @param :  [sceneryId]
    * @return : void
    */
    String deleteSceneryBySceneryId(Integer sceneryId);

    /*
    * @Description:查询所有景点信息
    * @param :  [pageContainer]
    * @return : PageContainer<Scenery>
    */
    PageContainer<Scenery> queryAllScenery(PageContainer<Scenery> pageContainer);

    /*
    * @Description:根据景点编号查询景点的具体信息
    * @param :  [sceneryId]
    * @return : com.fz.travel.bean.Scenery
    */
    Scenery querySceneryBySceneryId(Integer sceneryId);

    /*
    * @Description:根据景点名称查询景点
    * @param :  [pageContainer, hotelName]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Scenery>
    */
    PageContainer<Scenery> querySceneryBySceneryName(PageContainer<Scenery> pageContainer,String hotelName);

}
