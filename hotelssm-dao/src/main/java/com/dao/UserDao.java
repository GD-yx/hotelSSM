package com.dao;

import com.entity.Role;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface UserDao {
    boolean addUser(User user);

    User findUser(String id);

    List<User> getAll();

    Role getRoles(String userId);

    void updateRole(User user, String roleId);

    User findUserByUsernameAndPassword(@Param("username") String userName, @Param("password") String password);

    void deleteRolesByUserId(String userId);

    void insertUserRole(@Param("userId") String userId, @Param("roleId") String roleId);
}
