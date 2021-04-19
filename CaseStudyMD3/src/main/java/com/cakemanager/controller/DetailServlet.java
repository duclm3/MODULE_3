package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.CartService;
import com.cakemanager.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "DetailServlet", value = "/detail")
public class DetailServlet extends HttpServlet {
    ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        Product p = productService.getProductByCateId(productId);
        List<Category> listCategory = productService.selectAllCategory();

        request.setAttribute("detail", p);
        request.setAttribute("listC", listCategory);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        request.getRequestDispatcher("shop-details.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
