package com.dao;

import com.entity.RoomType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomTypeDao {
    List<RoomType> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    void insert(RoomType roomType);
    void delete(int id);
    RoomType getById(int id);
    void update(RoomType roomType);
}
