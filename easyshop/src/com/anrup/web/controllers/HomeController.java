package com.anrup.web.controllers;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anrup.web.ldo.Item;
import com.anrup.web.service.ItemService;

@Controller
public class HomeController {

	private ItemService itemService;
	private static Logger logger = Logger.getLogger(HomeController.class);

	@Autowired
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("/")
	public String goToHomePage(Model model) {
		logger.info("showing home page...");

		List<Item> items = itemService.currentItems();

		model.addAttribute("items", items);
		return "home";
	}

	@RequestMapping("/loggedout")
	public String showUsers() {
		return "login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String goTOAdminPage() {
		return "admin";
	}

}
