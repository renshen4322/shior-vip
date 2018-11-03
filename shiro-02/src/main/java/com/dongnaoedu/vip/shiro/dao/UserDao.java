package com.dongnaoedu.vip.shiro.dao;

import com.dongnaoedu.vip.shiro.entity.User;

import java.util.List;

public interface UserDao {

    public User createUser(User user);

    public User updateUser(User user);

    public void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

}
