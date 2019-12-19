package controller;

import com.entity.Employee;
import com.github.pagehelper.PageInfo;
import com.service.EmployeeService;
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
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService service;


    @RequestMapping("/index")
    public String index(){
        return "employee/list";
    }

    @ResponseBody
    @PostMapping("/list")
    public PageInfo<Employee> list (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                    @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Employee> employees = service.getAll(pageNum,pageSize);
        PageInfo<Employee> employeePageInfo = new PageInfo<>(employees,3);
        System.out.println(employeePageInfo);
        return employeePageInfo;
    }


    @RequestMapping("/insert")
    @ResponseBody
    public ResponseVo insert(@Valid Employee employee,  BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("添加失败！").build();
        }
        service.insert(employee);
        return ResponseVo.newBuilder().code("200").message("添加成功！").build();
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResponseVo update(@Valid Employee employee,
                             BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return ResponseVo.newBuilder().code("500").message("修改失败！").build();
        }
        service.update(employee);
        return ResponseVo.newBuilder().code("200").message("修改成功！").build();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int id){
        service.delete(id);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }

}
