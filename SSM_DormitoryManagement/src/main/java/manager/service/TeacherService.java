package manager.service;

import manager.bean.Teacher;
import manager.bean.TeacherExample;
import manager.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherService {
    @Autowired
    TeacherMapper teacherMapper;

    public List<Teacher> getTeas(){
        List<Teacher> teachers = teacherMapper.selectByExample(null);
        return teachers;
    }

    public void insert(Teacher tea) {
        teacherMapper.insertSelective(tea);
    }

    public Teacher selectByNum(String num) {
        Teacher teacher = teacherMapper.selectByPrimaryKey(num);
        return teacher;
    }

    public boolean delete(String num) {
        int i = teacherMapper.deleteByPrimaryKey(num);
        System.out.println(i);//2147482646
        if (i == (-2147482646)){
            return true;
        }else {
            return false;
        }
    }

    public void update(Teacher tea) {
        teacherMapper.updateByPrimaryKeySelective(tea);
    }

    public List<Teacher> selectByDormNum(Integer dormNum) {
        TeacherExample teacherExample = new TeacherExample();
        teacherExample.createCriteria().andDormNumEqualTo(dormNum);
        List<Teacher> teachers = teacherMapper.selectByExample(teacherExample);
        return teachers;
    }
}
