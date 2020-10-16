<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.jmeher.tutorials.example.model.Customer"%>
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
		Customer customerObj = (Customer)request.getAttribute("CUSTOMER_OBJ");
	%>
	
</head>
<body style="text-align: -webkit-center;">
	
	<div class="content-div">
	<h2> JMeher Tutorials - <span id="textAddEdit">Add</span> Customer Details</h2>
	<form:form name="addCustomerForm" id="addCustomerForm"  action="${contextPath}/jmeher/addCustomer" method="post" modelAttribute="customerForm" >
	
		<div class="form-group" style="display:none;" id="id_div">
	      <label >Customer ID:</label>
	      <input type="text" class="form-control" name="customerId" id="customerId"   required readonly/>
	    </div>
	    
		<div class="form-group">
	      <label >First Name:</label>
	      <input type="text" class="form-control" name="firstName" id="firstName" required />
	    </div>
	    <div class="form-group">
	      <label >Last Name:</label>
	      <input type="text" class="form-control" name="lastName" id="lastName" required />
	    </div>
	    <div class="form-group">
	      <label >Phone No:</label>
	      <input type="number" class="form-control" name="phoneNo" id="phoneNo" required />
	    </div>
	    <div class="form-group">
	      <label >Gender:</label>
	      <select class="form-control" name="gender" id="gender" required >
	      		<option value="">Select Gender</option>
	      		<option value="Male">Male</option>
	      		<option value="Female">Female</option>
	      </select>
	    </div>
	    <div class="form-group">
	      <input type="submit"  name="submitBtn" id="submitBtn" value="Submit" required />
	    </div>
	</form:form>
	
		<div class="form-group">
			<i class="fa fa-home" >
	    	    <a href="/jmeher/index" >Go To Home</a>
	     	</i>
	     	&nbsp; &nbsp; &nbsp;	     	
	     	<i class="fa fa-list" >
	    	    <a href="/jmeher/fetchCustomersList" >Go To Customer List</a>
	     	</i>	     	
	    </div>
	 </div>
	 
		<link rel="stylesheet" href="${contextPath}/css/jmeher_custom-1.0.css" />
		<script src="${contextPath}/js/jmeher_custom-1.0.js"></script>
	
	    <%if(customerObj != null){ %>
	    <script>
	    
		    
				$("#customerId").val("<%=customerObj.getCustomerId()%>");
				$("#id_div").css("display", "block");
				$("#firstName").val("<%=customerObj.getFirstName()%>");
				$("#lastName").val("<%=customerObj.getLastName()%>");
				$("#phoneNo").val("<%=customerObj.getPhoneNo()%>");
				$("#gender").val("<%=customerObj.getGender()%>");
				$("#submitBtn").val("Edit");
				$("#textAddEdit").html("Edit");
				$("#addCustomerForm").attr("action", "${contextPath}/jmeher/editCustomer");
	
	    </script>
	    <%}%>
</body>
</html>