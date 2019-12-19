package controller;

import com.entity.Commodity;
import com.entity.CommodityType;
import com.github.pagehelper.PageInfo;
import com.service.CommodityService;
import com.service.CommodityTypeService;
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
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityService service;
    @Autowired
    private CommodityTypeService typeService;

    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "20") int pageSize, Model model){
        List<CommodityType> commodityTypes = typeService.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityTypes);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("commoditytypes",pageInfo);
        modelAndView.setViewName("/commodity/list");
        return modelAndView;
    }

    @PostMapping("/list")
    @ResponseBody
    public PageInfo<Commodity> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Commodity> commodities = service.getAll(pageNum,pageSize);
        PageInfo<Commodity> commodityPageInfo = new PageInfo<>(commodities,3);
        return commodityPageInfo;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "20") int pageSize,
                             @Valid Commodity commodity, BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(commodity);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();

    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid Commodity commodity,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(commodity);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int cid){
        service.delete(cid);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }
}
