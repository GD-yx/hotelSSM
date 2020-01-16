package controller.role;


import com.entity.Menu;
import com.entity.Role;
import com.service.MenuService;
import com.service.PrivilegeService;
import com.service.RoleService;
import com.service.impl.PrivilegeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 南八
 */
@Controller
public class RolePrivilegeInsertServlet  {

    @Autowired
    private PrivilegeService privilegeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

	@RequestMapping("/admin/role-privilege/inser")
    @ResponseBody
	protected Object service(String[] privilege_id,String role_id) {

		Role role = roleService.findRole(role_id);

		List<Menu> list = new ArrayList<Menu>();
		for(String pid:privilege_id) {
			Menu privilege = menuService.findMenuById(pid);
			list.add(privilege);
		}

        privilegeService.updateRolePrivilege(role,list);
		return true;
		
	}
}
