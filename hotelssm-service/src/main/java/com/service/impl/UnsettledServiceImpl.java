package com.service.impl;

import com.dao.UnsettledDao;
import com.entity.Room;
import com.entity.Unsettled;
import com.service.UnsettledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class UnsettledServiceImpl implements UnsettledService {
    @Autowired
    private UnsettledDao dao;


    @Override
    public List<Unsettled> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Unsettled unsettled) {
        dao.insert(unsettled);
    }

    @Override
    public Unsettled getById(int id) {
        return dao.getById(id);
    }

    @Override
    public Unsettled getByRoomid(int roomid) {
        return dao.getByRoomid(roomid);
    }


    @Override
    public void update(Unsettled unsettled) {
        dao.update(unsettled);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
