package controller;

import com.entity.Commodity;
import com.entity.CommodityType;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.service.CommodityService;
import com.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
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
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityService service;
    @Autowired
    private CommodityTypeService typeService;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "3") int pageSize, Model model){
        List<Commodity> commodities = service.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodities);
        model.addAttribute("commodities",pageInfo);
        return "/commodity/list";
}

    @GetMapping("/add")
    public String add(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                      @RequestParam(value = "pageSize", required = false, defaultValue = "3") int pageSize, Model model){
        List<CommodityType> commodityTypes = typeService.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityTypes);
        model.addAttribute("commoditytypes",pageInfo);
        return "/commodity/add";
    }
    @PostMapping("/insert")
    public String insert(@Valid Commodity commodity, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/commodity/add";
        }
        service.insert(commodity);
        return "redirect:/commodity/list";
    }

    @GetMapping("/edit")
    public String getById(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize", required = false, defaultValue = "3") int pageSize,Integer id, Model model){
        List<CommodityType> commodityTypes = typeService.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityTypes);
        model.addAttribute("commoditytypes",pageInfo);
        Commodity commodity = service.getById(id);
        model.addAttribute("commodity",commodity);
        return "/commodity/edit";
    }
    @PostMapping("/update")
    public String update(@Valid Commodity commodity,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/commodity/edit";
        }
        service.update(commodity);
        return "redirect:/commodity/list";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        service.delete(id);
        return "redirect:/commodity/list";
    }
}
