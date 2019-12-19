package controller;

import com.entity.Room;
import com.entity.RoomType;
import com.github.pagehelper.PageInfo;
import com.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vo.ResponseVo;

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

    @RequestMapping("/index")
    public String index(){
        return "roomtype/list";
    }

    @PostMapping("/list")
    @ResponseBody
    public PageInfo<RoomType> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<RoomType> roomTypeList = service.getAll(pageNum,pageSize);
        PageInfo<RoomType> roomTypePageInfo = new PageInfo<>(roomTypeList,3);
        return roomTypePageInfo;
    }


    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@Valid RoomType roomType,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(roomType);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid RoomType roomType,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(roomType);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int rtid){
        service.delete(rtid);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }

}
