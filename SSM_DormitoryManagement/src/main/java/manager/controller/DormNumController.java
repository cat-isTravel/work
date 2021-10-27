package manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manager.bean.Msg;
import manager.bean.dormitoryDormNum;
import manager.service.DormNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/dorm")
public class DormNumController {

    @Autowired
    DormNumService dormNumService;

    @ResponseBody
    @RequestMapping(value = "/dormNum",method = RequestMethod.GET)
    public Msg getDormInfoByStratum(@RequestParam(value = "stratum") String stratum,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        stratum = stratum +"%";
        PageHelper.startPage(pn,9);
        List<dormitoryDormNum> dormInfoByStratum = dormNumService.getDormInfoByStratum(stratum);
        PageInfo pageInfo = new PageInfo(dormInfoByStratum,5);
        return Msg.success().add("dormInfo",pageInfo);
    }
}
