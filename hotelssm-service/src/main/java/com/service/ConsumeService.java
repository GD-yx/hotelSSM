package com.service;

import com.entity.Commodity;
import com.entity.Consume;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface ConsumeService {
    List<Consume> getAll( int pageNum,int pageSize);
    void insert(Consume consume);
    List<Consume> getByRoomId(int pageNum, int pageSize, int roomid);
    List<Consume> getByName(int pageNum, int pageSize, String name);
    Consume getById(int id);
    void delete(int id);
}
