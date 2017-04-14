package com.anrup.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

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

		return jdbc.update(
				"insert into productdetails (item_name ,item_price) values(:item_name,:item_price)",
				params) == 1;

	}

	public List<Item> getCurrentItems() {

		return jdbc.query("select * from productdetails", new RowMapper<Item>() {

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

		return jdbc.queryForObject("select * from productdetails where item_id = :id", params, new RowMapper<Item>() {

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
