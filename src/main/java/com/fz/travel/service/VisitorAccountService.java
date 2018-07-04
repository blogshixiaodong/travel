package com.fz.travel.service;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
public interface VisitorAccountService {

    /*
    * @Description:添加游客账号信息
    * @param :  [visitorAccount]
    * @return : void
    */
    void addVisitorAccount(VisitorAccount visitorAccount);

    /*
    * @Description:根据用户账号编号 查询用户账号信息
    * @param :  [visitorAccount]
    * @return : void
    */
    VisitorAccount queryVisitorAccountByVisitorAccountId(Integer visitorAccountId);

    /*
    * @Description:查询所用用户账号
    * @param :  []
    * @return : void
    */
    PageContainer<VisitorAccount> queryVisitorAccountList();

    /*
    * @Description:检验账号密码是否错误
    * @param :  [visitorAccount]
    * @return : boolean
    */
    Visitor visitorAccountLoginCheck(VisitorAccount visitorAccount);

    /*
    * @Description:根据账号编号 查询是否有该账号
    * @param :  [visitorAccountId]
    * @return : java.lang.String
    */
    String hasVisitorAccount(Integer visitorAccountId);
}
