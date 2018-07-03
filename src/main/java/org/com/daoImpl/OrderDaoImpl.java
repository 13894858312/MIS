package org.com.daoImpl;

import org.com.dao.OrderDao;
import org.com.model.Orders;
import org.com.tools.STATE;
import org.com.tools.TYPE;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * Created by wangxue on 2018/6/6.
 */
@Repository
@Transactional(readOnly = false)
public class OrderDaoImpl implements OrderDao {

    private HibernateTemplate template;
    private Data data;

    @Autowired
    public OrderDaoImpl(SessionFactory sessionFactory) {
        this.template = new HibernateTemplate(sessionFactory);
        this.data = new Data(template);
    }

    @Override
    public boolean addOrder(Orders orders) {
        try {
            template.save(orders);
            return true;
        }catch (Exception e){
            System.out.println("订单 "+orders.getOid()+" 插入错误");
        }
        return false;
    }

    @Override
    public boolean modifyOrder(Orders orders) {
        try {
            template.update(orders);
            return true;
        }catch (Exception e){
            System.out.println("订单 "+orders.getOid()+" 修改错误");
        }
        return false;
    }

    @Override
    public Orders getOrderInfo(int oid) {
        return template.get(Orders.class, oid);
    }

    @Override
    public Iterator<Orders> getHotelOrderList(int hid) {
        return data.getOrderList(TYPE.HOTEL, hid);
    }

    @Override
    public Iterator<Orders> getHotelOrderList(STATE state, int hid) {
        return data.getOrderList(TYPE.HOTEL, state, hid);
    }

    @Override
    public Iterator<Orders> getUserOrderList(int uid) {
        return data.getOrderList(TYPE.USER, uid);
    }

    @Override
    public Iterator<Orders> getUserOrderList(STATE state, int uid) {
        return data.getOrderList(TYPE.USER, state, uid);
    }

    @Override
    public long getTotalTurnover() {
        return data.getTotalTurnoverHelper(TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver() {
        return data.periodTurnoverQueryHelper(TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int year) {
        return data.periodTurnoverQueryHelper(year, TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getHotelPeriodTurnOver(int year, int month) {
        return data.periodTurnoverQueryHelper(year, month, TYPE.WEB, 0);
    }

    @Override
    public long getTotalOrder() {
        return data.getTotalOrderHelper(TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getPeriodOrder() {
        return data.periodOrderQueryHelper(TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getPeriodOrder(int year) {
        return data.periodOrderQueryHelper(year, TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getPeriodOrder(int year, int month) {
        return data.periodOrderQueryHelper(year ,month, TYPE.WEB, 0);
    }

    @Override
    public long getTurnover(int year, int month, int day) {
        return data.getTurnoverQueryHelper(year, month, day, TYPE.WEB, 0);
    }

    @Override
    public long getOrder(int year, int month, int day) {
        return data.getOrderQueryHelper(year, month, day, TYPE.WEB, 0);
    }

    @Override
    public long getTurnover(int year, int month) {
        return data.getTurnoverQueryHelper(year, month, TYPE.WEB, 0);
    }

    @Override
    public long getOrder(int year, int month) {
        return data.getOrderQueryHelper(year, month, TYPE.WEB, 0);
    }

    @Override
    public HashMap<String, Long> getAreaTurnover() {
        HashMap<String, Long> result = new HashMap<>();
        String sql = "select h.city, sum(o.money) from Hotel h join Orders o on h.hid=o.hid group by h.city";
        List<Object[]> list =(List<Object[]>) template.find(sql);
        for(Object[] objects :list){
            result.put((String) objects[0], (Long)objects[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getAreaOrder() {
        HashMap<String, Long> result = new HashMap<>();
        String sql = "select h.city, count (o.oid) from Hotel h join Orders o on h.hid=o.hid group by h.city";
        List<Object[]> list =(List<Object[]>) template.find(sql);
        for(Object[] objects :list){
            result.put((String) objects[0], (Long)objects[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getAreaTurnoverRanking(String area, int n) {
        HashMap<String, Long> result = new HashMap<>();
        String sql = "select h.hname, sum(o.money) from Hotel h join Orders o on h.hid=o.hid where h.city=? group by h.hname ";
        List<Object[]> list =(List<Object[]>) template.find(sql);
        for(Object[] objects :list){
            result.put((String) objects[0], (Long)objects[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getAreaOrderRanking(String area, int n) {
        HashMap<String, Long> result = new HashMap<>();
        String sql = "select h.hname, count(o.oid) from Hotel h join Orders o on h.hid=o.hid where h.city=? group by h.hname ";
        List<Object[]> list =(List<Object[]>) template.find(sql);
        for(Object[] objects :list){
            result.put((String) objects[0], (Long)objects[1]);
        }
        return result;
    }
}
