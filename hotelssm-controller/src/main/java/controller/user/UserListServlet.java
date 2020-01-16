package controller.user;

import com.entity.Role;
import com.entity.User;
import com.service.RoleService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 南八
 */
@Controller
public class UserListServlet  {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

	@RequestMapping("/admin/user/list")
	protected String service(Model model){

		List<User> allUser = userService.getAllUser();
		List<Role> roles = roleService.getAllRole();

        model.addAttribute("roles", roles);
        model.addAttribute("allUser", allUser);
		return "be/userList";
	}
}
