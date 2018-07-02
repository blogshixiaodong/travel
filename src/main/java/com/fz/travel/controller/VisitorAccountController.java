package com.fz.travel.controller;

import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;
import com.fz.travel.service.VisitorAccountService;
import com.opensymphony.xwork2.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Controller
public class VisitorAccountController extends BaseController{

    private String jsonResult = "";

    private VisitorAccount visitorAccount;

    @Autowired
    private VisitorAccountService visitorAccountService;

    //用户注册
    public String createVisitorAccount(){
        visitorAccountService.addVisitorAccount(visitorAccount);
        return Action.SUCCESS;
    }

    //用户登录
    public String visitorLoginCheck(){
        Visitor visitor;
        if( (visitor = visitorAccountService.visitorAccountLoginCheck(visitorAccount)) != null){
            getSession().put("visitor",visitor);
        }else {
            jsonResult = "登录失败";
        }
        return Action.SUCCESS;
    }

    //用户退出登录
    public String visitorOutLogin(){
        getSession().remove("visitor");
        return Action.SUCCESS;
    }

    public VisitorAccount getVisitorAccount() {
        return visitorAccount;
    }

    public void setVisitorAccount(VisitorAccount visitorAccount) {
        this.visitorAccount = visitorAccount;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }
}
