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

import com.anrup.web.ldo.User;

@Component("UserDAO")
public class UserDAO {
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbcCon) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbcCon);
	}

	public boolean createUser(User user) {

		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				user);

		jdbc.update(
				"insert into users (username ,password,enabled) values(:username,:password,:enabled)",
				params);
		return jdbc
				.update("insert into authorities (username ,authority) values(:username,:authority)",
						params) == 1;

	}

	public boolean deleteUser(int num) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("num", num);
		return jdbc.update("delete from users where usernumber = :num", params) == 1;

	}

	public boolean updateUser(User user) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				user);

		return jdbc
				.update("update users set username=:username,password=:password where usernumber=:usernumber",
						params) == 1;

	}

	public List<User> getUsers() {

		return jdbc.query("select * from users u, authorities a where u.username = a.username", new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {

				User u = new User();
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setEnabled(rs.getBoolean("enabled"));
				u.setAuthority(rs.getString("authority"));

				return u;
			}
		});
		
		
	}

	public boolean exists(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource("username",
				username);
		return jdbc.queryForObject(
				"select count(*) from users where username=:username", params,
				Integer.class) > 0;
	}

	
	  public User getUser(int id) { MapSqlParameterSource params = new
	  MapSqlParameterSource(); params.addValue("id", id);
	  
	  return jdbc.queryForObject( "select * from users where usernumber = :id",
	  params, new RowMapper<User>() {
	  
	  public User mapRow(ResultSet rs, int rowNum) throws SQLException {
	  
	  User u = new User();
	  
	  u.setUsername(rs.getString("username"));
	  u.setPassword(rs.getString("password"));
	  u.setEnabled(rs.getBoolean("enabled"));
	  
	  return u; } });
	  
	  }
	 

}
