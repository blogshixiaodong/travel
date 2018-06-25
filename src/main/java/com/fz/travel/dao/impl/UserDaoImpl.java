package com.fz.travel.dao.impl;

import com.fz.travel.bean.User;
import com.fz.travel.dao.UserDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 21:43
 */
@Repository
public class UserDaoImpl extends AbstractBaseDao<User> implements UserDao {

    @Override
    public User getUser(Integer id) {
        return this.get(id);
    }

    @Override
    public void deleteUser(Integer id) {
        this.delete(get(id));
    }

    @Override
    public void updateUser(User user) {
        this.update(user);
    }

    @Override
    public List<User> getUserList() {
        return this.list("FROM User");
    }
}
