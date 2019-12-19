package com.dao;

import com.entity.Room;
import com.entity.Settled;
import com.entity.Unsettled;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface UnsettledDao {
    List<Unsettled> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    void insert(Unsettled unsettled);
    Unsettled getById(int id);
    void update(Unsettled unsettled);
    void delete(int id);
}
