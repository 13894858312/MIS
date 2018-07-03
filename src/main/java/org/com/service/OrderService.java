package org.com.service;

import org.com.model.Orders;
import org.com.tools.STATE;

import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by wangxue on 2018/6/29.
 */
public interface OrderService {

    public boolean addOrder(Orders orders);

    public boolean modifyOrder(Orders orders);

    public Orders getOrderInfo(int oid);

    public Iterator<Orders> getHotelOrderList(int hid);

    public Iterator<Orders> getHotelOrderList(STATE state, int hid);

    public Iterator<Orders> getUserOrderList(int uid);

    public Iterator<Orders> getUserOrderList(STATE state, int uid);

    public long getTotalTurnover();

    public HashMap<String,Long> getPeriodTurnOver();

    public HashMap<String, Long> getPeriodTurnOver(int year);

    public HashMap<String, Long> getPeriodTurnOver(int year, int month);

    public long getTotalOrderNum();

    public HashMap<String,Long> getPeriodOrderNum();

    public HashMap<String, Long> getPeriodOrderNum(int year);

    public HashMap<String, Long> getPeriodOrderNum(int year, int month);

    public long getCertainTurnover(int year, int month, int day);

    public long getCertainOrderNum(int year, int month, int day);

    public long getCertainTurnover(int year, int month);

    public long getCertainOrderNum(int year, int month);

    public HashMap<String, Long> getAreaTurnover();

    public HashMap<String, Long> getAreaOrderNum();

    public HashMap<String,Long> getAreaTurnoverRanking(String area, int n);

    public HashMap<String,Long> getAreaOrderNumRanking(String area, int n);

}
