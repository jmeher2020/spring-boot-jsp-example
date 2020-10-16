<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.jmeher.tutorials.example.model.Address"%>
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
		Address addressObj = (Address)request.getAttribute("ADDRESS_OBJ");
	%>
	
</head>
<body style="text-align: -webkit-center;">
	
	<div class="content-div">
	<h2>JMeher Tutorials - <span id="textAddEddit">Add</span> Address Details</h2>
	<form:form name="addAddressForm" id="addAddressForm"  action="${contextPath}/jmeher/addAddress" method="post" modelAttribute="addressForm" >
	
		<div class="form-group"  >
	      <label >Customer ID:</label>
	      <input type="text" class="form-control" name="customerId" id="customerId"  value="${CUSTOMER_ID}"  required readonly/>
	    </div>
	
		<div class="form-group" style="display:none;" id="id_div">
	      <label >Address ID:</label>
	      <input type="text" class="form-control" name="addressId" id="addressId"   required readonly/>
	    </div>	    	
	    
	    <div class="form-group">
	      <label >Address Type:</label>
	      <select class="form-control" name="addressType" id="addressType" required >
	      		<option value="">Select Address Type</option>
	      		<option value="Permanent">Permanent</option>
	      		<option value="Present">Present</option>
	      </select>
	    </div>
	    
		<div class="form-group">
	      <label >Street:</label>
	      <input type="text" class="form-control" name="street" id="street" required />
	    </div>
	    
	    <div class="form-group">
	      <label >City:</label>
	      <input type="text" class="form-control" name="city" id="city" required />
	    </div>
	    
	    <div class="form-group">
	      <label >State:</label>
	      <input type="text" class="form-control" name="state" id="state" required />
	    </div>
	    
	    <div class="form-group">
	      <label >Postal Code:</label>
	      <input type="number" class="form-control" name="postalCode" id="postalCode" required  maxlength="6"/>
	    </div>
	    
	    <div class="form-group">
	      <input type="submit"  name="submitBtn" id="submitBtn" value="Submit" />
	    </div>
	</form:form>
	
		<div class="form-group">
			<i class="fa fa-home" >
	    	    <a href="/jmeher/index" >Go To Home</a>
	     	</i>	
	     	&nbsp; &nbsp; &nbsp;
	     	<i class="fa fa-list" >
	    	    <a href="${contextPath}/jmeher/fetchAddresssList/${CUSTOMER_ID}">Go To Address List</a>
	     	</i>     	
	    </div>
	</div>
	

	<link rel="stylesheet" href="${contextPath}/css/jmeher_custom-1.0.css" />
	<script src="${contextPath}/js/jmeher_custom-1.0.js"></script>
	
	    <%if(addressObj != null){ %>
	    <script>
	    		$("#customerId").val("<%=addressObj.getCustomerId()%>");
	    		$("#addressId").val("<%=addressObj.getAddressId()%>");				
				$("#id_div").css("display", "block");
				$("#addressType").val("<%=addressObj.getAddressType()%>");
				$("#street").val("<%=addressObj.getStreet()%>");
				$("#city").val("<%=addressObj.getCity()%>");
				$("#state").val("<%=addressObj.getState()%>");
				$("#postalCode").val("<%=addressObj.getPostalCode()%>");
				$("#submitBtn").val("Edit");
				$("#textAddEddit").html("Edit");
				$("#addAddressForm").attr("action", "${contextPath}/jmeher/editAddress");
	
	    </script>
	    <%}%>
</body>
</html>