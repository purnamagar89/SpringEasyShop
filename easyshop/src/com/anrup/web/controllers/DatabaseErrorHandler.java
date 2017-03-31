package com.anrup.web.controllers;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class DatabaseErrorHandler {
	@ExceptionHandler
	public String handleDatabaseException(DataAccessException ex) {
		ex.printStackTrace();
		return "error";
	}

}
