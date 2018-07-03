package org.com.serviceImpl;

import org.com.dao.OrderDao;
import org.com.model.Orders;
import org.com.service.OrderService;
import org.com.tools.STATE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by wangxue on 2018/6/29.
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao;

    @Override
    public boolean addOrder(Orders orders) {
        return orderDao.addOrder(orders);
    }

    @Override
    public boolean modifyOrder(Orders orders) {
        return orderDao.modifyOrder(orders);
    }

    @Override
    public Orders getOrderInfo(int oid) {
        return orderDao.getOrderInfo(oid);
    }

    @Override
    public Iterator<Orders> getHotelOrderList(int hid) {
        return orderDao.getHotelOrderList(hid);
    }

    @Override
    public Iterator<Orders> getHotelOrderList(STATE state, int hid) {
        return orderDao.getHotelOrderList(state, hid);
    }

    @Override
    public Iterator<Orders> getUserOrderList(int uid) {
        return orderDao.getUserOrderList(uid);
    }

    @Override
    public Iterator<Orders> getUserOrderList(STATE state, int uid) {
        return orderDao.getUserOrderList(state, uid);
    }

    @Override
    public long getTotalTurnover() {
        return orderDao.getTotalTurnover();
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver() {
        return orderDao.getPeriodTurnOver();
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int year) {
        return orderDao.getPeriodTurnOver(year);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int year, int month) {
        return orderDao.getHotelPeriodTurnOver(year, month);
    }

    @Override
    public long getTotalOrderNum() {
        return orderDao.getTotalOrder();
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum() {
        return orderDao.getPeriodOrder();
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int year) {
        return orderDao.getPeriodOrder(year);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int year, int month) {
        return orderDao.getPeriodOrder(year, month);
    }

    @Override
    public long getCertainTurnover(int year, int month, int day) {
        return orderDao.getTurnover(year, month, day);
    }

    @Override
    public long getCertainOrderNum(int year, int month, int day) {
        return orderDao.getOrder(year, month, day);
    }

    @Override
    public long getCertainTurnover(int year, int month) {
        return orderDao.getTurnover(year, month);
    }

    @Override
    public long getCertainOrderNum(int year, int month) {
        return orderDao.getOrder(year, month);
    }

    @Override
    public HashMap<String, Long> getAreaTurnover() {
        return orderDao.getAreaTurnover();
    }

    @Override
    public HashMap<String, Long> getAreaOrderNum() {
        return orderDao.getAreaOrder();
    }

    @Override
    public HashMap<String, Long> getAreaTurnoverRanking(String area, int n) {
        return orderDao.getAreaTurnoverRanking(area, n);
    }

    @Override
    public HashMap<String, Long> getAreaOrderNumRanking(String area, int n) {
        return orderDao.getAreaOrderRanking(area, n);
    }

}
