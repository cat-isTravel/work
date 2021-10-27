package manager.controller;

import manager.bean.Msg;
import manager.bean.faculties;
import manager.service.facultiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class facultiesController {
    @Autowired
    facultiesService facultiesService;

    @ResponseBody
    @RequestMapping(value = "/fas",method = RequestMethod.GET)
    public Msg getFasById(@RequestParam(value = "id",defaultValue = "1") Integer id){
        List<faculties> faculties = facultiesService.getFacultiesById(id);
        return Msg.success().add("faculties",faculties);
    }
    @ResponseBody
    @RequestMapping(value = "/fas/{name}",method = RequestMethod.GET)
    public Msg getFasByName(@PathVariable("name") String name){
        List<faculties> facultiesByName = facultiesService.getFacultiesByName(name);
        return Msg.success().add("facultiesByName",facultiesByName);
    }
}
