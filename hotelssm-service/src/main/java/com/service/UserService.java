package com.service;

import com.entity.Role;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface UserService {
    boolean addUser(User user);

    User findUser(String id);

    List<User> getAllUser();

    Role getUserRole(String userId);

    void updateUserRole(User user, String roleId);

    User findUser(String userName,String password);

    void deleteRolesByUserId(String userId);

    void insertUserRole(String userId, String roleId);
}
