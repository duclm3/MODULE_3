package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Cart;
import com.cakemanager.service.CartService;

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
@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static CartService cartService = new CartService();

    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
            switch (action) {
                case "edit":
//                showEditForm(request, response);
                    break;
                case "delete":
                    deleteCart(request, response);
                    break;
                case "view":
                    //viewProduct(request, response);
                    break;
                case "insert":
                    insertCart(request, response);
                    break;
                case "update":
                    updateCart(request, response);
                    break;
                default:
                    listCarts(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    static void listCarts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        List<Cart> carts = cartService.selectCart(userId);

        request.setAttribute("carts", carts);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
//            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("shoping-cart.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String productName = request.getParameter("productName");
        Float productPrice = Float.parseFloat(request.getParameter("productPrice"));
        Float priceTotal = Float.parseFloat(request.getParameter("priceTotal"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String thumbnail = request.getParameter("thumbnail");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1;
        boolean isExist = false;
        int cartId = 0;

        List<Cart> carts = cartService.selectCart(userId);
        for (Cart cart: carts) {
            if (cart.getProductId() == productId) {
                quantity = cart.getQuantity() + 1;
                isExist = true;
                cartId = cart.getCartId();
                break;
            }
        }
        if (isExist) {
            Cart cart = new Cart(cartId, quantity);
            cartService.updateCart(cart);
        } else {
            Cart newCart = new Cart(productName, productPrice, priceTotal, thumbnail, userId, productId);
            cartService.insertCart(newCart);
        }

        listCarts(request, response);
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int cartId = Integer.parseInt(request.getParameter("id"));
        cartService.deleteCart(cartId);

        listCarts(request, response);
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int cartId = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Cart cart = new Cart(cartId, quantity);
        cartService.updateCart(cart);

        listCarts(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
            switch (action) {
//                case "edit":
////                showEditForm(request, response);
//                    break;
//                case "delete":
//                    deleteCart(request, response);
//                    break;
//                case "view":
//                    //viewProduct(request, response);
//                    break;
//                case "insert":
//                    insertCart(request, response);
//                    break;
                case "update":
                    updateCart(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
