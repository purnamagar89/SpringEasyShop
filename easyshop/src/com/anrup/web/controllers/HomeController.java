package com.anrup.web.controllers;

import java.util.List;

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

	@Autowired
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("/")
	public String goToHomePage(Model model) {
		List<Item> allItems = itemService.currentItems();
		model.addAttribute("items", allItems);
		return "home";
	}
	
	@RequestMapping("/electronicsItems")
	public String getElectronicsItems(Model model) {
		List<Item> electronicsItems = itemService.getElectronicsItems();
		model.addAttribute("items", electronicsItems);
		return "home";
	}

	@RequestMapping("/clothItems")
	public String getClothItems(Model model) {
		List<Item> electronicsItems = itemService.getClothItems();
		model.addAttribute("items", electronicsItems);
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
