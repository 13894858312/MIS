import org.com.dao.AccountDao;
import org.com.dao.HotelDao;
import org.com.dao.OrderDao;
import org.com.model.Account;
import org.com.model.Orders;
import org.com.service.AccountService;
import org.com.service.HotelService;
import org.com.service.OrderService;
import org.com.service.RoomService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.HashMap;
import java.util.Set;

/**
 * Created by wangxue on 2018/6/29.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class DataTest {

    @Autowired
    OrderDao orderDao;
    @Autowired
    AccountDao accountDao;
    @Autowired
    HotelDao hotelDao;
    @Autowired
    AccountService accountService;
    @Autowired
    HotelService hotelService;
    @Autowired
    OrderService orderService;
    @Autowired
    RoomService roomService;
    @Test
    public void addOrder(){
        Orders order = new Orders(1,1,1,1,100,100,new Date(20180201),new Date(20180304),
                new Date(20180304), 1,2.0);
        boolean b = orderDao.addOrder(order);
        Assert.assertEquals(b, true);
    }

    @Test
    public void register(){
        Account account = new Account(202,"1",0);
        Assert.assertEquals(accountService.register(account), true);
    }

    @Test
    public void login() {
        Account account = new Account(0,"0",1);
        Assert.assertEquals(accountService.login(account), true);
    }

    @Test
    public void hotelTest(){
        HashMap<String,Long> stringDoubleHashMap = hotelService.getTopTurnoverHotel(10);
        Set<String> set = stringDoubleHashMap.keySet();
        for(String s:set){
            System.out.println(s+" "+stringDoubleHashMap.get(s));
        }
    }

    @Test
    public void orderTest(){
        HashMap<String, Long> stringLongHashMap = orderService.getPeriodOrderNum();
        Set<String> set = stringLongHashMap.keySet();
        for(String s:set){
            System.out.println(s+" "+stringLongHashMap.get(s));
        }
    }
    @Test
    public void test2(){
        HashMap<String, Long> stringLongHashMap = accountService.getPeriodTurnover(2018,1);
        Set<String> set = stringLongHashMap.keySet();
        for(String s:set){

            System.out.println(s+" "+stringLongHashMap.get(s));
        }
    }

    @Test
    public void test3(){
        HashMap<String, Long> stringLongHashMap = roomService.getDayReservedRoomNum(2018, 7, 5,888);
        Set<String> set = stringLongHashMap.keySet();
        for(String s:set){
            System.out.println(s+" "+stringLongHashMap.get(s));
        }
    }

    @Test
    public void test4(){
        HashMap<String, Long> stringLongHashMap = hotelService.getPeriodTurnOver(2018,888);
        HashMap<String, Long> stringLongHashMap1 = hotelService.getPeriodTurnOver(2017,888);
        Set<String> set = stringLongHashMap.keySet();
        for(String s:set){
            System.out.println(s+" "+stringLongHashMap.get(s));
        }
        Set<String> set1 = stringLongHashMap1.keySet();
        for(String s:set1){
            System.out.println(s+" "+stringLongHashMap1.get(s));
        }
    }
}
