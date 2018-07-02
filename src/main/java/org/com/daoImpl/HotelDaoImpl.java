package org.com.daoImpl;

import org.com.dao.HotelDao;
import org.com.model.Hotel;
import org.com.tools.TYPE;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * Created by wangxue on 2018/6/6.
 */
@Repository
@Transactional(readOnly = false)
public class HotelDaoImpl implements HotelDao {

    private HibernateTemplate template;
    private Data data;
    @Autowired
    public HotelDaoImpl(SessionFactory sessionFactory) {
        this.template = new HibernateTemplate(sessionFactory);
        this.data = new Data(template);
    }

    @Override
    public boolean addHotel(Hotel hotel) {
        try {
            template.save(hotel);
            return true;
        }catch (Exception e){
            System.out.println("账号 "+hotel.getHid()+" 插入错误");
        }
        return false;
    }

    @Override
    public boolean modifyHotel(Hotel hotel) {
        try {
            template.update(hotel);
            return true;
        }catch (Exception e){
            System.out.println("账号 "+hotel.getHid()+" 插入错误");
        }
        return false;
    }

    @Override
    public boolean checkHotel(Hotel hotel) {

        int uid = hotel.getHid();
        Hotel a_in_db = (Hotel) template.get(Hotel.class, uid);

        if(a_in_db == null) {
            return false;
        }

        return a_in_db.getPwd().equals(hotel.getPwd());
    }

    @Override
    public Hotel getHotelInfo(int hid) {
        return (Hotel)template.get(Hotel.class, hid);
    }

    @Override
    public long getHotelTotalTurnover(int hid) {
        return data.getTotalTurnoverHelper(TYPE.HOTEL, hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodTurnOver(int hid) {
        return data.periodTurnoverQueryHelper(TYPE.HOTEL, hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodTurnOver(int year, int hid) {
        return data.periodTurnoverQueryHelper(year, TYPE.HOTEL, hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodTurnOver(int year, int month, int hid) {
        return data.periodTurnoverQueryHelper(year, month, TYPE.HOTEL, hid);
    }

    @Override
    public long getHotelOrder(int hid) {
        return data.getTotalOrderHelper(TYPE.HOTEL, hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodOrder(int hid) {
        return data.periodOrderQueryHelper(TYPE.HOTEL,hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodOrder(int year, int hid) {
        return data.periodOrderQueryHelper(year, TYPE.HOTEL, hid);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodOrder(int year, int month, int hid) {
        return data.periodOrderQueryHelper(year,month,TYPE.HOTEL,hid);
    }

    @Override
    public long getHotelTurnover(int year, int month, int day, int hid) {
        return data.getTurnoverQueryHelper(year,month,day,TYPE.HOTEL,hid);
    }

    @Override
    public long getHotelOrder(int year, int month, int day, int hid) {
        return data.getOrderQueryHelper(year, month, day, TYPE.HOTEL, hid);
    }

    @Override
    public long getHotelTurnover(int year, int month, int hid) {
        return data.getTurnoverQueryHelper(year, month, TYPE.HOTEL, hid);
    }

    @Override
    public long getHotelOrder(int year, int month, int hid) {
        return data.getOrderQueryHelper(year, month, TYPE.HOTEL, hid);
    }

    @Override
    public long[] getTypeOrder(int hid) {
        long yep = (Long) template.find("select count(o.oid) from Orders o where o.hid=? and o.state=0", hid).get(0);
        long not = (Long)template.find("select count(o.oid) from Orders o where o.hid=? and o.state=1", hid).get(0);
        long cancel = (Long)template.find("select count(o.oid) from Orders o where o.hid=? and o.state=2", hid).get(0);
        long pjed = (Long)template.find("select count(o.oid) from Orders o where o.uid=? and o.state=3", hid).get(0);
        return new long[]{not,yep,cancel,pjed};
    }

    @Override
    public HashMap<String, Double> getComment(int hid) {
        HashMap<String, Double> result = new HashMap<>();
        String sql = "select year(o.etime) as year, month(o.etime) as month, avg(o.pingjia) from Orders o where o.hid=? and o.state=3 group by year, month";
        List<Object[]> queryResult = (List<Object[]>) template.find(sql, hid);
        for(Object[] o:queryResult){
            String m = o[0]+"-"+o[1];
            result.put(m, (Double)o[2]);
        }
        return result;
    }


}
