package com.jmeher.tutorials.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/jmeher")
public class CommonController {


	@GetMapping(path = {"/"})
	public String home_screen() {
		return "/index.jsp";
	}

	@GetMapping(path = {"/index"})
	public String  openIndexScreen(){
		System.out.println("INSIDE: Request Index Page");	
		return "/index.jsp";
	}
}
