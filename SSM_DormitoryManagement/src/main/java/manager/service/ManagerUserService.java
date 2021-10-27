package manager.service;

import manager.bean.ManagerUser;
import manager.bean.ManagerUserExample;
import manager.dao.ManagerUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ManagerUserService {
    @Autowired
    ManagerUserMapper managerUserMapper;

    public ManagerUser getUserByUserNameAndPsw(ManagerUser user){
        ManagerUserExample managerUserExample = new ManagerUserExample();
        managerUserExample.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
        List<ManagerUser> managerUsers = managerUserMapper.selectByExample(managerUserExample);
        for (ManagerUser managerUser : managerUsers) {
            return managerUser;
        }
        return null;
    }
    public List<ManagerUser> getAll(){
        List<ManagerUser> managerUsers = managerUserMapper.selectByExample(null);
        return managerUsers;
    }

    public void deleteById(Integer id) {
        managerUserMapper.deleteByPrimaryKey(id);
    }

    public void addUser(ManagerUser user) {
        managerUserMapper.insertSelective(user);
    }

    public ManagerUser getUserById(Integer id) {
        ManagerUser managerUser = managerUserMapper.selectByPrimaryKey(id);
        return managerUser;
    }

    public void updateUser(ManagerUser user) {
        managerUserMapper.updateByExampleSelective(user,null);
    }

    public void deleteAll(List<Integer> list) {
        ManagerUserExample managerUserExample = new ManagerUserExample();
        managerUserExample.createCriteria().andIdIn(list);
//        System.out.println(list);
        managerUserMapper.deleteByExample(managerUserExample);
    }
}
