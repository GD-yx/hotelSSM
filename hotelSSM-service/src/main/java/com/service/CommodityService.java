package com.service;

import com.entity.Commodity;

import java.util.List;

/**
 * @author 南八
 */
public interface CommodityService {
    List<Commodity> getAll(int pageNum,int pageSize);
    void insert(Commodity commodity);
    Commodity getById(int id);
    void update(Commodity commodity);
    void delete(int id);
}
