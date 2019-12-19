package com.service;

import com.entity.Customer;


import java.util.List;

/**
 * @author 南八
 */
public interface CustomerService {
    List<Customer> getAll(int pageNum, int pageSize);
    Customer getById(int id);
    void insert(Customer customer);
    void update(Customer customer);
    void delete(int id);
}
