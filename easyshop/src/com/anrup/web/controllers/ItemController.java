package com.anrup.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anrup.web.dao.Item;
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
		model.addAttribute("item", new Item());
		return "additem";
	}

	@RequestMapping("/itemadded")
	public String itemAdded(Model model, Item item) {

		itemService.createItem(item);

		return "itemadded";
	}

	@RequestMapping("/quantityprocess")
	public String quantityProcesss() {


		

		return "quantityprocess";
	}

	@RequestMapping("/itemdetails")
	public String getCurrentItem(Model model) {
		Item item = itemService.currentItem();

		model.addAttribute("item", item);

		return "itemdetails";
	}

}
