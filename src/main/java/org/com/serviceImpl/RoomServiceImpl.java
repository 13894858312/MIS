package org.com.serviceImpl;

import org.com.dao.RoomDao;
import org.com.model.Room;
import org.com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;

    @Override
    public boolean addRoom(Room room) {
        return false;
    }

    @Override
    public boolean modifyRoom(Room room) {
        return roomDao.modifyRoom(room);
    }

    @Override
    public Room getRoomInfo(int hid, int rid) {
        return roomDao.getRoomInfo(hid, rid);
    }

    @Override
    public HashMap<String, Long> getEveryRoomNum(int hid) {
        return roomDao.getHotelRoomInfo(hid);
    }

    @Override
    public HashMap<String, Long> getEveryRoomTurnover(int hid) {
        return roomDao.getRoomTurnover(hid);
    }

    @Override
    public HashMap<String, Long> getEveryRoomOrderNum(int hid) {
        return roomDao.getRoomOrder(hid);
    }

    @Override
    public HashMap<String, Long> getDayReservedRoomNum(int year, int month, int day, int hid) {
        return roomDao.getReservedRoomInfo(year, month, day, hid);
    }
}
