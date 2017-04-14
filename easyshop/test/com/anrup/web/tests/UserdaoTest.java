package com.anrup.web.tests;

import static org.junit.Assert.assertTrue;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.anrup.web.dao.UserDAO;
import com.anrup.web.ldo.User;

@ActiveProfiles("dev")
@ContextConfiguration(locations = {
		"classpath:com/anrup/web/config/jdbcsource.xml",
		"file:WebContent/WEB-INF/applicationContext.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class UserdaoTest {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private DataSource datasource;

	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(datasource);
		jdbc.execute("delete from users");
		jdbc.execute("delete from authorities");
	}

	@Test
	public void testCreateUser() {

		User user = new User("hemraj@yahoo.con", "hemraj",true, "user");
		assertTrue("should return ture", userDao.createUser(user));
	}

}
