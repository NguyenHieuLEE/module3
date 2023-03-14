package com.example.ss10_calculator;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCalculator", urlPatterns = "/ServletCalculator")
public class ServletCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double FirstOperand = Double.parseDouble(request.getParameter("FirstOperand"));
        double Operand = Double.parseDouble(request.getParameter("Operand"));
        String operator = request.getParameter("operator");
        request.setAttribute("operator", operator);
        request.setAttribute("FirstOperand", FirstOperand);
        request.setAttribute("Operand", Operand);
        double T = FirstOperand + Operand;
        double H = FirstOperand - Operand;
        double N = FirstOperand * Operand;
        double C = FirstOperand / Operand;
        switch (operator) {
            case "cong":
                request.setAttribute("KetQua", T);
                request.setAttribute("PhepTinh", " + ");
                request.getRequestDispatcher("view/Result.jsp").forward(request, response);
                break;
            case "tru":
                request.setAttribute("KetQua", H);
                request.setAttribute("PhepTinh", " - ");
                request.getRequestDispatcher("view/Result.jsp").forward(request, response);
                break;
            case "nhan":
                request.setAttribute("KetQua", N);
                request.setAttribute("PhepTinh", " * ");
                request.getRequestDispatcher("view/Result.jsp").forward(request, response);
                break;
            case "chia":
                request.setAttribute("KetQua", C);
                request.setAttribute("PhepTinh", " / ");
                request.getRequestDispatcher("view/Result.jsp").forward(request, response);
                break;
        }

    }
}
