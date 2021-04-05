package com.baitap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletDiscount", value = "/ServletDiscount")
public class ServletDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float listprice = Float.parseFloat(request.getParameter("listprice"));
        float discountpercent = Float.parseFloat(request.getParameter("discountpercent"));

        float disamount = listprice * discountpercent * 0.01f;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Discount Amount: " + disamount+ "</h1>");
        writer.println("</html>");
    }
}
