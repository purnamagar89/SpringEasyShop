package com.anrup.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anrup.web.dao.User;
import com.anrup.web.service.UserService;

@Controller
public class UserController {

	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/users")
	public String showUsers(Model model) {
		List<User> users = userService.currentUser();

		model.addAttribute("users", users);

		return "users";
	}
	
	
	@RequestMapping("/createaccount")
	public String createUser(Model model) {
		model.addAttribute("user", new User());

		return "createaccount";
	}

	@RequestMapping("/accountcreated")
	public String doCreate(Model model, @Valid User user, BindingResult result) {

		if (result.hasErrors()) {
			return "createaccount";
		}
		user.setEnabled(true);
		user.setAuthority("user");
		
		if(userService.exists(user.getUsername())){
			System.out.println("caught duplicate username");
			result.rejectValue("username", "DuplicateKey.user.username");
			return "createaccount";
		}

		try {
			userService.createUser(user);
		} catch (DuplicateKeyException e) {

			result.rejectValue("username", "DuplicateKey.user.username");
			return "createaccount";
		}
		return "accountcreated";
	}

}
