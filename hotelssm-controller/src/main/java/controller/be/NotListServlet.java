package controller.be;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotListServlet   {
	@RequestMapping("/admin/not/list")
	protected String service(){
        return "be/notList";
	}

}
