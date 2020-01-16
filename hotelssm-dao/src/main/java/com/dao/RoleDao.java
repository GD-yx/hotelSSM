package com.dao;

import com.entity.Menu;
import com.entity.Role;

import java.util.List;

/**
 * @author 南八
 */
public interface RoleDao {
    boolean addRole(Role role);

    Role findRole(String id);

    List<Role> getAll();

    List<Menu> getMenusByRoleId(String roleId);

}
