package com.service.impl;

import com.dao.ConsumeDao;
import com.entity.Commodity;
import com.entity.Consume;
import com.service.ConsumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class ConsumeServiceImpl implements ConsumeService {

    @Autowired
    private ConsumeDao dao;

    @Override
    public List<Consume> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Consume consume) {
        dao.insert(consume);
    }

    @Override
    public List<Consume> getByRoomId(int pageNum, int pageSize, int roomid) {
        return dao.getByRoomId(pageNum, pageSize, roomid);
    }

    @Override
    public List<Consume> getByName(int pageNum, int pageSize, String name) {
        return dao.getByName(pageNum, pageSize, name);
    }

    @Override
    public Consume getById(int id) {
        return dao.getById(id);
    }


    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
