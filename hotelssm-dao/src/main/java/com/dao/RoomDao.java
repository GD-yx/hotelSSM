package com.dao;

import com.entity.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface RoomDao {
    List<Room> getAll(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    void insert(Room room);
    Room getById(int roomid);
    void update(Room room);
    void delete(int roomid);
}
