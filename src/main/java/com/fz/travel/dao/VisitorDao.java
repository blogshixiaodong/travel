package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
public interface VisitorDao extends PageDao{
    /*
    * @Description:添加游客信息
    * @param :  [visitor]
    * @return : void
    */
    void insertVisitor(Visitor visitor);
    /*
    * @Description:根据用户编号查询游客信息
    * @param :  [visitorId]
    * @return : com.fz.travel.bean.Visitor
    */
    Visitor selectVistorByVisitorId(Integer visitorId);

    /*
    * @Description:查询所有游客信息
    * @param :  []
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Visitor>
    */
    PageContainer<Visitor> selectVisitorList();

    /*
    * @Description:修改用户信息
    * @param :  [visitor]
    * @return : void
    */
    void updateVisitor(Visitor visitor);
}
