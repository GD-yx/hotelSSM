package com.dao;

import com.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 南八
 */
public interface EmployeeDao {
    List<Employee> getAll(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    void insert(Employee employee);
    Employee getById(int id);
    void update(Employee employee);
    void delete(int id);
}
