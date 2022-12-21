package com.ezentravel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezentravel.DAO.MemDAO;

// http://localhost:8090/home/list

@Controller
public class MemController {
	
	@Autowired
	private MemDAO memDAO;
	
	public MemController() {
	}
	
	public void setMemDAO(MemDAO memDAO) {
		this.memDAO = memDAO;
	}
	
	@RequestMapping(value = "/list")
	public ModelAndView process(ModelAndView mav) {
		mav.addObject("list", memDAO.list());
		mav.setViewName("list");
		return mav;
	}
}
