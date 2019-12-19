package com.service.impl;

import com.dao.SettledDao;
import com.entity.Room;
import com.entity.Settled;
import com.service.SettledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class SettledServiceImpl implements SettledService {

    @Autowired
    private SettledDao dao;

    @Override
    public List<Settled> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Settled settled) {
        dao.insert(settled);
    }

    @Override
    public Settled getById(int id) {
        return dao.getById(id);
    }

    @Override
    public void update(Settled settled) {
        dao.update(settled);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
