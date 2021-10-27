package manager.controller;


import manager.bean.Msg;
import manager.bean.college;
import manager.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CollegeController {
    @Autowired
    CollegeService collegeService;

    @ResponseBody
    @RequestMapping("/col")
    public Msg getCols(){
        List colleges = collegeService.getColleges();
        return Msg.success().add("colleges",colleges);
    }
    @ResponseBody
    @RequestMapping("/col/{name}")
    public Msg getColsByName(@PathVariable("name")String name){
        college collegesByName = collegeService.getCollegesByName(name);
        return Msg.success().add("collegesByName",collegesByName);
    }


}
