package com.codegym.service;

import com.codegym.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    Customer findById(int id);

    void insert(Customer customer);

    void insertUsingProcedure(Customer customer);

    void update(Customer customer, int id);

    void remove(int id);
}
