package controller;

import com.entity.Customer;
import com.github.pagehelper.PageInfo;
import com.service.CustomerService;
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
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService service;

    @RequestMapping("/index")
    public String index(){
        return "customer/list";
    }

    @PostMapping("/list")
    @ResponseBody
    public PageInfo<Customer> list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Customer> customers = service.getAll(pageNum, pageSize);
        PageInfo<Customer> customerPageInfo = new PageInfo<>(customers,3);
        return customerPageInfo;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@Valid Customer customer,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(customer);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid Customer customer,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(customer);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int id){
        service.delete(id);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }
}
