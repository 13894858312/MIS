package org.com.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by wangxue on 2018/6/10.
 */
@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "oid")
    private int oid;
    private int uid;
    private int hid;
    private int rid;
    private int rnum;
    private int price;
    private int money;
    private Date ctime;
    private Date stime;
    private Date etime;
    //0，1，2, 3 已完成 未完成 已取消 订单数 已评价
    private Integer state;
    private Double pingjia;

    public Orders(){

    }

    public Orders(int uid, int hid, int rid, int rnum, int price, int money, Date ctime,
                  Date stime, Date etime, Integer state, Double pingjia){
        this.uid = uid;
        this.hid = hid;
        this.rid = rid;
        this.rnum = rnum;
        this.price = price;
        this.money = money;
        this.ctime = ctime;
        this.stime = stime;
        this.etime = etime;
        this.state = state;
        this.pingjia = pingjia;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    public Date getEtime() {
        return etime;
    }

    public void setEtime(Date etime) {
        this.etime = etime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getPingjia() {
        return pingjia;
    }

    public void setPingjia(Double pingjia) {
        this.pingjia = pingjia;
    }
}
