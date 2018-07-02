package com.fz.travel.controller;

import com.opensymphony.xwork2.Action;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Controller
public class AdminAccountController extends BaseController{

    private String jsonResult = "";

    private String accountId;

    private String password;

    //管理员登录验证
    public String adminLoginCheck(){
        if("admin".equals(accountId) && "admin".equals(password)){
            getSession().put("admin","admin");
        }else{
            jsonResult = "登录失败";
        }
        return Action.SUCCESS;
    }

    //管理员退出登录
    public String adminOutLogin(){
        getSession().remove("admin");
        return Action.SUCCESS;
    }


    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }
}
