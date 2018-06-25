package com.fz.travel.controller;

import com.fz.travel.bean.User;
import com.fz.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * @author Shixiaodong
 * @date 2018/6/24 21:38
 */
@Controller("controllerDemo")
@Scope("prototype")
public class ControllerDemo {

    @Autowired
    private UserService userService;

    public String add() {
        System.out.println(userService.getUser(1));
        return "demo";
    }

    public String delete() {
        userService.deleteUser(2);
        return "demo";
    }

    public String update() {
        User user = userService.getUser(3);
        user.setUsername("UPDATE");
        userService.updateUser(user);
        return "demo";
    }

    public String list() {
        userService.getUserList().toString();
        return "demo";
    }

}
