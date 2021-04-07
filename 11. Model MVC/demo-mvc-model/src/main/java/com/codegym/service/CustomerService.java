package com.codegym.service;

import com.codegym.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    private static List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer(1, "Quan", "HN"));
        customers.add(new Customer(2, "Quang", "HCM"));
        customers.add(new Customer(3, "Quann", "DN"));
        customers.add(new Customer(4, "Quan1", "DN"));
        customers.add(new Customer(5, "Quan2", "HCN"));
        customers.add(new Customer(6, "Quan3", "HN"));
    }

    public List<Customer> getAllCustomers() {
        return customers;
    }

    public Customer createNewCustomer(Customer customer) {
        this.customers.add(customer);
        return customer;
    }

    public Customer updateCustomerInfo(Customer customer, int id) {
        int index = this.findCustomerById(id);
        if (index == -1) {
            return null;
        }
        this.customers.set(index, customer);
        return customer;
    }

    public int findCustomerById(int id) {
        int index = -1;
        for (int i = 0; i < customers.size(); i++) {
            if (customers.get(i).getId() == id) {
                index = i;
            }
        }
        return index;
    }

    public void deleteCustomer(int id) {
        int index = this.findCustomerById(id);
        this.customers.remove(index);
    }
}
