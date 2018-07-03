package org.com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.com.model.Hotel;
import org.com.model.Orders;
import org.com.service.HotelService;
import org.com.service.OrderService;
import org.com.tools.Help;
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
public class HotelAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private OrderService orderService;

    private String result;

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

    public String getTopOrderHotel(){
        HashMap<String,Long> map = hotelService.getTopOrderHotel(10);
        ArrayList<StringLong> list = Help.sl2Array(map);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getTopTurnoverHotel(){
        HashMap<String, Long> map = hotelService.getTopTurnoverHotel(10);
        ArrayList<StringLong> list = Help.sl2Array(map);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getTurnoverPercent(){
        long sum = 0;
        long total_turnover = orderService.getTotalTurnover();
        ArrayList<StringLong> list = new ArrayList<>();
        HashMap<String, Long> map = hotelService.getTopTurnoverHotel(10);
        Set<String> set = map.keySet();
        for(String s:set){
            long l = map.get(s);
            sum+=l;
            list.add(new StringLong(s, l));
        }
        list.add(new StringLong("其他", total_turnover-sum));

        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }




    private void makeSession(){
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("hid", this.hid);
        ordersIterator=orderService.getUserOrderList(hid);
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
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
