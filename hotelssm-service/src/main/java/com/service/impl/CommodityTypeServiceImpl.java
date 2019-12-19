package com.service.impl;

import com.dao.CommodityTypeDao;
import com.entity.CommodityType;
import com.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class CommodityTypeServiceImpl implements CommodityTypeService {

    @Autowired
    private CommodityTypeDao dao;

    @Override
    public List<CommodityType> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public CommodityType getById(int coid) {
        return dao.getById(coid);
    }


    @Override
    public void insert(CommodityType commodityType) {
        dao.insert(commodityType);
    }


    @Override
    public void update(CommodityType commodityType) {
        dao.update(commodityType);
    }

    @Override
    public void delete(int coid) {
        dao.delete(coid);
    }

    @Override
    public List<CommodityType> searchName(CommodityType commodityType) {
        return dao.searchName(commodityType);
    }
}
