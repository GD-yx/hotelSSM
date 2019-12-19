package com.service.impl;

import com.dao.CustomerDao;
import com.entity.Customer;
import com.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao dao;
    @Override
    public List<Customer> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public Customer getById(int id) {
        return dao.getById(id);
    }

    @Override
    public void insert(Customer customer) {
        dao.insert(customer);
    }

    @Override
    public void update(Customer customer) {
        dao.update(customer);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }
}
