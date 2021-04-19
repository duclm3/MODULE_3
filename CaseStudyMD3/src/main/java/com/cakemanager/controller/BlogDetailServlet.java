package com.cakemanager.controller;

import com.cakemanager.model.Account;
import com.cakemanager.model.Blog;
import com.cakemanager.model.BlogCategory;
import com.cakemanager.service.BlogService;
import com.cakemanager.service.CartService;

import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "BlogDetailServlet", value = "/blogDetail")
public class BlogDetailServlet extends HttpServlet {
    BlogService blogService = new BlogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showBlogsByCId":
                showBlogsByCId(request, response);
                break;
            case "view":
                viewBlog(request, response);
                break;
            default:
                viewBlog(request, response);
                break;
        }
    }

    private void viewBlog(HttpServletRequest request, HttpServletResponse response) {
        int blogId = Integer.parseInt(request.getParameter("id"));
        System.out.println(blogId);
        Blog blog = blogService.selectBlogById(blogId);

        int blogCateId = Integer.parseInt(request.getParameter("blogCateId"));
        List<Blog> blogList = blogService.selectBlogsByCId(blogCateId);

        BlogCategory bCate = blogService.selectBCateByBId(blogId);
        RequestDispatcher dispatcher;

        if (blog == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("blog", blog);
            request.setAttribute("blogList", blogList);
            request.setAttribute("bCate", bCate);
            dispatcher = request.getRequestDispatcher("blog-details.jsp");

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                CartService cartService = new CartService();
                int count = cartService.countCart(account.getUserId());
                request.setAttribute("count", count);
            }
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showBlogsByCId(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int blogCId = Integer.parseInt(request.getParameter("blogCId"));

        List<Blog> blogsByCId = blogService.selectBlogsByCId(blogCId);

        Map<Integer, String> blogC = new HashMap<>();
        for (int i=0; i<2; i++) {
            blogC.put(blogsByCId.get(i).getBlogCateId(), blogService.selectBCateByBId(blogsByCId.get(i).getBlogId()).getBlogName());
        }
        request.setAttribute("blogC", blogC);
        request.setAttribute("blogsByCId", blogsByCId);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CartService cartService = new CartService();
            int count = cartService.countCart(account.getUserId());
            request.setAttribute("count", count);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("blog2.jsp");
        dispatcher.forward(request, response);
    }
}
