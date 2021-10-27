package manager.service;

import manager.bean.faculties;
import manager.bean.facultiesExample;
import manager.dao.facultiesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class facultiesService {
    @Autowired
    facultiesMapper facultiesMapper;

    public List<faculties> getFacultiesById(Integer id){
        List<faculties> faculties = facultiesMapper.selectByCollegeId(id);
        return faculties;
    }

    public List<faculties> getFacultiesByName(String name) {
        facultiesExample facultiesExample = new facultiesExample();
        facultiesExample.createCriteria().andFacultiesNameEqualTo(name);
        List<faculties> faculties = facultiesMapper.selectByExample(facultiesExample);
        return faculties;
    }

}
