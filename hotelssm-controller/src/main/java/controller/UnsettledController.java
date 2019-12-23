package controller;

import com.entity.*;
import com.github.pagehelper.PageInfo;
import com.service.CustomerService;
import com.service.RoomService;
import com.service.SettledService;
import com.service.UnsettledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import vo.ResponseVo;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 南八
 */
@Controller
@RequestMapping("/unsettled")
public class UnsettledController {
    @Autowired
    private UnsettledService service;

    @Autowired
    private SettledService settledService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private RoomService roomService;

    @RequestMapping("/index")
    public String index(){
        return "unsettled/list";
    }

    /**查询未结账*/
    @PostMapping("/list")
    @ResponseBody
    public PageInfo<Unsettled> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Unsettled> unsettleds = service.getAll(pageNum,pageSize);
        PageInfo<Unsettled> unsettledPageInfo = new PageInfo<>(unsettleds,3);
        return unsettledPageInfo;
    }


    /**对某行未结账进行结账操作*/
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(@Valid Settled settled,
                             BindingResult bindingResult,int id){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        settledService.insert(settled);
        service.delete(id);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }


    /**安排房间*/
    @RequestMapping("/addroom")
    @ResponseBody
    public ModelAndView addroom(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "100") int pageSize){
        List<Room> rooms = roomService.getAll(pageNum, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("rooms",rooms);
        modelAndView.setViewName("/unsettled/addroom");
        return modelAndView;
    }
    @PostMapping("/insertroom")
    @ResponseBody
    public ModelAndView insertroom(@Valid Unsettled unsettled){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/unsettled/list");
        service.insert(unsettled);
        return modelAndView;
    }


    /**消费*/
    @RequestMapping("/consume")
    @ResponseBody
    public ModelAndView consume(int id,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        ModelAndView modelAndView = new ModelAndView();
        Unsettled unsettled = service.getById(id);
        modelAndView.addObject("unsettled",unsettled);
        modelAndView.setViewName("/unsettled/consume");
        return modelAndView;
    }

   /* @PostMapping("/consumecommodity")
    @ResponseBody
    public ModelAndView consumecommodity(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/unsettled/consume");
        return modelAndView;
    }*/

    /**登记顾客信息，入住*/
    @GetMapping("/register")
    @ResponseBody
    public ModelAndView register(int id){
        ModelAndView modelAndView = new ModelAndView();
        Unsettled unsettled = service.getById(id);
        modelAndView.addObject("unsetteld",unsettled);
        modelAndView.setViewName("/unsettled/register");
        return modelAndView;
    }

    @PostMapping("/registration")
    @ResponseBody
    public ModelAndView registration(@Valid Unsettled unsettled, @Valid Customer customer){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/unsettled/list");
        service.update(unsettled);
        customerService.insert(customer);
        return modelAndView;
    }

}
