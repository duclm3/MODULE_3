package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.service.LoginService;
import com.cakemanager.service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private RegisterService registerService;
    private LoginService loginService;
    public void init() {
        loginService = new LoginService();
        registerService = new RegisterService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        if(this.registerService.registerAcount(userName,phone,email,address,password)){
            Account account = this.loginService.checkLogin(email,password);
            HttpSession session = request.getSession();
            session.setAttribute("account",account);
            response.sendRedirect("/index");
        }else{
            response.sendRedirect("registerAcount.jsp");
        }


    }

}
