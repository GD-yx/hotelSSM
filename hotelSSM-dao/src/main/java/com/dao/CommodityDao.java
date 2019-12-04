package com.dao;

import com.entity.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityDao {
    List<Commodity> getAll(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    void insert(Commodity commodity);
    Commodity getById(int id);
    void update(Commodity commodity);
    void delete(int id);

}
