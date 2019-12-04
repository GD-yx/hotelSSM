package com.service;

import com.entity.Commodity;
import com.entity.CommodityType;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityTypeService {
    List<CommodityType> getAll(int pageNum,int pageSize);
    void insert(CommodityType commodityType);
    CommodityType getById(int id);
    void update(CommodityType commodityType);
    void delete(int id);
}
