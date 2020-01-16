package controller;

import com.entity.Consume;
import com.entity.Customer;
import com.entity.Settled;
import com.entity.Unsettled;
import com.github.pagehelper.PageInfo;
import com.service.ConsumeService;
import com.service.UnsettledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import vo.ResponseVo;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 南八
 */
@Controller
@RequestMapping("/consume")
public class ConsumeController {

    @Autowired
    private ConsumeService service;
    @Autowired
    private UnsettledService unsettledService;

    @RequestMapping("/index")
    public String index(){
        return "consume/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public PageInfo<Consume> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                    @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Consume> consumes = service.getAll(pageNum,pageSize);
        PageInfo<Consume> consumePageInfo = new PageInfo<>(consumes,3);
        return consumePageInfo;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(Integer id){
        service.delete(id);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }


   /* @RequestMapping("/consume")
    public String consume(){
        return "unsettled/list";
    }*/
   /* @RequestMapping("/consume")
    @ResponseBody
    public ModelAndView consume(int id,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        ModelAndView modelAndView = new ModelAndView();
        Unsettled unsettled = unsettledService.getById(id);
        modelAndView.addObject("unsettled",unsettled);
        modelAndView.setViewName("/unsettled/consume");
        return modelAndView;
    }*/

    @RequestMapping("/getByRoomId")
    @ResponseBody
    public PageInfo getByRoomId(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "4") int pageSize,
                                @RequestParam(value = "roomid") int roomid) {
        List<Consume> consumes = service.getByRoomId(pageNum, pageSize, roomid);
        PageInfo<Consume> consumePageInfo = new PageInfo<>(consumes,3);
        return consumePageInfo;
    }


    @RequestMapping("/getByName")
    @ResponseBody
    public PageInfo getByRoomId(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "4") int pageSize,
                                @RequestParam(value = "name") String name) {
        List<Consume> consumes = service.getByName(pageNum, pageSize, name);
        PageInfo<Consume> consumePageInfo = new PageInfo<>(consumes,3);
        return consumePageInfo;
    }


    @PostMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@Valid Consume consume,
                             BindingResult bindingResult){

        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(consume);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();
    }



}
