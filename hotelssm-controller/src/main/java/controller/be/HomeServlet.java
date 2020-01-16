package controller.be;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 南八
 */
@Controller
public class HomeServlet  {
	@RequestMapping("/home")
	protected String service() {
        return "home";
	}
}
