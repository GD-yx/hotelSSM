package controller;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.entity.Commodity;
import com.entity.CommodityType;
import com.entity.Room;
import com.entity.RoomType;
import com.github.pagehelper.PageInfo;
import com.service.RoomService;
import com.service.RoomTypeService;
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
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService service;
    @Autowired
    private RoomTypeService typeService;

    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "20") int pageSize){
        List<RoomType> roomTypes = typeService.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(roomTypes);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roomtypes",pageInfo);
        modelAndView.setViewName("/room/list");
        return modelAndView;
    }

    @PostMapping("/list")
    @ResponseBody
    public PageInfo<Room> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Room> rooms = service.getAll(pageNum,pageSize);
        PageInfo<Room> roomPageInfo = new PageInfo<>(rooms,3);
        return roomPageInfo;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "4") int pageSize,
                             @Valid Room room, BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(room);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();

    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid Room room,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(room);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int roomid){
        service.delete(roomid);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }

}