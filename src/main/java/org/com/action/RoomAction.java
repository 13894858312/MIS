package org.com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by wangxue on 2018/6/29.
 */
@Controller
@Scope("prototype")
public class RoomAction extends ActionSupport {

    @Autowired
    private RoomService roomService;
}
