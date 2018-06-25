package com.fz.travel.service;

import com.fz.travel.bean.User;

import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 21:48
 */
public interface UserService  {

    User getUser(Integer id);

    void deleteUser(Integer id);

    void updateUser(User user);

    List<User> getUserList();

}
