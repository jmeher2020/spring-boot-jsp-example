package com.jmeher.tutorials.example.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmeher.tutorials.example.model.Customer;
import com.jmeher.tutorials.example.repository.CustomerRepository;

@Service  
public class CustomerService {

	@Autowired 
	CustomerRepository customerRepo;

	@PersistenceContext
	EntityManager entityManager;



	public void addEditCustomerDetails(Customer objCustomer) throws HibernateException{
		customerRepo.save(objCustomer);
	}


	@SuppressWarnings("unchecked")
	public List<Customer> fetchCustomerList() {	
		Query query = entityManager.createNativeQuery("SELECT * from customer", Customer.class);
		return (List<Customer>)query.getResultList();		
	}



	public Customer fetchCustomerWithId(String customerId) {
		Query query = entityManager.createNativeQuery("SELECT * from customer where customer_id=?", Customer.class);
		query.setParameter(1, Long.valueOf(customerId));
		return (Customer)query.getSingleResult();	
	}



	public void deleteCustomerDetails(String customerId) {
		customerRepo.deleteById(Long.valueOf(customerId));
		
	}
	
	public String countNoOfCustomer() {
		return String.valueOf(customerRepo.count());		
	}


}
