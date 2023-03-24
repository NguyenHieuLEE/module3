package com.example.ss12_jdbc.dao_service;


import com.example.ss12_jdbc.dao_repository.IUserDaoRepository;
import com.example.ss12_jdbc.dao_repository.UserDaoRepository;
import com.example.ss12_jdbc.model.User;

import java.util.List;

public class UserDaoService implements IUserDaoService {
    private IUserDaoRepository userDaoRepository = new UserDaoRepository();

    @Override
    public List<User> findAll() {
        return userDaoRepository.findAll();
    }

    @Override
    public boolean add(User user) {
        return userDaoRepository.add(user);
    }

    @Override
    public User findById(int idC) {
        return userDaoRepository.findById(idC);
    }

    public void update(User user) {
        userDaoRepository.update(user);
    }

    @Override
    public void remove(int id) {
        userDaoRepository.remove(id);
    }

    public List<User> findCountry(String country) {
        return userDaoRepository.findCountry(country);
    }

    public List<User> SortByName(){
        return userDaoRepository.SortByName();
    }



}
