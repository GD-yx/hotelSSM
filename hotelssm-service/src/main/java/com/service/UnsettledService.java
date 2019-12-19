package com.service;

import com.entity.Room;
import com.entity.Unsettled;

import java.util.List;

/**
 * @author 南八
 */
public interface UnsettledService {
    List<Unsettled> getAll(int pageNum,int pageSize);
    void insert(Unsettled unsettled);
    Unsettled getById(int id);
    void update(Unsettled unsettled);
    void delete(int id);
}
