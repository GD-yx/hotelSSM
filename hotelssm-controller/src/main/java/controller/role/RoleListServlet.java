package controller.role;



import com.entity.Role;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 南八
 */
@Controller
public class RoleListServlet  {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/admin/role/list")
	protected String service(Model model) {

		List<Role> role = roleService.getAllRole();

		model.addAttribute("role", role);
		return "be/roleList";
	}

}
