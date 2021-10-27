package manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manager.bean.Msg;
import manager.bean.maintenanceOrder;
import manager.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @RequestMapping("/getMyRequest/{dorm_num}")
    @ResponseBody
    public Msg getMyOrder(@PathVariable("dorm_num")Integer dorm_num, @RequestParam("pn")Integer pn){
        PageHelper.startPage(pn, 8);
        List<maintenanceOrder> orders = orderService.selectOrderByDormNum(dorm_num);
        PageInfo pageInfo = new PageInfo(orders,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/ord",method = RequestMethod.POST)
    public Msg addOrder(maintenanceOrder order){
//        System.out.println("addOrder");
        order.setOrderid(Long.toString(new Date().getTime()));
        order.setState(0);
//        System.out.println(order);
        orderService.insertOrder(order);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/ord",method = RequestMethod.DELETE)
    public Msg delOrder(String orderId){
        orderService.deleteOrderById(orderId);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value = "/getRequests",method = RequestMethod.GET)
    public Msg getOrders(Integer pn){
        PageHelper.startPage(pn,8);
        List<maintenanceOrder> orders = orderService.getAll();
        PageInfo pageInfo = new PageInfo(orders,5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/ord/{orderId}",method = RequestMethod.GET)
    public Msg getOrder(@PathVariable("orderId")String orderId){
        maintenanceOrder order = orderService.selectOrderById(orderId);
        return Msg.success().add("order", order);

    }
    @ResponseBody
    @RequestMapping(value = "/ord",method = RequestMethod.PUT)
    public Msg updateState(maintenanceOrder order){
        order.setState(1);
//        System.out.println(order);
        orderService.updateState(order);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value = "/ord/{orderIds}",method = RequestMethod.PUT)
    public Msg updateByCheckBok(@PathVariable("orderIds")String orderIds){
        String[] strings = orderIds.split("-");
        List<String> list = new ArrayList<>();
        for (String string : strings) {
            list.add(string);
        }
        orderService.updateAllState(list);
        return Msg.success();
    }
}
