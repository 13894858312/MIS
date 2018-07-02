package org.com.daoImpl;

import org.com.dao.RoomDao;
import org.com.model.Room;
import org.com.model.RoomPK;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by wangxue on 2018/6/6.
 */
@Repository
@Transactional(readOnly = false)
public class RoomDaoImpl implements RoomDao{

    private HibernateTemplate template;

    @Autowired
    public RoomDaoImpl(SessionFactory sessionFactory) {
        this.template = new HibernateTemplate(sessionFactory);
    }

    @Override
    public boolean addRoom(Room room) {
        try {
            template.save(room);
            return true;
        }catch (Exception e){
            System.out.println("房间 "+room.getRname()+" 插入错误");
        }
        return false;
    }

    @Override
    public boolean modifyRoom(Room room) {
        try {
            template.update(room);
            return true;
        }catch (Exception e){
            System.out.println("房间 "+room.getRname()+" 插入错误");
        }
        return false;
    }

    @Override
    public Room getRoomInfo(int hid, int rid) {
        RoomPK pk = new RoomPK();
        pk.setHid(hid);
        pk.setRid(rid);
        return (Room)template.get(Room.class, pk);
    }

    @Override
    public HashMap<String, Long> getHotelRoomInfo(int hid) {
        String sql = "select r.rname, r.num from Room r where r.hid=?";
        List<Object[]> queryResult = (List<Object[]>) template.find(sql, hid);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] o : queryResult){
            result.put((String)o[0],(Long)o[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getRoomTurnover(int hid) {
        String sql = "select o.hid, o.rid, r.rname, sum(o.money) from Orders o join Room r on o.hid=r.hid and r.rid=o.rid where o.state<>3 and o.hid=? group by o.hid,o.rid ";
        List<Object[]> queryResult = (List<Object[]>) template.find(sql, hid);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] o : queryResult){
            result.put((String) o[2],(Long)o[3]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getRoomOrder(int hid) {
        String sql = "select o.hid, o.rid, r.rname, count(o.oid) from Orders o join Room r on o.hid=r.hid and r.rid=o.rid where o.state<>3 and o.hid=? group by o.hid,o.rid ";
        List<Object[]> queryResult = (List<Object[]>) template.find(sql, hid);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] o : queryResult){
            result.put((String) o[2],(Long)o[3]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getReservedRoomInfo(int year, int month, int day, int hid) {
        Date date = new Date(year,month-1,day);
        String sql = "select o.hid, o.rid, r.rname, count(o.rnum) from Orders o join Room r on o.hid=r.hid and o.rid=r.rid where o.state<>3 and o.stime<=? and o.etime>=? and o.hid=? group by o.hid,r.rid";
        List<Object[]> queryResult = (List<Object[]>) template.find(sql, date, date, hid);
        HashMap<String, Long> result = new HashMap<>();
        for (Object[] o : queryResult){
            result.put((String)o[2],(Long)o[3]);
        }
        return result;
    }
}
