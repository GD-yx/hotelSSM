package com.service;

import com.entity.RoomType;

import java.util.List;

/**
 * @author 南八
 */
public interface RoomTypeService {
    List<RoomType> getAll(int pageNum,int pageSize);
    void insert(RoomType roomType);
    void delete(int id);
    RoomType getById(int id);
    void update(RoomType roomType);
}
