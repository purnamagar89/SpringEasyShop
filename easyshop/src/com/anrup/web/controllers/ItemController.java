package com.anrup.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItemController {

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

}
