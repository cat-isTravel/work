package manager.service;

import manager.bean.maintenanceOrder;
import manager.bean.maintenanceOrderExample;
import manager.dao.maintenanceOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    maintenanceOrderMapper maintenanceOrderMapper;

    public List<maintenanceOrder> selectOrderByDormNum(Integer dorm_num) {
        maintenanceOrderExample maintenanceOrderExample = new maintenanceOrderExample();
        maintenanceOrderExample.createCriteria().andDormNumEqualTo(dorm_num);
        List<maintenanceOrder> orders = maintenanceOrderMapper.selectByExample(maintenanceOrderExample);
        return orders;
    }

    public void insertOrder(maintenanceOrder order) {
        maintenanceOrderMapper.insert(order);
    }

    public void deleteOrderById(String orderId) {
        maintenanceOrderMapper.deleteByPrimaryKey(orderId);
    }

    public List<maintenanceOrder> getAll() {
        List<maintenanceOrder> maintenanceOrders = maintenanceOrderMapper.selectByExample(null);
        return maintenanceOrders;
    }

    public maintenanceOrder selectOrderById(String orderId) {
        maintenanceOrder maintenanceOrder = maintenanceOrderMapper.selectByPrimaryKey(orderId);
        return maintenanceOrder;
    }

    public void updateState(maintenanceOrder order) {
        maintenanceOrderMapper.updateByPrimaryKeySelective(order);
    }

    public void updateAllState(List<String> list) {
        maintenanceOrder maintenanceOrder = new maintenanceOrder();
        maintenanceOrder.setState(1);
        maintenanceOrderExample maintenanceOrderExample = new maintenanceOrderExample();
        maintenanceOrderExample.createCriteria().andOrderidIn(list);
        maintenanceOrderMapper.updateByExampleSelective(maintenanceOrder, maintenanceOrderExample);
    }
}
