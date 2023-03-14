package com.example.ss09_tong_quan_web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Product", value = "/tinh")
public class Product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a=request.getParameter("a");
        int b= Integer.parseInt(request.getParameter("b"));
        int c= Integer.parseInt(request.getParameter("c"));
        double resuft = b*c*0.01;
        double price = b-b*c*0.01;
        request.setAttribute("resuft",resuft);
        request.getRequestDispatcher("resuft.jsp").forward(request,response);
        request.setAttribute("price",price);
        request.getRequestDispatcher("price.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
