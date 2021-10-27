package manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import manager.bean.Msg;
import manager.bean.Student;
import manager.bean.dormitoryDormNum;
import manager.service.DormNumService;
import manager.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Transactional
public class StudentController {
    @Autowired(required = false)
    StudentService studentService;

    @Autowired
    DormNumService dormNumService;
    @RequestMapping("/list")
//    @ResponseBody
    public String getStu(String username, String password){
//        if ()
//        request.getRequestDispatcher().forward();
//        System.out.println(username);
//        System.out.println(password);

        return "forward:/stu";
    }
    @RequestMapping("/stu")
    public String getList(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        return "manager/dormManager";
    }


    @ResponseBody
    @RequestMapping(value = "/Stus")
    public Msg getAllStudent(Model model, @RequestParam(value = "pn",required = false,defaultValue = "1")Integer pn){
//        System.out.println("1111");
        PageHelper.startPage(pn,8);
//
        List<Student> allStudent = studentService.getAllStudent();
        PageInfo pageInfo = new PageInfo(allStudent,5);
//        System.out.println(pageInfo.getPageNum());
//        System.out.println(pageInfo.getTotal());
//        pageInfo.setNavigatepageNums(pagNums);
//        pageInfo.getPages();
//        model.addAttribute("pageInfo",pageInfo);

        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/Stus",method = RequestMethod.POST)
    public Msg insertStu(Student stu){
//        System.out.println(hour_num);
        System.out.println("阻止失败");
//        System.out.println(stu.getNum());
        boolean b1 = studentService.getStuByNum(stu.getNum());
        boolean b2 = dormNumService.getDormLikeStratum(stu.getDormNum());
        if (b1 && b2){
            boolean b = dormNumService.updatePeo(stu.getDormNum());
            if (b){
                studentService.insertStu(stu);
                return Msg.success();
            }else {
                Msg msg = Msg.fail();
                msg.setMsg("宿舍人数已满");
                return msg;
            }




        }
        else {
            return Msg.fail();
        }
//        return null;
    }
    @ResponseBody
    @RequestMapping(value = "/Stus/{id}",method = RequestMethod.GET)
    public Msg getStuById(@PathVariable Integer id){
        Student stuById = studentService.getStuById(id);
        return Msg.success().add("stu",stuById);
    }
    @ResponseBody
    @RequestMapping(value = "/Stus/{id}",method = RequestMethod.PUT)
    public Msg UpdateStuById(Student stu,@PathVariable("id")Integer id){
//        System.out.println(id);
        stu.setId(id);
        studentService.updateStu(stu);
        return Msg.success();
    }

    @RequestMapping(value = "/Stus/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteByPrimaryKey(@PathVariable("id")Integer id){
        studentService.delete(id);
        return Msg.success();
    }

    @RequestMapping(value = "/Stus",params = "select_num")
    @ResponseBody
    public Msg selectLikeNum(@RequestParam("select_num")String select_num,@RequestParam(defaultValue = "1") Integer pn){
        select_num = select_num +"%";
        PageHelper.startPage(pn,8);
        List<Student> students = studentService.LikeSelectNum(select_num);
        PageInfo pageInfo = new PageInfo(students,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/Stus",params = "select_grade")
    @ResponseBody
    public Msg selectLikeGrade(@RequestParam("select_grade")Integer select_grade,@RequestParam(defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,8);
        List<Student> students = studentService.LikeSelectGrade(select_grade);
        PageInfo pageInfo = new PageInfo(students,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/Stus",method = RequestMethod.DELETE,params = "ids")
    public Msg deleteCheckBox(@RequestParam("ids")String ids){
//        System.out.println(ids);
        List<Integer> list = new ArrayList<>();
        String[] strings = ids.split("-");
        for (String string : strings) {
            list.add(Integer.parseInt(string));
        }
        studentService.deleteCheckBox(list);
        return null;
    }

    @ResponseBody
    @RequestMapping("/stu/roomInfo")
    public Msg getRoomInfo(HttpSession session){
//        System.out.println("roomInfo");
        Student user = (Student) session.getAttribute("user");
//        System.out.println(user);
        dormitoryDormNum dorm = dormNumService.getDorm(user.getDormNum());
        return Msg.success().add("dorm",dorm);
    }
    @ResponseBody
    @RequestMapping("/stu/roommate")
    public Msg getMyMate(HttpSession session){
        Student user = (Student) session.getAttribute("user");
        List<Student> students = studentService.getStuByDormNum(user.getDormNum());
        return Msg.success().add("students",students);
    }
}
