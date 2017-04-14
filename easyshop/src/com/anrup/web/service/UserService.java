package com.anrup.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anrup.web.dao.UserDAO;
import com.anrup.web.ldo.User;

@Service
public class UserService {

	private UserDAO userDao;

	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public List<User> currentUser() {
		return userDao.getUsers();
	}

	public void createUser(User user) {
		userDao.createUser(user);
	}

	public boolean exists(String username) {
		return userDao.exists(username);
	}

}
