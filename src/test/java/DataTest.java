import org.com.dao.AccountDao;
import org.com.dao.OrderDao;
import org.com.model.Account;
import org.com.model.Orders;
import org.com.service.AccountService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;

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
    AccountService accountService;
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
}
