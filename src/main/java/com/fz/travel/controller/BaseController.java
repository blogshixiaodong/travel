package com.fz.travel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Shixiaodong
 * @date 2018/6/25 19:58
 */
//@Controller
public class BaseController {

//    @Autowired
//    protected HttpServletRequest request;
//
//    @Autowired
//    protected HttpSession session;
//
//    //获取当前登陆对象
//    protected Object getCurrentRole() {
//        return session.getAttribute("role");
//    }
//
//    //设置当前登陆对象
//    protected void setCurrentRole(Object role) {
//        session.setAttribute("role", role);
//    }
//
//    //注销当前登陆对象
//    protected void removeCurrentRole() {
//        session.removeAttribute("role");
//    }

    //获取时间对象
    protected Date getDate() {
        return new Date();
    }

    //按固定格式获取时间字符串
    protected String getDateToString() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(getDate());
    }

    //获取session
//    protected HttpSession getSession() {
//        return session;
//    }
//
//    //获取request
//    protected HttpServletRequest getRequest() {
//        return request;
//    }

}
