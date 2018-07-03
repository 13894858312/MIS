package org.com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.com.tools.Help;
import org.com.model.Account;
import org.com.model.Orders;
import org.com.service.AccountService;
import org.com.service.OrderService;
import org.com.vo.StringLong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by wangxue on 2018/6/29.
 */
@Controller
@Scope("prototype")
public class AccountAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    @Autowired
    private AccountService accountService;
    @Autowired
    private OrderService orderService;

    private String result;

    private int uid;
    private String pwd;
    private int type;

    private Iterator<Orders> ordersIterator;

    public String login(){

        Account account = new Account(uid,pwd,type);
        if (accountService.login(account)) {
            makeSession();
            return SUCCESS;
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("tipMessage", "登陆失败！");
            return "fail";
        }
    }

    public String logout() {
        ActionContext actionContext = ActionContext.getContext();
        actionContext.getSession().clear();
        return SUCCESS;
    }

    public String register(){
        Account account = new Account(uid, pwd, type);
        if(accountService.register(account)){
            makeSession();
            return SUCCESS;
        }else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("tipMessage", "注册失败！");
            return "fail";
        }
    }

    public String getAdminUserTips(){
        long total = accountService.getTotalUserNum();
        long turnover = orderService.getTotalTurnover();
        Calendar c = Calendar.getInstance();
        long register = accountService.getRegisterUserNum(c.get(Calendar.YEAR), c.get(Calendar.MONTH)+1);
        long active = accountService.getActiveUserNum(c.get(Calendar.YEAR), c.get(Calendar.MONTH)+1);
        double percent = 100*register/total;
        double avg = turnover/total;

        List<String> list= new ArrayList<>();
        list.add(String.valueOf(total));
        list.add(String.format("%.2f", avg));
        list.add(String.valueOf(register));
        list.add(String.format("%.2f", percent));
        list.add(String.valueOf(active));

        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminUserRegisterGraph(){
        ArrayList<StringLong> list = Help.sl2Array(accountService.getMonthlyUserNum());
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminUserActiveGraph(){
        ArrayList<StringLong> list = Help.sl2Array(accountService.getMonthlyActiveNum());
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }







    private void makeSession(){
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("uid", this.uid);
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Iterator<Orders> getOrdersIterator() {
        return ordersIterator;
    }

    public void setOrdersIterator(Iterator<Orders> ordersIterator) {
        this.ordersIterator = ordersIterator;
    }
}
