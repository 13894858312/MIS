package org.com.model;

import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by wangxue on 2018/6/10.
 */
public class RoomPK implements Serializable {
    @Id
    private int hid;
    @Id
    private int rid;

    public RoomPK(){

    }

    public RoomPK(int hid, int rid){
        this.hid = hid;
        this.rid = rid;
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
}
