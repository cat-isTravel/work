package manager.controller;
import manager.bean.ManagerUser;
import manager.bean.Student;
import manager.bean.Teacher;
import manager.service.ManagerUserService;
import manager.service.StudentService;
import manager.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;

@Controller
@Transactional
public class LoginController {

    @Autowired
    ManagerUserService managerUserService;

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @RequestMapping("/login")
    public String login(@RequestParam("identity")String identity, ManagerUser user, Model model, HttpSession session){
        //选项为管理员
        if (identity.equals("管理员")){
            ManagerUser managerUser = managerUserService.getUserByUserNameAndPsw(user);
            if (managerUser != null){
                model.addAttribute("msg", "成功");
                session.setAttribute("user", managerUser);
                return "manager/index";
        }else {
                model.addAttribute("msg", "账号或密码错误");
                return "user/login";
        }
            //选项为学生
        }else if (identity.equals("学生")){
            Student stu = studentService.getStuByNum(user);
            if (stu != null && user.getPassword().equals("123456")){
                session.setAttribute("user", stu);
                return "user/student/index";
            }else {
//                System.out.println("stu login error");
                model.addAttribute("msg", "账号或密码错误");
                return "user/login";
            }
        }
        //选项为教职工
        else {
            Teacher teacher = teacherService.selectByNum(user.getUsername());
            if (teacher != null && user.getPassword().equals("123456")){
                session.setAttribute("user", teacher);
                return "user/teacher/index";
            }else {
                model.addAttribute("msg", "账号或密码错误");
                return "user/login";
            }
            }
        }
}
