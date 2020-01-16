package com.service;

import com.entity.Menu;
import com.entity.Role;

import java.util.List;

/**
 * @author 南八
 */
public interface RoleService {
    boolean addRole(Role role);

    Role findRole(String id);

    List<Role> getAllRole();

    List<Menu> getRolePrivilege(String roleId);
}
