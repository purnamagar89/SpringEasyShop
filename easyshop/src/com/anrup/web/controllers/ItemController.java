package com.anrup.web.controllers;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anrup.web.ldo.Item;
import com.anrup.web.service.ItemService;

@Controller
@MultipartConfig(maxFileSize = 16177216)
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
	
	@RequestMapping(value = "/viewImage", method = RequestMethod.POST)
	public String viewImage() {
		return "viewImage";
	}
	
	@RequestMapping("/getImage")
	public String getImage() {
		return "getImage";
	}

	@RequestMapping(value = "/itemadded")
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
