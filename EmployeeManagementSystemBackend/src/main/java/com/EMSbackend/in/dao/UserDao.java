package com.EMSbackend.in.dao;

import org.springframework.stereotype.Service;

import com.EMSbackend.in.entities.User;


@Service
public interface UserDao {
	
	public boolean registerUser(User user);
	public User getUserByEmailAndPassword(String email, String password);

}
