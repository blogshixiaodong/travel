package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
public interface VisitorAccountDao extends PageDao<VisitorAccount> {
    /*
    * @Description:添加游客账号信息
    * @param :  [visitorAccount]
    * @return : void
    */
    void insertVisitorAccount(VisitorAccount visitorAccount);

    /*
    * @Description:根据用户账号 查询用户账号信息
    * @param :  [visitorAccount]
    * @return : void
    */
    VisitorAccount selectVisitorAccountByVisitorAccountId(Integer visitorAccountId);

    /*
    * @Description:查询所有账号信息
    * @param :  []
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Visitor>
    */
   PageContainer<VisitorAccount> selectVisitorList();

}
