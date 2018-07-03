package org.com.service;

import org.com.model.Hotel;

import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
public interface HotelService {

    public boolean login(Hotel hotel);

    public boolean register(Hotel hotel);

    public boolean modify(Hotel hotel);

    public Hotel getHotelInfo(int hid);

    public long getTotalTurnover(int hid);

    public HashMap<String,Long> getPeriodTurnOver(int hid);

    public HashMap<String, Long> getPeriodTurnOver(int year, int hid);

    public HashMap<String, Long> getPeriodTurnOver(int year, int month, int hid);

    public long getTotalOrderNum(int hid);

    public HashMap<String,Long> getPeriodOrderNum(int hid);

    public HashMap<String, Long> getPeriodOrderNum(int year, int hid);

    public HashMap<String, Long> getPeriodOrderNum(int year, int month, int hid);

    public long getCertainTurnover(int year, int month, int day, int hid);

    public long getCertainOrder(int year, int month, int day, int hid);

    public long getCertainTurnover(int year, int month, int hid);

    public long getCertainOrder(int year, int month, int hid);

    public long[] getTypeOrderNum(int hid);

    public HashMap<String, Double> getMonthlyComment(int hid);

    public HashMap<String, Long> getTopOrderHotel(int num);

    public HashMap<String, Long> getTopTurnoverHotel(int num);

}
