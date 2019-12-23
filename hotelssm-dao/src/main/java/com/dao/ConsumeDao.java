package com.dao;

import com.entity.Commodity;
import com.entity.Consume;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface ConsumeDao {
    List<Consume> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    void insert(Consume consume);
    List<Consume> getByRoomId(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("roomid")int roomid);
    void delete(int id);
}
