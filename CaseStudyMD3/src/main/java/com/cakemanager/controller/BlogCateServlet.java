package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Blog;
import com.cakemanager.model.BlogCategory;
import com.cakemanager.service.BlogService;
import com.cakemanager.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogCateServlet", value = "/BlogCate")
public class BlogCateServlet extends HttpServlet {
    BlogService blogService = new BlogService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> latestBlogTop4ById = blogService.selectLatestBlogTop4ById();
        List<Blog> blogList = blogService.selectAllBlogs();
        List<BlogCategory> blogC = blogService.selectAllBlogCate();

        request.setAttribute("latestBlogTop4ById", latestBlogTop4ById);
        request.setAttribute("blogList", blogList);
        request.setAttribute("blogC", blogC);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
