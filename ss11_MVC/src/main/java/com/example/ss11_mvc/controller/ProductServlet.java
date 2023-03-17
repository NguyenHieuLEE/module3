package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.bean.Product;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "ProductServlet", urlPatterns = {"/Product", "/ProductServlet"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateProduct(request, response);
                break;
            case "update":
                showFormUpdateProduct(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "view":
                showFormView(request, response);
                break;
            case "find":
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void showFormView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int idNext = id + 1;
        Product product = productService.findById(id);
        Product productNext = productService.findById(idNext);
        request.setAttribute("product", product);
        if (product == null) {
            request.getRequestDispatcher("view/Error.jsp").forward(request,response);
        } else {
            request.setAttribute("productNext", productNext);
            request.getRequestDispatcher("view/viewProduct.jsp").forward(request,response);
        }

    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("view/Error.jsp").forward(request,response);
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("view/deleteProduct.jsp").forward(request,response);
        }

    }

    private void showFormUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("view/Error.jsp");
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("view/updateProduct.jsp").forward(request,response);
        }

    }

    private void showFormCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            request.getRequestDispatcher("view/createNewProduct.jsp").forward(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
            request.getRequestDispatcher("view/displayListProduct.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                CreateProduct(request, response);
                break;
            case "update":
                UpdateProduct(request, response);
                break;
            case "delete":
                DeleteProduct(request, response);
                break;
            case "view":
                break;
            case "find":
                findProduct(request, response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        request.setAttribute("name", name);
        List<Product> products = new ArrayList<>();
        for (Product product : productService.findAll()
        ) {
            if (product.getName().equals(name)) {
                products.add(product);
            }
        }
        if (products.isEmpty()) {
            String productsNull = "NOT FIND PRODUCT !! Exit =>  <a href=\"/Product\"> Click here </a>";
            request.setAttribute("productsNull", productsNull);
            request.getRequestDispatcher("view/displayListProduct.jsp").forward(request,response);
        } else {
            request.setAttribute("products", products);
            request.getRequestDispatcher("view/searchProduct.jsp").forward(request,response);
        }
    }

    private void DeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("view/Error.jsp").forward(request,response);
        } else {
            productService.remove(id);
            request.setAttribute("messageDelete", " Delete Successful");
            request.getRequestDispatcher("view/deleteProduct.jsp").forward(request,response);
        }
    }

    private void UpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        Product product1 = productService.findById(id);

        if (product1 == null) {
            request.getRequestDispatcher("view/Error.jsp").forward(request,response);
        } else {
            product1.setDescription(description);
            product1.setPrice(price);
            product1.setName(name);
            request.setAttribute("product", product1);
            request.setAttribute("messageUpdate", "Update to successful");
            request.getRequestDispatcher("view/updateProduct.jsp").forward(request,response);
        }
    }

    private void CreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isFlag = true;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        request.setAttribute("name", name);
        request.setAttribute("id", id);
        request.setAttribute("price", price);
        request.setAttribute("description", description);
        List<Product> productCheck = productService.findAll();
        for (Product product : productCheck) {
            if (product.getId() == id) {
                isFlag = false;
                break;
            }
        }
        if (!isFlag) {
            request.getRequestDispatcher("view/Error.jsp").forward(request,response);
        } else {
            Product product = new Product(id, name, price, description);
            productService.save(product);
            request.setAttribute("message", "Add successful");
            request.getRequestDispatcher("view/createNewProduct.jsp").forward(request,response);
        }
    }
}
