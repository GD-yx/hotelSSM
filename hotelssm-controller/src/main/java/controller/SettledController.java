package controller;

import com.entity.Settled;
import com.github.pagehelper.PageInfo;
import com.service.SettledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import vo.ResponseVo;

import java.util.List;

/**
 * @author 南八
 */
@Controller
@RequestMapping("/settled")
public class SettledController {
    @Autowired
    private SettledService settledService;

    /**查询已结账*/
    @PostMapping("/list")
    @ResponseBody
    public PageInfo<Settled> list2 (@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                    @RequestParam(value = "pageSize",defaultValue = "4") int pageSize){
        List<Settled> settleds = settledService.getAll(pageNum,pageSize);
        PageInfo<Settled> settledPageInfo = new PageInfo<>(settleds,3);
        return settledPageInfo;
    }

    /**删除已结账的客户信息*/
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseVo delete(int id){
        settledService.delete(id);
        return ResponseVo.newBuilder().code("200").message("删除成功！").build();
    }

}
