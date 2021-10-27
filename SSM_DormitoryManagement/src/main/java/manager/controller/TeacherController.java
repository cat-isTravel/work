package manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manager.bean.Msg;
import manager.bean.Teacher;
import manager.bean.dormitoryDormNum;
import manager.service.DormNumService;
import manager.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TeacherController {
    @Autowired
    TeacherService teacherService;
    @Autowired
    DormNumService dormNumService;

    @RequestMapping("/teas")
    @ResponseBody
    public Msg getTeas(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn, 8);
        List<Teacher> teas = teacherService.getTeas();
        PageInfo pageInfo = new PageInfo(teas,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/teas",method = RequestMethod.POST)
    @ResponseBody
    public Msg insertTea(Teacher tea){
//        System.out.println(tea);
        if (tea != null){
//            System.out.println("1");
            boolean b = dormNumService.getDormLikeStratum(tea.getDormNum());
            if (b){
//                System.out.println("2");
                boolean b1 = dormNumService.updatePeo(tea.getDormNum());
                if (b1){
                    teacherService.insert(tea);
                    return Msg.success();
                }else {
//                System.out.println("3");
                    Msg msg = new Msg();
                    msg.setMsg("宿舍人数已满");
                    msg.setCode(200);
                    return msg;
                }

            }
        }else {
//            System.out.println("4");
            return Msg.fail();
        }
        return Msg.fail();
    }
    @ResponseBody
    @RequestMapping(value = "/teas",method = RequestMethod.DELETE)
    public Msg deleteByTeaNum(@RequestParam("num") String num){
        Teacher teacher = teacherService.selectByNum(num);
        boolean b = teacherService.delete(num);
        if (b){
            boolean b1 = dormNumService.updatePeoFormDelete(teacher.getDormNum());
            if (b1){
                return Msg.success();
            }
        }
        return Msg.fail();
    }

    @RequestMapping("/teas/{num}")
    @ResponseBody
    public Msg getTeaByNum(@PathVariable("num")String num){
        System.out.println(num);
        Teacher teacher = teacherService.selectByNum(num);
        System.out.println(teacher);
        return Msg.success().add("tea",teacher);
    }

    @ResponseBody
    @RequestMapping(value = "/teas",method = RequestMethod.PUT)
    public Msg updateTea(Teacher tea){
        Teacher teacher = teacherService.selectByNum(tea.getNum());
//        teacherService.update(tea);
        System.out.println(tea);
        System.out.println(teacher);
        if (teacher.getDormNum().equals(tea.getDormNum())){
            return Msg.success();
        }else {
            boolean b = dormNumService.updatePeo(tea.getDormNum());
            boolean b1 = dormNumService.updatePeoFormDelete(teacher.getDormNum());
            if (b & b1){
                return Msg.success();
            }else {
                Msg msg = Msg.fail();
                msg.setMsg("宿舍人数已满");
                return msg;
            }
        }
    }

    @ResponseBody
    @RequestMapping("/tea/roommate")
    public Msg getRoommate(HttpSession session){
        Teacher tea = (Teacher) session.getAttribute("user");
        List<Teacher> teachers = teacherService.selectByDormNum(tea.getDormNum());
        return Msg.success().add("teachers", teachers);
    }

    @ResponseBody
    @RequestMapping("/tea/roomInfo")
    public Msg getRoom(HttpSession session){
        Teacher tea = (Teacher) session.getAttribute("user");
        dormitoryDormNum dorm = dormNumService.getDorm(tea.getDormNum());
        return Msg.success().add("dorm", dorm);
    }
}
