package com.fz.travel.dao;

import com.fz.travel.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 21:41
 */

public interface UserDao {

    User getUser(Integer id);

    void deleteUser(Integer id);

    void updateUser(User user);

    List<User> getUserList();

}
