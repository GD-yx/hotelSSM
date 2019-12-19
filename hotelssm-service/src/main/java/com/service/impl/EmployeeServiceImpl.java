package com.service.impl;

import com.dao.EmployeeDao;
import com.entity.Employee;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao dao;
    @Override
    public List<Employee> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(Employee employee) {
        dao.insert(employee);
    }

    @Override
    public Employee getById(int id) {
        return dao.getById(id);
    }

    @Override
    public void update(Employee employee) {
        dao.update(employee);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
