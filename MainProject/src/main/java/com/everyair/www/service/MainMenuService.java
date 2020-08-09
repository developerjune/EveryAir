package com.everyair.www.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MainMenuService {
	
	void selectContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	void listRegion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	boolean searchByRegion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	boolean searchByKeyword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	boolean searchByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
