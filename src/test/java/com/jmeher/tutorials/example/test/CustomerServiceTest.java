package com.jmeher.tutorials.example.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotSame;

import java.io.IOException;

import org.junit.Test;

import com.jmeher.tutorials.testclient.HTTPClient;


public class CustomerServiceTest {
	
	/**Test Service for Add Customer Details. Insert Test Data 1**/
	@Test
    public void testAddCustomerService() throws IOException {
		
		String PATH = "addCustomer";
		String POST_PARAMS = "firstName=Arun&lastName=Kumar&phoneNo=1234567890&gender=Kumar";		
		
		String response = HTTPClient.sendPOST(PATH, POST_PARAMS);
		System.out.println("RESPONSE : " + response);
		
        assertEquals("SERVICE FAILED","<center><div class='content-div'>Congratulation, Customer Added Successfull!<br> <a href='/jmeher/index' >Go To Home</a></dvi></center>", response);
    }
	
	/**Test Service for Count Customer (No of Customer registered).**/
	@Test
    public void testCountNoofCustomer() throws IOException {
		
		String GET_URL = "countNoOfCustomer";
		
		String response = HTTPClient.sendGET(GET_URL);
		System.out.println("RESPONSE : " + response);
		
        assertNotSame("NO RECORD FOUND", "0", response);
    }
	
	/**Test Service for Add Customer Details. Insert Test Data 2**/	
	@Test
    public void testAddSecondCustomer() throws IOException {
		
		String PATH = "addCustomer";
		String POST_PARAMS = "firstName=Ramesh&lastName=Jain&phoneNo=1234567890&gender=Kumar";		
		
		String response = HTTPClient.sendPOST(PATH, POST_PARAMS);
		System.out.println("RESPONSE : " + response);
		
        assertEquals("SERVICE FAILED","<center><div class='content-div'>Congratulation, Customer Added Successfull!<br> <a href='/jmeher/index' >Go To Home</a></dvi></center>", response);
    }
	
	/**Test Service for Edit Customer Details. Edit with ID 2**/
	@Test
    public void testEditCustomerService() throws IOException {
		
		String PATH = "editCustomer";
		String POST_PARAMS = "id=1&firstName=Jadumani&lastName=Meher&phoneNo=1234567890&gender=Kumar";
		
		String response = HTTPClient.sendPOST(PATH, POST_PARAMS);
		System.out.println("RESPONSE : " + response);
		
        assertEquals("SERVICE FAILED","<center><div class='content-div'>Congratulation, Customer Edit Successfully!<br> <a href='/jmeher/index' >Go To Home</a></dvi></center>", response);
    }
	

	
	/**Test Service for Edit Customer Details. Edit with ID 2**/
	@Test
    public void testDeletCustomerService() throws IOException {
		
		//String GET_URL = "deleteCustomerDetails/3";
			
		//String response = HTTPClient.sendGET(GET_URL);
		//System.out.println("RESPONSE : " + response);
		
        //assertEquals("SERVICE FAILED","Congratulation, Customer Deleted Successfull!<br> <a href='jmeher/index' >Go To Home</a></dvi></center>", response);
    }
			
}
