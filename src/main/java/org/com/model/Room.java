package org.com.model;

import javax.persistence.*;

/**
 * Created by wangxue on 2018/6/10.
 */
@Entity
@IdClass(RoomPK.class)
public class Room {
    @Id
    private int hid;
    @Id
    private int rid;
    private int num;
    private int price;
    @Column(length = 30)
    private String rname;

    public Room(){

    }

    public Room(int hid, int rid, int num, int price, String rname){
        this.hid = hid;
        this.rid = rid;
        this.num = num;
        this.price = price;
        this.rname = rname;
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

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }
}
