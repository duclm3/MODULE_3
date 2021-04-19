package com.cakemanager.controller;

import com.cakemanager.model.*;
import com.cakemanager.service.AccountService;
import com.cakemanager.service.CartService;
import com.cakemanager.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ManagerOrderServlet", value = "/ManagerOrderServlet")
public class ManagerOrderServlet extends HttpServlet {
    private OrderService orderService;
    private AccountService accountService;
    public void init() {
        orderService = new OrderService();
        accountService = new AccountService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Account account = null;
        try {
            account = (Account)session.getAttribute("account");
        }catch (Exception e){
            account = null;
        }
//        RequestDispatcher requestDispatcher =  null;
//        if(account== null){
//            response.sendRedirect("/index");
//            return;
//        }else{
//            if(!account.isRoll()){
//                response.sendRedirect("/index");
//                return;
//            }
//        }
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "delete":
                break;
            case "editStatusOrder":
                updateOrderStatus(request,response);
                break;
            case "viewUser":
                findAccountById(request,response);
                break;
            case "viewOrderDetail":
                findAllOrderDetailWithUserId(request,response);
                break;
            default:
                viewAllOrder(request,response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

    }
    private void viewAllOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Orders> listOrder = this.orderService.getAllOrder();
        RequestDispatcher dispatcher;
        request.setAttribute("listOrder", listOrder);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        dispatcher = request.getRequestDispatcher("managerOrder.jsp");
        dispatcher.forward(request, response);
    }
    private void findAllOrderDetailWithUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        int userId = Integer.parseInt(request.getParameter("userId"));
        System.out.println("userId:"+userId);
        List<OrderDetails> orderDetailsList = this.orderService.getListOrderDetailWithUserId(userId);
        Gson gson = new Gson();
        String jsonString = gson.toJson(orderDetailsList);
        System.out.println(jsonString);
        PrintWriter writer = response.getWriter();
        writer.println(jsonString);
        writer.flush();
        writer.close();

    }
    private void findAccountById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        int userId = Integer.parseInt(request.getParameter("userId"));
        Account account = this.accountService.findAccountById(userId);
        Gson gson = new Gson();
        PrintWriter writer = response.getWriter();
        writer.println(gson.toJson(account));
        writer.flush();
        writer.close();
    }
    private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        boolean checkUpdate = this.orderService.updateStatusOrder(orderId);
        if(checkUpdate){
            request.setAttribute("statusOrder","delivered");
        }else {
            request.setAttribute("statusOrder","notDelivered");
        }
        response.sendRedirect("/ManagerOrderServlet");
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ManagerOrderServlet");
//        requestDispatcher.forward(request,response);
    }

}
