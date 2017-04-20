package com.anrup.web.dao;

import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.anrup.web.ldo.Item;

@Component("itemDAO")
public class ItemDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbcCon) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbcCon);
	}

	public boolean createItem(Item item) {

		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(item);

		return jdbc.update("insert into electronics_items (item_name ,item_price) values(:item_name,:item_price)",
				params) == 1;

	}

	public List<Item> getCurrentItems() {

		return jdbc.query(
				"select item_id,item_name,item_price from electronics_items union all select item_id, item_name,item_price from cloth_items",
				new RowMapper<Item>() {

					public Item mapRow(ResultSet rs, int rowNum) throws SQLException {

						Item i = new Item();
						i.setItem_id(rs.getInt("item_id"));
						i.setItem_name(rs.getString("item_name"));
						i.setItem_price(rs.getInt("item_price"));
						return i;
					}
				});
	}

	public Item getItem(int id) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);

		return jdbc.queryForObject("select * from electronics_items where item_id = :id", params,
				new RowMapper<Item>() {

					public Item mapRow(ResultSet rs, int rowNum) throws SQLException {

						Item i = new Item();
						i.setItem_id(rs.getInt("item_id"));
						i.setItem_name(rs.getString("item_name"));
						i.setItem_price(rs.getInt("item_price"));
						return i;

					}
				});

	}

	public List<Item> getElectronicsItems() {
		return jdbc.query("select item_id,item_name,item_price from electronics_items", new RowMapper<Item>() {

			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {

				Item i = new Item();
				i.setItem_id(rs.getInt("item_id"));

				System.out.println("item_id " + i.getItem_id());

				i.setItem_name(rs.getString("item_name"));
				i.setItem_price(rs.getInt("item_price"));
				return i;
			}
		});
	}

	public List<Item> getClothItems() {
		return jdbc.query("select item_id,item_name,item_price from cloth_items", new RowMapper<Item>() {

			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {

				Item i = new Item();
				i.setItem_id(rs.getInt("item_id"));
				i.setItem_name(rs.getString("item_name"));
				i.setItem_price(rs.getInt("item_price"));
				return i;
			}
		});

	}

	public List<Item> getSearchResult(String search_items) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		String si = "%"+search_items+"%";
		params.addValue("search_items", si);
		return jdbc.query(
				"select item_id,item_name,item_price from electronics_items where item_name like :search_items union all select item_id, item_name,item_price from cloth_items where item_name like :search_items",
				params,
				new RowMapper<Item>() {

					public Item mapRow(ResultSet rs, int rowNum) throws SQLException {

						Item i = new Item();
						i.setItem_id(rs.getInt("item_id"));
						i.setItem_name(rs.getString("item_name"));
						i.setItem_price(rs.getInt("item_price"));
						return i;
					}
				});

	}

}
