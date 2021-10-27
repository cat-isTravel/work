package manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manager.bean.ManagerUser;
import manager.bean.Msg;
import manager.service.ManagerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    ManagerUserService managerUserService;

    @ResponseBody
    @RequestMapping("/getUsers")
    public Msg getAllUser(@RequestParam("pn")Integer pn){
        PageHelper.startPage(pn, 8);
        List<ManagerUser> users = managerUserService.getAll();
        PageInfo pageInfo = new PageInfo(users,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/User",method = RequestMethod.DELETE)
    public Msg deleteUserById(Integer id){
        managerUserService.deleteById(id);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/User",method = RequestMethod.POST)
    public Msg InsertUser(ManagerUser user,String OkPsw){
        if (user.getUsername() == "" || user.getPassword() == ""){
            return Msg.fail();
        }
        if (OkPsw.equals(user.getPassword())){
            managerUserService.addUser(user);
            return Msg.success();
        }
       return Msg.fail();
    }
    @ResponseBody
    @RequestMapping("/User/{id}")
    public Msg getUserById(@PathVariable("id") Integer id){
        ManagerUser user = managerUserService.getUserById(id);
        return Msg.success().add("user", user);
    }

    @ResponseBody
    @RequestMapping(value = "/User",method = RequestMethod.PUT)
    public Msg updateUser(ManagerUser user ,String OkPsw){
        if (user.getUsername() == "" || user.getPassword() == ""){
            return Msg.fail();
        }
        if (OkPsw.equals(user.getPassword())){
            managerUserService.updateUser(user);
            return Msg.success();
        }
        return Msg.fail();
    }

    @ResponseBody
    @RequestMapping(value = "/User",params = "ids",method = RequestMethod.DELETE)
    public Msg deleteAll(@RequestParam("ids")String ids){
        String[] strings = ids.split("-");
        System.out.println(ids);
        List<Integer> list = new ArrayList<>();
        for (String string : strings) {
            list.add(Integer.parseInt(string));
        }
        managerUserService.deleteAll(list);
        return Msg.success();
    }

}
