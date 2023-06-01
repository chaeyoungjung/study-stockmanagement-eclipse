package com.overc1ock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/stockmanagement/*")
public class StockManagementController {
	
	@GetMapping("/outbound")
	public void outbound() {
		
	}
	
	@GetMapping("/report")
	public void report() {
		
	}
	

}
