package com.codegym.controller;

import com.codegym.model.Customer;
import com.codegym.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showCustomerCreateForm(request, response);
                break;
            }
            case "edit": {
                showEditCustomerForm(request, response);
            }
            default: {
                getAllCustomer(request, response);
                break;
            }
        }
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int index = customerService.findCustomerById(id);
        List<Customer> customers = customerService.getAllCustomers();
        request.setAttribute("customer", customers.get(index));
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showCustomerCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }

    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = customerService.getAllCustomers();
        request.setAttribute("listCustomer", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createNewCustomer(request, response);
                break;
            }
            case "edit": {
                updateCustomerInfo(request, response);
                break;
            }
        }
    }

    private void updateCustomerInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, address);
        customerService.updateCustomerInfo(customer, id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, address);
        customerService.createNewCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }
}
