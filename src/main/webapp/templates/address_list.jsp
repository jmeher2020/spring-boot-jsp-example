<%@page import="com.jmeher.tutorials.example.model.Address"%>
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
		List<Address> addressList = (List<Address>)request.getAttribute("ADDRESS_OBJ_LIST");
	%>

	
</head>
<body style="text-align: -webkit-center;">	
	<div class="content-div">
		<h2> JMeher Tutorials - Address List</h2>	
		<div class="container"> 
			 <table class="table">
					    <thead class="thead-dark" style="white-space: nowrap">
						    <tr>     
						      <th>Sl. No.</th>
 							  <th>Customer Id</th>          
						      <th>Address Id</th>
						      <th>Address Type</th>                                                       
						      <th>Street</th>
						      <th>City</th>
						      <th>State</th>
						      <th>Postal Code</th>
						      <th style="width: 200px;text-align:center">Actions</th>
						    </tr>
						  </thead>
			              <tbody>	
			              	<%if(!addressList.isEmpty()){ int ctr=1; %>	         
				              	<%for(Address addressObj : addressList){ %>	              
				                  <tr style="border-bottom:1px solid black" class="rowVehData" >
				                  	<td style="width:50px;"><%=ctr%></td>				                  	 				                  	  				                  	   
				                  	    <td ><%=addressObj.getCustomerId()%></td>
				                  	    <td ><%=addressObj.getAddressId()%></td>
				                  	     <td ><%=addressObj.getAddressType()%></td>
				                  	     <td ><%=addressObj.getStreet()%></td>
				                  	      <td ><%=addressObj.getCity()%></td>
				                  	       <td ><%=addressObj.getState()%></td>
				                  	        <td ><%=addressObj.getPostalCode()%></td>
				        
					                  <td style="text-align: center;padding-left: 0 !important;">
					                    <i title="Edit Address" class="editAddressDet fa fa-pencil" data-address-id="<%=addressObj.getAddressId()%>" style="font-size: 20px;color: #007bff;" ></i>&nbsp;&nbsp;
					                    <i title="Delete Address" class="delAddressDet fa fa-trash" data-address-id="<%=addressObj.getAddressId()%>" style="font-size: 20px;color: #007bff;"></i>
					                   
					                  </td>
				                  </tr>          
			              		<%ctr++;}%>
			              	<%}else{%>	
			               		<tr>
			               			<td colspan="9" style="text-align: center;font-size: 19px;font-weight: bold;">No Record Found!</td>
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
	     	<i class="fa fa-list" >
	    	    <a href="/jmeher/fetchCustomersList" >Go To Customer List</a>
	     	</i>
	     	
	     	&nbsp; &nbsp; &nbsp;
	     	<i class="fa fa-plus-circle" >
	    	    <a href="/jmeher/addAddressForm/${CUSTOMER_ID}" >Add Address</a>
	     	</i>	     	
	    </div>
	</div>
	<link rel="stylesheet" href="${contextPath}/css/jmeher_custom-1.0.css" />
	<script src="${contextPath}/js/jmeher_custom-1.0.js"></script>
	<script>	 
	$(document).ready(function(){
	
		$(".editAddressDet").on("click",function(){
			window.location.href = "${contextPath}/jmeher/editAddressForm/"+this.getAttribute("data-address-id");
		});


		$(".delAddressDet").on("click",function(){
			if (confirm("Are you sure want to Remove the Address?")){
				window.location.href = "${contextPath}/jmeher/deleteAddressDetails/"+this.getAttribute("data-address-id");
			}
		});

	
	
		$('.modal').on('hidden.bs.modal', function () {
			window.location.href = '${contextPath}/jmeher/fetchAddresssList';
		})
	});
	</script>
</body>
</html>