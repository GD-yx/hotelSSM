package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 南八
 */
@Controller
public class IndexController {
    @RequestMapping("/index")
    public String index(){
        return "login";
    }


}
