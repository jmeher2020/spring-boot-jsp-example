<%@page import="com.jmeher.tutorials.example.model.Customer"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>JMeher Tutorials</title>
	<link rel="icon" href="${contextPath}/images/favicon1.ico" type="image/ico">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
		<%
			List<Customer> customerList = (List<Customer>)request.getAttribute("CUSTOMER_OBJ_LIST");
		%>

	
</head>
<body style="text-align: -webkit-center;">	
	<div class="content-div">
		<h2> JMeher Tutorials - Customer List</h2>	
			<div class="container"> 
			 <table class="table">
					    <thead class="thead-dark" style="white-space: nowrap">    
						      <th>Sl. No.</th>           
						      <th>Cust. ID</th> 							                               
						      <th>First Name</th>                                                        
						      <th>Last Name</th>
						      <th>Phone No</th>
						      <th>Gender</th>
						      <th style="width: 200px;text-align:center">Actions</th>
						    </tr>
						  </thead>
			              <tbody>	
			              	<%if(!customerList.isEmpty()){ int ctr=1;%>	         
				              	<%for(Customer customerObj : customerList){%>
	         				              		              
				                  <tr style="border-bottom:1px solid black" class="rowVehData" >
				                  	  <td style="width:50px;"><%=ctr%></td>
				                  	   <td ><%=customerObj.getCustomerId() %></td>
				                  	    <td><%=customerObj.getFirstName()%></td>
				                  	    <td ><%=customerObj.getLastName() %></td>
				                  	    <td ><%=customerObj.getPhoneNo()%></td>				                  	     
				                  	      <td ><%=customerObj.getGender() %></td>
				        
					                  <td style="text-align: center;padding-left: 0 !important;">
					                    <i title="Edit Customer" class="editCustomerDet fa fa-pencil" data-customer-id="<%=customerObj.getCustomerId()%>" style="font-size: 20px;color: #007bff;" ></i>&nbsp;&nbsp;
					                    <i title="Delete Customer" class="delCustomerDet fa fa-trash" data-customer-id="<%=customerObj.getCustomerId()%>" style="font-size: 20px;color: #007bff;"></i>
					                    <i title="Add Address" class="addAddress fa fa-plus-circle" data-customer-id="<%=customerObj.getCustomerId()%>" style="font-size: 20px;color: #007bff;" ></i>&nbsp;&nbsp;
					                    <i title="Show Address" class="showAddress fa fa-list" data-customer-id="<%=customerObj.getCustomerId()%>" style="font-size: 20px;color: #007bff;" ></i>&nbsp;&nbsp;
					                    
				
					                  </td>
				                  </tr>          
			              		<%ctr++;}%>
			              	<%}else{%>	
			               		<tr>
			               			<td colspan="7" style="text-align: center;font-size: 19px;font-weight: bold;">No Record Found!</td>
			               		</tr> 
				            <%}%>
			              </tbody>
		            </table> 
				</div>

		<div class="form-group">
			<i class="fa fa-home" >
	    	    <a href="/jmeher/index" >Go To Home</a>
	     	</i>	
	     	&nbsp; &nbsp; &nbsp;
	     	<i class="fa fa-plus-circle" >
	    	    <a href="/jmeher/addCustomerForm" >Add Customer</a>
	     	</i>     	
	    </div>
	</div>

	
	<link rel="stylesheet" href="${contextPath}/css/jmeher_custom-1.0.css" />
	<script src="${contextPath}/js/jmeher_custom-1.0.js"></script>
	
	<script>
	$(document).ready(function(){
	
		$(".editCustomerDet").on("click",function(){
			window.location.href = "${contextPath}/jmeher/editCustomerForm/"+this.getAttribute("data-customer-id");
		});

		$(".delCustomerDet").on("click",function(){
			if (confirm("Are you sure want to Remove the Customer?")){
				window.location.href = "${contextPath}/jmeher/deleteCustomerDetails/"+this.getAttribute("data-customer-id");
			}
		});

		$(".addAddress").on("click",function(){
			window.location.href = "${contextPath}/jmeher/addAddressForm/"+this.getAttribute("data-customer-id");
		});

		$(".showAddress").on("click",function(){
			window.location.href = "${contextPath}/jmeher/fetchAddresssList/"+this.getAttribute("data-customer-id");
		});
		
	
		$('.modal').on('hidden.bs.modal', function () {
			window.location.href = '${contextPath}/jmeher/fetchCustomersList';
		})
	});
	</script>
</body>
</html>