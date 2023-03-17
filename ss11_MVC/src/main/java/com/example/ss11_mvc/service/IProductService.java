package com.example.ss11_mvc.service;

import com.example.ss11_mvc.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update();

    void remove(int id);
}
