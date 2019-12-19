package com.service.impl;

import com.dao.CommodityDao;
import com.entity.Commodity;
import com.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private CommodityDao dao;

    @Override
    public List<Commodity> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Commodity commodity) {
        dao.insert(commodity);
    }

    @Override
    public Commodity getById(int id) {
        return dao.getById(id);
    }

    @Override
    public void update(Commodity commodity) {
        dao.update(commodity);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
