package com.service.impl;

import com.dao.RoleDao;
import com.entity.Menu;
import com.entity.Role;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao dao;

    @Override
    public boolean addRole(Role role) {
        return dao.addRole(role);
    }

    @Override
    public Role findRole(String id) {
        return dao.findRole(id);
    }

    @Override
    public List<Role> getAllRole() {
        return dao.getAll();
    }

    @Override
    public List<Menu> getRolePrivilege(String roleId) {
        return dao.getMenusByRoleId(roleId);
    }
}
