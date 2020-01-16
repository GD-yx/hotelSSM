package controller.be;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookAddServlet  {
	@RequestMapping("/admin/book/add")
	protected String service() {

        return "be/bookAdd";
	}
}
