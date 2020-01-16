package controller.be;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author 南八
 */
@Controller
public class LoginServlet  {
	@RequestMapping("/login")
	protected String service() {
        return "login";
	}
}
