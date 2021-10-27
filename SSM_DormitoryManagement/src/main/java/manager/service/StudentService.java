package manager.service;

import manager.bean.*;
import manager.dao.StudentMapper;
import manager.dao.dormitoryDormNumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import java.util.List;

@Service
public class StudentService {

    @Autowired(required = false)
    StudentMapper studentMapper;


    public List<Student> getAllStudent(){
        System.out.println(studentMapper);
        List<Student> students = studentMapper.selectByExample(null);
        return students;
    }
    public boolean getStuByNum(String num){
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andNumEqualTo(num);
        List<Student> students = studentMapper.selectByExample(studentExample);
        if (students.isEmpty()){
//            System.out.println("空的");
            return true;

        }else {
//            System.out.println("非空");
            return false;
        }
        
    }


    public void insertStu(Student stu) {
        studentMapper.insert(stu);


    }

    public Student getStuById(Integer id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    public void updateStu(Student stu) {
        studentMapper.updateByPrimaryKeySelective(stu);
    }

    public void delete(Integer id) {
        studentMapper.deleteByPrimaryKey(id);
    }


    public List<Student> LikeSelectNum(String select_num) {
        StudentExample studentExample = new StudentExample();
        studentExample.createCriteria().andNumLike(select_num);
        List<Student> students = studentMapper.selectByExample(studentExample);
        return students;
    }

    public List<Student> LikeSelectGrade(Integer select_grade) {
        StudentExample studentExample = new StudentExample();
        studentExample.createCriteria().andGradeEqualTo(select_grade);
        List<Student> students = studentMapper.selectByExample(studentExample);
        return students;
    }

    public void deleteCheckBox(List<Integer> list) {
        StudentExample studentExample = new StudentExample();
        studentExample.createCriteria().andIdIn(list);
        studentMapper.deleteByExample(studentExample);
    }

    public Student getStuByNum(ManagerUser user){
        StudentExample studentExample = new StudentExample();
        studentExample.createCriteria().andNumEqualTo(user.getUsername());
        List<Student> students = studentMapper.selectByExample(studentExample);
        for (Student student : students) {
            return student;
        }
        return null;
    }

    public List<Student> getStuByDormNum(Integer dormNum) {
        StudentExample studentExample = new StudentExample();
        studentExample.createCriteria().andDormNumEqualTo(dormNum);
        List<Student> students = studentMapper.selectByExample(studentExample);
        return students;
    }
}
