package com.anrup.web.ldo;

import org.springframework.stereotype.Component;

@Component("item")
public class Item {

	private int item_id;
	private String item_name;
	private int item_price;
	private String item_quantity;
	private double total;

	public Item() {
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getItem_quantity() {
		return item_quantity;
	}

	public void setItem_quantity(String item_quantity) {
		this.item_quantity = item_quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Item [item_id=" + item_id + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", item_quantity=" + item_quantity + ", total=" + total + "]";
	}

}
