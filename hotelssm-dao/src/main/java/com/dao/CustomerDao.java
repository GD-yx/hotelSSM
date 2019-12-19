package com.dao;

import com.entity.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface CustomerDao {
    List<Customer> getAll(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    Customer getById(int id);
    void insert(Customer customer);
    void update(Customer customer);
    void delete(int id);
}
