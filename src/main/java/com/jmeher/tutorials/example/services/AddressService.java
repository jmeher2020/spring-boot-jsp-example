package com.jmeher.tutorials.example.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmeher.tutorials.example.model.Address;
import com.jmeher.tutorials.example.repository.AddressRepository;

@Service  
public class AddressService {

	@Autowired 
	AddressRepository addressRepo;

	@PersistenceContext
	EntityManager entityManager;



	public void addEditAddressDetails(Address objAdd) throws HibernateException{
		if(objAdd != null) {
			addressRepo.save(objAdd);
		}
		
	}


	@SuppressWarnings("unchecked")
	public List<Address> fetchAddressWithCustomerId(String customerId) {
		Query query = entityManager.createNativeQuery("SELECT * from address where customer_id=?", Address.class);
		query.setParameter(1, Long.valueOf(customerId));
		return (List<Address>) query.getResultList();	
	}


	public Address fetchAddressWithId(String addressId) {

		Query query = entityManager.createNativeQuery("SELECT * from address where address_id=?", Address.class);
		query.setParameter(1, Long.valueOf(addressId));
		return (Address)query.getSingleResult();	
	}



	public void deleteAddressDetails(String addressId) {
		addressRepo.deleteById(Long.valueOf(addressId));
		
	}
	
	public String countNoOfAddress() {
		return String.valueOf(addressRepo.count());		
	}


}
