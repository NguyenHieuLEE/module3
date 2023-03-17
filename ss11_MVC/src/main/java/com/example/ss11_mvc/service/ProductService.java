package com.example.ss11_mvc.service;

import com.example.ss11_mvc.bean.Product;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
 private IProductRepository productRepository = new ProductRepository();


 @Override
 public List<Product> findAll() {
  return productRepository.findAll();
 }

 @Override
 public void save(Product product) {
  productRepository.save(product);
 }

 @Override
 public Product findById(int id) {
  return productRepository.findById(id);
 }

 @Override
 public void update() {

 }

 @Override
 public void remove(int id) {
  productRepository.remove(id);
 }
}