package org.com.service;

import org.com.model.Room;

import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
public interface RoomService {

    public boolean addRoom(Room room);

    public boolean modifyRoom(Room room);

    public Room getRoomInfo(int hid, int rid);

    public HashMap<String, Long> getEveryRoomNum(int hid);

    public HashMap<String, Long> getEveryRoomTurnover(int hid);

    public HashMap<String, Long> getEveryRoomOrderNum(int hid);

    public HashMap<String, Long> getDayReservedRoomNum(int year, int month, int day, int hid);

}
