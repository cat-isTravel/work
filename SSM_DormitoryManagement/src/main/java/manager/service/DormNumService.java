package manager.service;

import manager.bean.dormitoryDormNum;
import manager.bean.dormitoryDormNumExample;
import manager.dao.dormitoryDormNumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormNumService {
    @Autowired
    dormitoryDormNumMapper dormitoryDormNumMapper;

    public List<dormitoryDormNum> getDormInfoByStratum(String str){
        dormitoryDormNumExample dormitoryDormNumExample = new dormitoryDormNumExample();
        dormitoryDormNumExample.setOrderByClause("dorm_num ASC");
        dormitoryDormNumExample.createCriteria().andStratumLike(str);
        List<dormitoryDormNum> dormitoryDormNums = dormitoryDormNumMapper.selectByExample(dormitoryDormNumExample);
        return dormitoryDormNums;
    }

    public boolean getDormLikeStratum(Integer dorm_num) {

        dormitoryDormNum dormitoryDormNum = dormitoryDormNumMapper.selectByPrimaryKey(dorm_num);
        if (dormitoryDormNum != null){
            return true;
        }
        else {
            return false;
        }
    }

    public boolean updatePeo(Integer dorm_num){
        dormitoryDormNum dormitoryDormNum = dormitoryDormNumMapper.selectByPrimaryKey(dorm_num);
//        System.out.println(dormitoryDormNum.getHaspeoin());
//        System.out.println(dormitoryDormNum.getMaxpeoNum());
        if (dormitoryDormNum.getHaspeoin() == dormitoryDormNum.getMaxpeoNum()){
            return false;
        }else {
            dormitoryDormNum.setHaspeoin(dormitoryDormNum.getHaspeoin()+1);
            dormitoryDormNumMapper.updateByPrimaryKey(dormitoryDormNum);
            return true;
        }

    }

    public boolean updatePeoFormDelete(Integer dormNum) {
        dormitoryDormNum dormitoryDormNum = dormitoryDormNumMapper.selectByPrimaryKey(dormNum);
        if (dormitoryDormNum.getHaspeoin() == 0){
            return false;
        }else {
            dormitoryDormNum.setHaspeoin(dormitoryDormNum.getHaspeoin() -1);
            dormitoryDormNumMapper.updateByPrimaryKey(dormitoryDormNum);
            return true;
        }
    }

    public dormitoryDormNum getDorm(Integer dorm_num){
        dormitoryDormNum dormitoryDormNum = dormitoryDormNumMapper.selectByPrimaryKey(dorm_num);
        return dormitoryDormNum;
    }
}
