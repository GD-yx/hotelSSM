package controller;

import com.entity.CommodityType;
import com.github.pagehelper.PageInfo;
import com.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vo.ResponseVo;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 南八
 */
@Controller
@RequestMapping("/commoditytype")
public class CommodityTypeController {

    @Autowired
    private CommodityTypeService service;


    @RequestMapping("/index")
    public String index(){
        return "commoditytype/list";
    }

    @PostMapping("/list")
    @ResponseBody
    public PageInfo<CommodityType> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<CommodityType> commodityTypes = service.getAll(pageNum,pageSize);
        PageInfo<CommodityType> commodityTypePageInfo = new PageInfo<>(commodityTypes,3);
        return commodityTypePageInfo;
    }


    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@Valid CommodityType commodityType,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(commodityType);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid CommodityType commodityType,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(commodityType);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int coid){
        service.delete(coid);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }
}
