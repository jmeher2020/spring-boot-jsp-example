package com.jmeher.tutorials.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jmeher.tutorials.example.services.CustomerService;

@RestController
@RequestMapping(path="/jmeher")
public class CustomerRestController {
	
	@Autowired 
	private CustomerService customerServ;

	@GetMapping(path="/countNoOfCustomer") 
	public @ResponseBody String countNoOfCustomer() {
		return customerServ.countNoOfCustomer();
	}
	
}