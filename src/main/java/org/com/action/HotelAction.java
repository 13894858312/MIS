package org.com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.com.model.Hotel;
import org.com.model.Orders;
import org.com.service.HotelService;
import org.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by wangxue on 2018/6/29.
 */
@Controller
@Scope("prototype")
public class HotelAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private OrderService orderService;

    private int hid;
    private String pwd;
    private String hname;

    private Iterator<Orders> ordersIterator;

    public String login(){
        Hotel hotel = new Hotel(hid,pwd);
        if (hotelService.login(hotel)) {
            makeSession();
            return SUCCESS;
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("tipMessage", "登陆失败！");
            return "fail";
        }
    }

    public String register(){
        Hotel hotel = new Hotel(hid, pwd, hname);
        if(hotelService.register(hotel)){
            makeSession();
            return SUCCESS;
        }else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("tipMessage", "注册失败！");
            return "fail";
        }
    }

    public String logout() {
        ActionContext actionContext = ActionContext.getContext();
        actionContext.getSession().clear();
        return SUCCESS;
    }




    private void makeSession(){
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("hid", this.hid);
        ordersIterator=orderService.getUserOrderList(hid);
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public Iterator<Orders> getOrdersIterator() {
        return ordersIterator;
    }

    public void setOrdersIterator(Iterator<Orders> ordersIterator) {
        this.ordersIterator = ordersIterator;
    }

}
