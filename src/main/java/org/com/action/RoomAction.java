package org.com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.com.service.RoomService;
import org.com.tools.Help;
import org.com.vo.StringLong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
@Controller
@Scope("prototype")
public class RoomAction extends ActionSupport {

    @Autowired
    private RoomService roomService;

    private String result;

    public String getRoom(){
        HashMap<String , Long> map = roomService.getEveryRoomNum(getHotel());
        ArrayList<StringLong> list = Help.sl2Array(map);
        result = JSONArray.fromObject(list).toString();
        return SUCCESS;
    }

    public String getRoomOrder(){
        HashMap<String, Long> map = roomService.getEveryRoomOrderNum(getHotel());
        ArrayList<StringLong> list = Help.sl2Array(map);
        result = JSONArray.fromObject(list).toString();
        return SUCCESS;
    }

    public String getRoomTurnover(){
        HashMap<String, Long> map = roomService.getEveryRoomTurnover(getHotel());
        ArrayList<StringLong> list = Help.sl2Array(map);
        result = JSONArray.fromObject(list).toString();
        return  SUCCESS;
    }

    public String getReservedRoom(){
        Calendar now = Calendar.getInstance();
        HashMap<String, Long> map = roomService.getDayReservedRoomNum(now.get(Calendar.YEAR),
                now.get(Calendar.MONTH)+1, 5, getHotel());
        ArrayList<StringLong> list = Help.sl2Array(map);
        result = JSONArray.fromObject(list).toString();
        return SUCCESS;
    }


    private int getHotel(){
        ActionContext actionContext = ActionContext.getContext();
        return (Integer) actionContext.getSession().get("hid");
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
