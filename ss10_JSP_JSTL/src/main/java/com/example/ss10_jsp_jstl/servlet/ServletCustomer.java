package com.example.ss10_jsp_jstl.servlet;

import com.example.ss10_jsp_jstl.modal.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCustomer", value = "/ServletCustomer")
public class ServletCustomer extends HttpServlet {
    private static  ArrayList<Customer> customerArrayList = new ArrayList<>();

    static {
        customerArrayList.add( new Customer("Ngoc Hieu" , "25/06/2001" , "Quang Nam " , "https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-71.jpg"));
        customerArrayList.add( new Customer("Huu Tri" , "2/10/2001" , "Quang Nam " , "https://taimienphi.vn/tmp/cf/aut/anh-gai-xinh-1.jpg"));
        customerArrayList.add( new Customer("Thanh Sang" , "20/01/2001" , "Hue " , "https://photo-cms-kienthuc.epicdn.me/zoom/800/uploaded/thutrang/2020_11_24/2/dang-chuan-mat-dep-gai-xinh-ha-thanh-khien-dan-tinh-xao-xuyen-hinh-2.jpg"));
        customerArrayList.add( new Customer("Viet Toan" , "5/07/2001" , "Quang Nam " , "https://sohanews.sohacdn.com/160588918557773824/2020/10/2/photo-1-16016000743971092436254.jpg"));
        customerArrayList.add( new Customer("Van Thai" , "20/06/2001" , "Nghe An" , "https://image-us.24h.com.vn/upload/3-2022/images/2022-07-11/21-1657535366-24-width650height650.jpg"));

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ListCustomer" , customerArrayList);
        request.getRequestDispatcher("view/List.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
