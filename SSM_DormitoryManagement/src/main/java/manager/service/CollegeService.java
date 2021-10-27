package manager.service;

import manager.bean.college;
import manager.bean.collegeExample;
import manager.dao.collegeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeService {
    @Autowired
    manager.dao.collegeMapper collegeMapper;

    public List getColleges(){
        List<college> colleges = collegeMapper.selectByExample(null);
        return colleges;
    }


    public college getCollegesByName(String name) {
        collegeExample collegeExample = new collegeExample();
        collegeExample.createCriteria().andCollegeEqualTo(name);
        List<college> colleges = collegeMapper.selectByExample(collegeExample);
        for (college college : colleges) {
            return college;
        }
        return null;
    }
}
