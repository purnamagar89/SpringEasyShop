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
public class ItemController {
	
	private ItemService itemService;

	@Autowired
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("/additem")
	public String addItem(Model model) {
		return "additem";
	}

	@RequestMapping(value = "/viewImage", method = RequestMethod.POST)
	public String viewImage() {
		return "viewImage";
	}

	@RequestMapping("/getImage")
	public String getImage() {
		return "getImage";
	}

	@RequestMapping("/quantityprocess")
	public String quantityProcesss() {
		return "quantityprocess";
	}

	@RequestMapping("/searchResult")
	public String getSearchResult(Model model, String search_items) {
		
		List<Item> searchResult = itemService.getSearchResult(search_items);
		model.addAttribute("items", searchResult);

		return "home";
	}

}
