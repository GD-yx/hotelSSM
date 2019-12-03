package controller;

import com.entity.Room;
import com.entity.RoomType;
import com.github.pagehelper.PageInfo;
import com.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 南八
 */
@Controller
@RequestMapping("/roomtype")
public class RoomTypeController {
    @Autowired
    private RoomTypeService service;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",required = false,defaultValue = "3") int pageSize, Model model){
        List<RoomType> roomTypes = service.getAll(pageNum,pageSize);
        PageInfo pageInfo = new PageInfo(roomTypes);
        model.addAttribute("roomtypes",pageInfo);
        return "roomtype/list";
    }

    @GetMapping("/add")
    public String add(){
        return "/roomtype/add";
    }
    @PostMapping("/insert")
    public String insert(@Valid RoomType roomType, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/roomtype/add";
        }
        service.insert(roomType);
        return "redirect:/roomtype/list";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        System.out.println(id);
        service.delete(id);
        return "redirect:/roomtype/list";
    }
}
