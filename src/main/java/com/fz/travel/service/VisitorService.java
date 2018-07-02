package com.fz.travel.service;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.PageDao;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
public interface VisitorService extends PageDao<Visitor>{

    /*
    * @Description:添加游客编号
    * @param :  [visitor]
    * @return : void
    */
    void addVisitor(Visitor visitor);
    /*
    * @Description:根据游客编号查询游客信息
    * @param :  [visitorId]
    * @return : com.fz.travel.bean.Visitor
    */
    Visitor queryVisitorByVistorId(Integer visitorId);

    /*
    * @Description:查询所有游客信息
    * @param :  []
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Visitor>
    */
    PageContainer<Visitor> queryVisitorList();
}
