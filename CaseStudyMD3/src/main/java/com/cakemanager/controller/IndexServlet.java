package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.CartService;
import com.cakemanager.service.IndexService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "IndexServlet", value = "/index")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IndexService indexService;

    public void init() {
        indexService = new IndexService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
//                showCreateForm(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "delete":
//                showDeleteForm(request, response);
                break;
            case "view":
                //viewProduct(request, response);
                break;
            case "find":
                //findByName(request, response);
                break;
            case "showProductCategory":
                showProductCategory(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        List<Product> products = this.indexService.selectAllProducts();

        Map<Integer, String> category = new HashMap<>();
        for (int i=0; i<10; i++) {
            category.put(products.get(i).getProductId(), indexService.selectCategoryByProductId(products.get(i).getProductId()).getName());
        }

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        request.setAttribute("products", products);
        request.setAttribute("category", category);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int categoryId = Integer.parseInt(request.getParameter("id"));

        List<Product> products = this.indexService.selectProduct(categoryId);

        Map<Integer, String> category = new HashMap<>();
        for (int i=0; i<10; i++) {
            category.put(products.get(i).getProductId(), indexService.selectCategoryByProductId(products.get(i).getProductId()).getName());
        }

        request.setAttribute("category", category);
        request.setAttribute("products", products);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
