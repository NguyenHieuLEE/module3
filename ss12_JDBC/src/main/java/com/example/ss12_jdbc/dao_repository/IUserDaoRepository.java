package com.example.ss12_jdbc.dao_repository;


import com.example.ss12_jdbc.model.User;

import java.util.List;
import java.util.Map;

public interface IUserDaoRepository {
    List<User> findAll();

    public boolean add(User user);

    public User findById(int id);

    public void update(User user);

    public void remove(int id);

    public List<User> findCountry(String country);

    public List<User> SortByName();
}
