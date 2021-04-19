package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.CartService;
import com.cakemanager.service.LoginService;
import com.cakemanager.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagerProductServlet", value = "/ManagerProductServlet")
public class ManagerProductServlet extends HttpServlet {
    private ProductService productService;
    private LoginService loginService;

    public void init() {
        loginService = new LoginService();
        productService = new ProductService();
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
                deleteProduct(request,response);
                break;
            case "edit":
                break;
            case "viewInsert":
                viewPageInsert(request,response);
                break;
            case "viewUpdate":
                viewPageUpdate(request,response);
                break;
            default:
                viewAllProduct(request, response);
                break;
        }

    }

    private void viewAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listPro = this.productService.get20Product();
        RequestDispatcher dispatcher;
        request.setAttribute("listPro", listPro);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        dispatcher = request.getRequestDispatcher("managerProduct.jsp");
        dispatcher.forward(request, response);

    }
    private void viewPageInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCategory = this.productService.getAllCategory();
        request.setAttribute("listCategory",listCategory);
        System.out.println(listCategory);
        request.setAttribute("actionInsertOrUpdate","actionInsert");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("editInsertPro.jsp");
        requestDispatcher.forward(request,response);
    }

    private void viewPageUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = this.productService.selectCategoryAndProductById(productId);
        List<Category> listCategory = this.productService.getAllCateWithoutCateIdSelected(product.getCategoryId());
        request.setAttribute("listCategory",listCategory);
        request.setAttribute("product",product);
        request.setAttribute("actionInsertOrUpdate","actionUpdate");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("editInsertPro.jsp");
        requestDispatcher.forward(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        RequestDispatcher dispatcher = null;
        if(this.productService.deleteProductSV(productId)){
            System.out.println("aaa");
            response.sendRedirect("/ManagerProductServlet");
        }else{
            dispatcher = request.getRequestDispatcher("/ManagerProductServlet?message=error");
        }
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        float unitPrice = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        int PRODUCTID_FAKE = 0;
        Category CATEGORY_FAKE = new Category(0,"");
        Product product = new Product(PRODUCTID_FAKE,name,unitPrice,quantity,description,thumbnail,categoryId,CATEGORY_FAKE);
        this.productService.insertProduct(product);
        response.sendRedirect("/ManagerProductServlet");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        float unitPrice = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        Category category = this.productService.selectCategoryByProductId(productId);
        Product product = new Product(productId,name,unitPrice,quantity,description,thumbnail,categoryId,category);
        this.productService.updateProduct(product);
        response.sendRedirect("/ManagerProductServlet");
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
            case "actionInsert":
                insertProduct(request,response);
                break;
            case "actionUpdate":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
            default:
                viewAllProduct(request, response);
                break;
        }
    }
}
