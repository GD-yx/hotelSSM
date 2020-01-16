package controller.privilege;


import com.entity.Menu;
import com.entity.Role;
import com.service.RoleService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * @author 南八
 */
@Controller
public class PrivilegeServlet  {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

	@RequestMapping("/privileges/query")
    @ResponseBody
	protected List<Menu> service(String id) throws ServletException, IOException {

		Role roles = userService.getUserRole(id);
		List<Menu> list = roleService.getRolePrivilege(roles.getId());
		
		return list;
	}

	@RequestMapping("/unauthorized")
    public String unAuthorized(){
        return "unauthorized";
    }
}
