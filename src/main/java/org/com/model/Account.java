package org.com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by wangxue on 2018/6/9.
 */
@Entity
public class Account {
    @Id
    private int uid;
    @Column(length = 30)
    private String pwd;
    @Column(length = 30)
    private String uname;
    @Column(length = 11)
    private String tel;
    private Date logDate;
    private int type;

    public Account(){

    }

    public Account(int uid, String pwd,int type){
        this.uid = uid;
        this.pwd = pwd;
        this.type = type;
    }

    public Account(int uid, String pwd, String uname, String tel, Date logDate, int type){
        this.uid = uid;
        this.pwd = pwd;
        this.uname = uname;
        this.tel = tel;
        this.logDate = logDate;
        this.type = type;
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

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
