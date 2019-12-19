package com.service;

import com.entity.RoomType;

import java.util.List;

/**
 * @author 南八
 */
public interface RoomTypeService {
    List<RoomType> getAll(int pageNum,int pageSize);
    void insert(RoomType roomType);
    void delete(int rtid);
    RoomType getById(int rtid);
    void update(RoomType roomType);
}
