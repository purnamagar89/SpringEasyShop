package com.anrup.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anrup.web.dao.Item;
import com.anrup.web.dao.ItemDAO;

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

}
