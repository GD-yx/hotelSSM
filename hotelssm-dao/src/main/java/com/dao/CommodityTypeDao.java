package com.dao;

import com.entity.Commodity;
import com.entity.CommodityType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityTypeDao {
    List<CommodityType> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
   /* CommodityType getByName(CommodityType commodityType);*/
   CommodityType getById(int coid);
    void insert(CommodityType commodityType);
    void update(CommodityType commodityType);
    void delete(int coid);
    List<CommodityType> searchName(CommodityType commodityType);
}
