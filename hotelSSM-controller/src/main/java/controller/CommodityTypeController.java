package controller;

import com.entity.CommodityType;
import com.github.pagehelper.PageInfo;
import com.service.CommodityTypeService;
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
@RequestMapping("/commoditytype")
public class CommodityTypeController {
    @Autowired
    private CommodityTypeService service;
    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "3") int pageSize, Model model){
        List<CommodityType> commodityTypes = service.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityTypes);
        model.addAttribute("commoditytypes",pageInfo);
        return "/commoditytype/list";
    }

    @GetMapping("/add")
    public String add(){
        return "/commoditytype/add";
    }
    @PostMapping("/insert")
    public String insert(@Valid CommodityType commodityType, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/commoditytype/add";
        }
        service.insert(commodityType);
        return "redirect:/commoditytype/list";
    }

    @GetMapping("/edit")
    public String getById(int id,Model model){
        CommodityType commodityType = service.getById(id);
        model.addAttribute("commoditytype",commodityType);
        return "/commoditytype/edit";
    }
    @PostMapping("/update")
    public String update(@Valid CommodityType commodityType,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/commditytype/edit";
        }
        service.update(commodityType);
        return "redirect:/commoditytype/list";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        service.delete(id);
        return "redirect:/commoditytype/list";
    }
}
