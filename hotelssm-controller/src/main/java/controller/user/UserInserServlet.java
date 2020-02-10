package controller.user;


import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 南八
 */
@Controller
public class UserInserServlet  {
    @Autowired
    private UserService userService;

	@RequestMapping("/admin/user/inser")
	protected void service(String userName,String password,String roleId) {

		User user = new User();
		user.setUsername(userName);
		user.setPassword(password);;


		userService.addUser(user);
		System.out.println(user);
		User u = userService.findUser(userName,password);
		userService.updateUserRole(u, roleId);
		
	}
	
}
