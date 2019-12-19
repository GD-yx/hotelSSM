package com.service;

import com.entity.Room;
import com.entity.Settled;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface SettledService {
    List<Settled> getAll(int pageNum,int pageSize);
    void insert(Settled settled);
    Settled getById(int id);
    void update(Settled settled);
    void delete(int id);
}
