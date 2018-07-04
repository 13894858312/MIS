package org.com.action;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.com.service.OrderService;
import org.com.tools.Help;
import org.com.vo.StringLong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
@Controller
@Scope("prototype")
public class OrderAction extends ActionSupport{

    @Autowired
    private OrderService orderService;

    private String result;

    public String getAdminOrderYearly(){
        HashMap<String, Long> map = orderService.getPeriodOrderNum();
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminOrderMonthly(){
        HashMap<String, Long> map = orderService.getPeriodOrderNum(Calendar.getInstance().get(Calendar.YEAR));
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminOrderDaily(){
        HashMap<String, Long> map = orderService.getPeriodOrderNum(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH)+1);
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }
    public String getAdminTurnoverYearly(){
        HashMap<String, Long> map = orderService.getPeriodTurnOver();
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminTurnoverMonthly(){
        HashMap<String, Long> map = orderService.getPeriodTurnOver(Calendar.getInstance().get(Calendar.YEAR));
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminTurnoverDaily(){
        HashMap<String, Long> map = orderService.getPeriodTurnOver(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH)+1);
        ArrayList<StringLong> list = Help.sl2Array(map);
        Collections.sort(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminAreaOrder(){
        HashMap<String, Long> map = orderService.getAreaOrderNum();
        ArrayList<StringLong> list = Help.sl2Array(map);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }

    public String getAdminAreaTurnover(){
        HashMap<String, Long> map = orderService.getAreaTurnover();
        ArrayList<StringLong> list = Help.sl2Array(map);
        JSONArray jsonArray = JSONArray.fromObject(list);
        result = jsonArray.toString();
        return SUCCESS;
    }




    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
