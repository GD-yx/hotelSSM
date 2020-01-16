package controller.be;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ReturnListServlet {
	@RequestMapping("/admin/return/list")
	protected String service() {
		return "be/returnList";
	}
}
