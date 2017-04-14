package com.anrup.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anrup.web.ldo.ApplicationContainer;
import com.anrup.web.ldo.User;
import com.anrup.web.service.MailService;
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

		if (userService.exists(user.getUsername())) {
			System.out.println("caught duplicate username");
			result.rejectValue("username", "DuplicateKey.user.username");
			return "createaccount";
		}

		try {
			userService.createUser(user);
			String receiver = user.getUsername();// write here receiver id
			System.out.println(receiver);

			// mail service
			ApplicationContext context = ApplicationContainer.getApplicationContext();
			MailService mailService = (MailService) context.getBean("mailService");

			String sender = "easyshop21c@gmail.com";// write here sender gmail
													// // id

			mailService.sendMail(sender, receiver, "welcome", "thank you for creating account");
			System.out.println("success mail sent");

		} catch (DuplicateKeyException e) {

			result.rejectValue("username", "DuplicateKey.user.username");
			return "createaccount";
		}
		return "accountcreated";
	}

}
