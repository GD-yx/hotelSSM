package com.service.impl;

import com.dao.RoomTypeDao;
import com.entity.RoomType;
import com.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class RoomTypeServiceImpl implements RoomTypeService {

    @Autowired
    private RoomTypeDao dao;

    @Override
    public List<RoomType> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(RoomType roomType) {
        dao.insert(roomType);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
