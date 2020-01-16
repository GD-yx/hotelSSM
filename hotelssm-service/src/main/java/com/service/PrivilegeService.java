package com.service;

import com.entity.Menu;
import com.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface PrivilegeService {
    void deleteRolePrivilege(String roleId);

    void insertRolePrivilege(String roleId, List<Menu> privileges);

    void updateRolePrivilege(Role role, List<Menu> privileges);
}
