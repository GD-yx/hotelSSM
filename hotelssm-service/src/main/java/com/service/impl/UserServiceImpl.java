package com.service.impl;

import com.dao.UserDao;
import com.entity.Role;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    @Override
    public boolean addUser(User user) {
        return dao.addUser(user);
    }

    @Override
    public User findUser(String id) {
        return dao.findUser(id);
    }

    @Override
    public List<User> getAllUser() {
        return dao.getAll();
    }

    @Override
    public Role getUserRole(String userId) {
        return dao.getRoles(userId);
    }


    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateUserRole(User user, String roleId) {
        dao.deleteRolesByUserId(user.getId());
        dao.insertUserRole(user.getId(),roleId);
    }


    @Override
    public User findUser(String userName, String password) {
        return dao.findUserByUsernameAndPassword(userName, password);
    }

    @Override
    public void deleteRolesByUserId(String userId) {
            dao.deleteRolesByUserId(userId);
    }

    @Override
    public void insertUserRole(String userId, String roleId) {
        dao.insertUserRole(userId, roleId);
    }
}
