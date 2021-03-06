package com.dao;


import com.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author 南八
 */
public interface PrivilegeDao {

    void deleteRolePrivilege(String roleId);

    void insertRolePrivilege(@Param("roleId") String roleId, @Param("privileges") List<Menu> privileges);
}
