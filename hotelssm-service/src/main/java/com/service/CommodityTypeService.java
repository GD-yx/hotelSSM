package com.service;

import com.entity.Commodity;
import com.entity.CommodityType;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityTypeService {
    List<CommodityType> getAll(int pageNum,int pageSize);
    /*CommodityType getByName(CommodityType commodityType);*/
    CommodityType getById(int coid);
    void insert(CommodityType commodityType);
    void update(CommodityType commodityType);
    void delete(int coid);
    List<CommodityType> searchName(CommodityType commodityType);
}
