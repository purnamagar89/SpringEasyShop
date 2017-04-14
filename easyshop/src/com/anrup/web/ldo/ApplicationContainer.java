package com.anrup.web.ldo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContainer {

	public static ApplicationContext getApplicationContext() {
		return new ClassPathXmlApplicationContext("beanConfiguration.xml");
	}

}
