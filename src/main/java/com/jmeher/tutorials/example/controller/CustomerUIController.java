package com.jmeher.tutorials.example.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmeher.tutorials.example.model.Customer;
import com.jmeher.tutorials.example.services.CustomerService;

@Controller
@RequestMapping(path="/jmeher")
public class CustomerUIController {

	@Autowired 
	private CustomerService customerServ;
	
	

	@GetMapping(path = {"/addCustomerForm", "/editCustomerForm/{customerId}"})
	public String  openAddEditForm(HttpServletRequest request, Model model, @PathVariable("customerId") Optional<String> customerId){
		System.out.println("INSIDE: Request for Add Edit Form");

		Customer customerObj = null;
		if (customerId.isPresent()) {
			customerObj = customerServ.fetchCustomerWithId(customerId.get());
		}
		model.addAttribute("CUSTOMER_OBJ", customerObj);
		return "/add_edit_customer.jsp";
	}


	@PostMapping(path="/addCustomer") 
	public @ResponseBody String addCustomer (HttpServletRequest request, @ModelAttribute("SpringWeb")Customer objCustomer) {
		System.out.println("START: Controller Add Customer");		
		try {
			customerServ.addEditCustomerDetails(objCustomer);
		} catch (HibernateException e) {
			return "<center><div class='content-div'>Oops!, Faild to Add Customer Details!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
		}
		return "<center><div class='content-div'>Congratulation, Customer Added Successfull!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}


	@GetMapping(path="/fetchCustomersList")
	public ModelAndView getCustomersList(Model model) {
		System.out.println("INSIDE : getCustomersList");	

		List<Customer> customerList = customerServ.fetchCustomerList();

		model.addAttribute("CUSTOMER_OBJ_LIST", customerList);		
		return new ModelAndView("/customer_list.jsp");

	}

	@PostMapping(path="/editCustomer") 
	public @ResponseBody String editCustomer(HttpServletRequest request, @ModelAttribute("SpringWeb")Customer objCustomer) {
		System.out.println("START: Controller Eidt Customer");		
		try {
			customerServ.addEditCustomerDetails(objCustomer);
		} catch (HibernateException e) {
			return "<center><div class='content-div'>Oops!, Faild to Edit Customer Details!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
		}
		return "<center><div class='content-div'>Congratulation, Customer Edit Successfully!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}

	@GetMapping(path="/deleteCustomerDetails/{customerId}") 
	public @ResponseBody String deleteCustomerDetails(HttpServletRequest request, @PathVariable("customerId") String customerId) {
		System.out.println("START: Controller deleteCustomerDetails");		
		customerServ.deleteCustomerDetails(customerId);
		return "<center><div class='content-div'>Congratulation, Customer Deleted Successfull!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}

}
