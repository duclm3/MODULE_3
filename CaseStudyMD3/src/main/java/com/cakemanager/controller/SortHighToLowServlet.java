package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.CartService;
import com.cakemanager.service.IndexService;
import com.cakemanager.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SortHighToLowServlet", value = "/sortH2L")
public class SortHighToLowServlet extends HttpServlet {
    ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = productService.sortProductsByPriceFromHtoL();
        List<Category> listCategory = productService.selectAllCategory();

        IndexService indexService = new IndexService();
        Map<Integer, String> category = new HashMap<>();
        for (Product product: list) {
            category.put(product.getProductId(), indexService.selectCategoryByProductId(product.getProductId()).getName());
        }
        request.setAttribute("category", category);

        request.setAttribute("listP", list);
        request.setAttribute("listC", listCategory);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
