package controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author 南八
 */
@Controller
public class JQueryTreeController {

    @RequestMapping("/test/tree")
    public String tree(){
        return "test/tree";
    }
}
