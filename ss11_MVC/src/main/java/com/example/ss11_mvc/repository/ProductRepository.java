package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.bean.Product;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productsList;

    static {
        productsList = new HashMap<>();
        productsList.put(1, new Product(1, "Máy Giặt", 10000000, "color : Đen"));
        productsList.put(2, new Product(2, "Tủ Lạnh", 10000000, "color : Đỏ"));
        productsList.put(3, new Product(3, "TiVi Sam Sung", 10000000, "color : Trắng"));
        productsList.put(4, new Product(4, "Máy Sấy", 10000000, "color : Nâu"));
        productsList.put(5, new Product(5, "Điện Thoại Iphone", 10000000, "color : Đen"));
        productsList.put(6, new Product(6, "Bếp Ga", 10000000, "color : Xanh"));
        productsList.put(7, new Product(7, "Máy Lọc Nước", 10000000, "color : Vàng"));
        productsList.put(8, new Product(8, "Lapptop", 10000000, "color : Bạc"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productsList.values());
    }

    @Override
    public void save(Product product) {
        productsList.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productsList.get(id);
        // tương đương với lấy value là Product
        // vì khi get Id là đang thực hiện get key => value
        // do key == id
    }

    @Override
    public void update() {

    }

    @Override
    public void remove(int id) {
        productsList.remove(id);
    }
}