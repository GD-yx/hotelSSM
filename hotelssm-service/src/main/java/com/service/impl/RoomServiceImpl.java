package com.service.impl;

import com.entity.Room;
import com.dao.RoomDao;
import com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomDao dao;

    @Override
    public List<Room> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Room room) {
        dao.insert(room);
    }

    @Override
    public Room getById(int roomid) {
        return dao.getById(roomid);
    }

    @Override
    public void update(Room room) {
        dao.update(room);
    }

    @Override
    public void delete(int roomid) {
        dao.delete(roomid);
    }
}
