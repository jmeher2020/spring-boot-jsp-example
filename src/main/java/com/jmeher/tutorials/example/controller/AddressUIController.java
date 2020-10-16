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

import com.jmeher.tutorials.example.model.Address;
import com.jmeher.tutorials.example.services.AddressService;

@Controller
@RequestMapping(path="/jmeher")
public class AddressUIController {

	@Autowired 
	private AddressService addressServ;


	@GetMapping(path = {"/addAddressForm/{customerId}", "/editAddressForm/{addressId}"})
	public String  openAddEditForm(Model model,@PathVariable("customerId") Optional<String> customerId,
			@PathVariable("addressId") Optional<String> addressId){
		System.out.println("INSIDE: Request for Add Edit Form");

		Address addressObj = null;

		if(addressId.isPresent()) {
			addressObj = addressServ.fetchAddressWithId(addressId.get());
			model.addAttribute("CUSTOMER_ID", addressObj.getCustomerId());
		}else if(customerId.isPresent()) {
			model.addAttribute("CUSTOMER_ID", customerId.get());
		}


		model.addAttribute("ADDRESS_OBJ", addressObj);
		return "/add_edit_address.jsp";
	}


	@PostMapping(path="/addAddress") 
	public @ResponseBody String addAddress (HttpServletRequest request, @ModelAttribute("SpringWeb")Address objAddress) {
		System.out.println("START: Controller Add Address");		
		try {
			addressServ.addEditAddressDetails(objAddress);
		} catch (HibernateException e) {
			return "<center><div class='content-div'>Oops!, Faild to Add Address Details!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
		}
		return "<center><div class='content-div'>Congratulation, Address Added Successfull!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}


	@GetMapping(path="/fetchAddresssList/{customerId}")
	public ModelAndView fetchAddresssList(HttpServletRequest request, Model model, @PathVariable("customerId") String customerId) {
		System.out.println("INSIDE : fetchAddresssList");	

		List<Address> addressList = addressServ.fetchAddressWithCustomerId(customerId);

		model.addAttribute("CUSTOMER_ID", customerId);
		model.addAttribute("ADDRESS_OBJ_LIST", addressList);		
		return new ModelAndView("/address_list.jsp");

	}

	
	@PostMapping(path="/editAddress") 
	public @ResponseBody String editAddress(HttpServletRequest request, @ModelAttribute("SpringWeb")Address objAddress) {
		System.out.println("START: Controller Eidt Address");		
		try {
			addressServ.addEditAddressDetails(objAddress);
		} catch (HibernateException e) {
			return "<center><div class='content-div'>Oops!, Faild to Edit Address Details!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
		}
		return "<center><div class='content-div'>Congratulation, Address Edit Successfully!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}
	
	
	@GetMapping(path="/deleteAddressDetails/{addressId}") 
	public @ResponseBody String deleteAddressDetails(HttpServletRequest request, @PathVariable("addressId") String addressId) {
		System.out.println("START: Controller deleteAddressDetails");		
		addressServ.deleteAddressDetails(addressId);
		return "<center><div class='content-div'>Congratulation, Address Deleted Successfull!<br> <a href='"+request.getContextPath()+"/jmeher/index' >Go To Home</a></dvi></center>";
	}


}
