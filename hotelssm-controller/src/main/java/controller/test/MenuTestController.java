package controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * @author 南八
 */
@Controller
public class MenuTestController {

    @RequestMapping("/test/menu")
    public String menu(){
        return "test/menu";
    }
}
