package com.service.impl;

import com.dao.PrivilegeDao;
import com.entity.Menu;
import com.entity.Role;
import com.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class PrivilegeServiceImpl implements PrivilegeService {

    @Autowired
    private PrivilegeDao dao;

    @Override
    public void deleteRolePrivilege(String roleId) {
        dao.deleteRolePrivilege(roleId);
    }

    @Override
    public void insertRolePrivilege(String roleId, List<Menu> privileges) {
        dao.insertRolePrivilege(roleId, privileges);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateRolePrivilege(Role role, List<Menu> privileges) {
        dao.deleteRolePrivilege(role.getId());
        dao.insertRolePrivilege(role.getId(), privileges);
    }
}
