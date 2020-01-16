package controller.be;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller

public class BorrowAddServlet  {
	@RequestMapping("/admin/borrowbook/add")
	protected String service(){
		return "be/borrowAdd";

	}
}
