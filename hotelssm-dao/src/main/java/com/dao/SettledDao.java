package com.dao;

import com.entity.Room;
import com.entity.Settled;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface SettledDao {
    List<Settled> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    void insert(Settled settled);
    Settled getById(int id);
    void update(Settled settled);
    void delete(int id);
}
