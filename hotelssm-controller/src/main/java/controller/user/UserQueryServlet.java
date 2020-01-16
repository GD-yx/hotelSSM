package controller.user;


import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


/**
 * @author 南八
 */
@Controller
public class UserQueryServlet {
    @Autowired
    private UserService userService;

    @RequestMapping("/login/query")
    @ResponseBody
    protected Object service(String userName, String password, HttpSession session)  {

        User user = userService.findUser(userName, password);

        if (user != null) {
            session.setAttribute("user", user);
            return true;
        } else {
            return false;
        }
    }
}
