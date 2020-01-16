package controller.be;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookListServlet  {
	@RequestMapping("/admin/book/list")
	protected String service() {
		return "be/bookList";
	}
}
