package com.fz.travel.service.impl;

import com.fz.travel.bean.User;
import com.fz.travel.dao.UserDao;
import com.fz.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 21:51
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User getUser(Integer id) {
        return userDao.getUser(id);
    }

    @Override
    public void deleteUser(Integer id) {
        this.deleteUser(id);
    }

    @Override
    public void updateUser(User user) {
        this.updateUser(user);
    }

    @Override
    public List<User> getUserList() {
        return this.getUserList();
    }
}
