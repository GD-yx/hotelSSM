package com.service;

import com.entity.Employee;

import java.util.List;

/**
 * @author 南八
 */
public interface EmployeeService {
    List<Employee> getAll(int pageNum,int pageSize);
    void insert(Employee employee);
    Employee getById(int id);
    void update(Employee employee);
    void delete(int id);
}
