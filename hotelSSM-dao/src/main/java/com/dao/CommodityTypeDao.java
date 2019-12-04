package com.dao;

import com.entity.CommodityType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityTypeDao {
    List<CommodityType> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    void insert(CommodityType commodityType);
    CommodityType getById(int id);
    void update(CommodityType commodityType);
    void delete(int id);
}
