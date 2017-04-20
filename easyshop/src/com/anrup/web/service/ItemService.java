package com.anrup.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anrup.web.dao.ItemDAO;
import com.anrup.web.ldo.Item;

@Service
public class ItemService {

	private ItemDAO itemDao;
	private Item item;
	
	
	@Autowired
	public void setItem(Item item) {
		this.item = item;
	}

	@Autowired
	public void setItemDao(ItemDAO itemDao) {
		this.itemDao = itemDao;
	}

	public void createItem(Item item) {
		itemDao.createItem(item);
	}

	public List<Item> currentItems() {
		return itemDao.getCurrentItems();
	}

	public Item currentItem() {
		return itemDao.getItem(item.getItem_id());
	}

	public List<Item> getElectronicsItems() {
		return itemDao.getElectronicsItems();
	}

	public List<Item> getClothItems() {
		return itemDao.getClothItems();
	}

	public List<Item> getSearchResult(String search_items) {
		return itemDao.getSearchResult(search_items);
	}

}
