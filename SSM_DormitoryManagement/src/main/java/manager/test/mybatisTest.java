package manager.test;

import manager.bean.*;
import manager.dao.StudentMapper;
import manager.dao.collegeMapper;
import manager.dao.dormitoryDormNumMapper;
import manager.dao.facultiesMapper;
import manager.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

public class mybatisTest {
    @Test
    public void dbTest(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
        dormitoryDormNumMapper dormitoryDormNumMapper = applicationContext.getBean(dormitoryDormNumMapper.class);
//        List<faculties> faculties = facultiesMapper.selectByCollegeId(1);
        Student student = new Student(null,"1911841471441","111","男",2019,"计算机应用技术","信息学院","15602275064",1101);
       dormitoryDormNumExample dormitoryDormNumExample = new dormitoryDormNumExample();
//       dormitoryDormNumExample.createCriteria().andStratumLike("A%");
//        dormitoryDormNum dormitoryDormNum = dormitoryDormNumMapper.selectPrimaryKeyByExample(1101, dormitoryDormNumExample);
//        System.out.println(dormitoryDormNum);
//        int insert = studentMapper.insert(student);
//        System.out.println(insert);
//        for (Student student : students) {
//            System.out.println(student);
//        }


//        for (int i = 0; i < 200; i++) {
//            String uuid = UUID.randomUUID().toString().substring(0, 4);
//            Student student = new Student(null,"191118102702",uuid+i,"男",2019,"计算机应用技术","信息学院","13169251613","A栋:0110");
//            mapper.insert(student);
//        }
//        faculties faculties = new faculties("酒店管理与数字化运营","餐饮旅游学院");
//        mapper.insert(faculties);

    }
}
