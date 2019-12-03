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
}
