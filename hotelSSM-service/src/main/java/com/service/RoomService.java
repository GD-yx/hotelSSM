package com.service;

import com.entity.Room;

import java.util.List;

/**
 * @author 南八
 */
public interface RoomService {
    List<Room> getAll(int pageNum,int pageSize);
    void insert(Room room);
}
