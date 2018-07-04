package org.com.serviceImpl;

import org.com.dao.HotelDao;
import org.com.model.Hotel;
import org.com.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
@Service
public class HotelServiceImpl implements HotelService{

    @Autowired
    private HotelDao hotelDao;

    @Override
    public boolean login(Hotel hotel){
        return hotelDao.checkHotel(hotel);
    }

    @Override
    public boolean register(Hotel hotel){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        hotel.setCreateDate(java.sql.Date.valueOf(simpleDateFormat.format(date)));
        return hotelDao.addHotel(hotel);
    }

    @Override
    public boolean modify(Hotel hotel){
        return hotelDao.modifyHotel(hotel);
    }

    @Override
    public Hotel getHotelInfo(int hid) {
        return hotelDao.getHotelInfo(hid);
    }

    @Override
    public long getTotalTurnover(int hid) {
        return hotelDao.getHotelTotalTurnover(hid);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int hid) {
        return hotelDao.getHotelPeriodTurnOver(hid);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int year, int hid) {
        return hotelDao.getHotelPeriodTurnOver(year, hid);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnOver(int year, int month, int hid) {
        return hotelDao.getHotelPeriodTurnOver(year, month, hid);
    }

    @Override
    public long getTotalOrderNum(int hid) {
        return hotelDao.getHotelOrder(hid);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int hid) {
        return hotelDao.getHotelPeriodOrder(hid);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int year, int hid) {
        return hotelDao.getHotelPeriodOrder(year, hid);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int year, int month, int hid) {
        return hotelDao.getHotelPeriodOrder(year, month, hid);
    }

    @Override
    public long getCertainTurnover(int year, int month, int day, int hid) {
        return hotelDao.getHotelTurnover(year, month, day, hid);
    }

    @Override
    public long getCertainOrder(int year, int month, int day, int hid) {
        return hotelDao.getHotelOrder(year, month, day, hid);
    }

    @Override
    public long getCertainTurnover(int year, int month, int hid) {
        return hotelDao.getHotelTurnover(year, month, hid);
    }

    @Override
    public long getCertainOrder(int year, int month, int hid) {
        return hotelDao.getHotelOrder(year, month, hid);
    }

    @Override
    public long[] getTypeOrderNum(int hid) {
        return hotelDao.getTypeOrder(hid);
    }

    @Override
    public HashMap<String, Double> getMonthlyComment(int hid) {
        return hotelDao.getComment(hid);
    }

    @Override
    public HashMap<String, Long> getTopOrderHotel(int num) {
        return hotelDao.getTopOrderHotel(num);
    }

    @Override
    public HashMap<String, Long> getTopTurnoverHotel(int num) {
        return hotelDao.getTopTurnoverHotel(num);
    }

    @Override
    public double[] getToMonthComment(int hid) {
        return hotelDao.getToMonthComment(hid);
    }

}
