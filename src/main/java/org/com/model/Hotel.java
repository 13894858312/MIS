package org.com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by wangxue on 2018/6/9.
 */
@Entity
public class Hotel {
    @Id
    private int hid;
    @Column(length = 30)
    private String pwd;
    private java.sql.Date createDate;
    @Column(length = 30)
    private String hname;
    @Column(length = 10)
    private String city;

    public Hotel(){

    }
    public Hotel(int hid, String pwd){
        this.hid = hid;
        this.pwd = pwd;
    }


    public Hotel(int hid, String pwd, String hname){
        this.hid = hid;
        this.pwd = pwd;
        this.hname = hname;
    }

    public Hotel(int hid, String pwd, String hname, Date date){
        this.hid = hid;
        this.pwd = pwd;
        this.hname = hname;
        this.createDate = date;
    }

    public Hotel(int hid, String pwd, Date createDate, String hname, String city){
        this.hid = hid;
        this.pwd = pwd;
        this.createDate = createDate;
        this.hname = hname;
        this.city = city;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
