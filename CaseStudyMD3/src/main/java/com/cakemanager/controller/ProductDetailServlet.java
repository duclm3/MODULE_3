package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Cart;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.CartService;
import com.cakemanager.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductDetailServlet extends HttpServlet {
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
//                case "edit":
////                showEditForm(request, response);
//                    break;
//                case "delete":
//                    deleteCart(request, response);
//                    break;
            case "view":
                viewProduct(request, response);
                break;
//            case "insert":
//                try {
//                    insertCart(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//                case "update":
//                    updateCart(request, response);
//                    break;
            default:
                viewProduct(request, response);
                break;
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.selectProductById(productId);


        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        List<Product> products = this.productService.selectProductByCategoryId(categoryId);

        Category category = this.productService.selectCategoryByProductId(productId);

        RequestDispatcher dispatcher;

        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            request.setAttribute("products", products);
            request.setAttribute("category", category);

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                CartService cartService = new CartService();
                int count = cartService.countCart(account.getUserId());
                request.setAttribute("count", count);
            }

            dispatcher = request.getRequestDispatcher("shop-details.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void insertCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String productName = request.getParameter("productName");
        Float productPrice = Float.parseFloat(request.getParameter("productPrice"));
        Float priceTotal = Float.parseFloat(request.getParameter("priceTotal"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String thumbnail = request.getParameter("thumbnail");
        int userId = Integer.parseInt(request.getParameter("userId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        boolean isExist = false;
        int cartId = 0;

        CartService cartService = new CartService();
        List<Cart> carts = cartService.selectCart(userId);
        for (Cart cart: carts) {
            if (cart.getProductId() == productId) {
                quantity = quantity + cart.getQuantity();
                isExist = true;
                cartId = cart.getCartId();
                break;
            }
        }
        if (isExist) {
            Cart cart = new Cart(cartId, quantity);
            cartService.updateCart(cart);
        } else {
            Cart newCart = new Cart(productName, productPrice, quantity, priceTotal, thumbnail, userId, productId);
            productService.insertCart(newCart);
        }

        CartServlet.listCarts(request, response);
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
            case "insert":
            try {
                insertCart(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            break;
        }
    }
}
