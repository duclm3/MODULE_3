package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Contact;
import com.cakemanager.service.CartService;
import com.cakemanager.service.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ContactServlet", value = "/ContactServlet")
public class ContactServlet extends HttpServlet {
    private ContactService contactService;
    public void init() {
        contactService = new ContactService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "sendContact":
                sendContact(request, response);
                break;
            case "sendEmail":
                sendEmail(request, response);
                break;
        }
    }

    private void sendEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");

        Contact contact = new Contact(email);
        contactService.sendEmail(contact);

        response.sendRedirect("index");
    }

    private void sendContact(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, message);
        contactService.sendContact(contact);

        response.sendRedirect("index");
    }
}
