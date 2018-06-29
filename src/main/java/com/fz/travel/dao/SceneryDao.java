package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;

import java.awt.*;
import java.util.List;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public interface SceneryDao extends PageDao<Scenery>{
    /*
    * @Description:添加景点信息
    * @param :  [scenery]
    * @return : java.lang.Long
    */
    Long insertScenery(Scenery scenery);

    /*
    * @Description:批量添加景点信息
    * @param :  [sceneryList]
    * @return : void
    */
    void insertSceneryList(List<Scenery> sceneryList);

    /*
    * @Description:修改景点信息
    * @param :  [scenery]
    * @return : void
    */
    void updateScenery(Scenery scenery);

    /*
    * @Description:删除景点信息
    * @param :  [scenery]
    * @return : void
    */
    void deleteScenery(Scenery scenery);

    /*
    * @Description:根据景点编号查询景点具体信息
    * @param :  [sceneryId]
    * @return : Scenery
    */
    Scenery selectSceneryBySceneryId(Integer sceneryId);

    /*
    * @Description:查询所有景点信息
    * @param :  []
    * @return : PageContainer<Scenery>
    */
    PageContainer<Scenery> selectAllScenery();

}
