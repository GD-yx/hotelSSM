package controller;

import com.entity.Room;
import com.github.pagehelper.PageInfo;
import com.service.RoomService;
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
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService service;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",required = false,defaultValue = "3") int pageSize, Model model){
        List<Room> rooms = service.getAll(pageNum,pageSize);
        PageInfo pageInfo = new PageInfo(rooms);
        model.addAttribute("rooms",pageInfo);
        return "room/list";
    }
    @GetMapping("/add")
    public String add(){
        return "/room/add";
    }
    @PostMapping("/insert")
    public String insert(@Valid Room room, BindingResult bindingResult){
            if(bindingResult.hasErrors()){
                return "/room/add";
            }
            service.insert(room);
            return "redirect:/room/list";
    }
}
