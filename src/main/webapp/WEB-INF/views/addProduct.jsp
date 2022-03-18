<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SportyShoes</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css">


</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">SportyShoes.com</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li class="active"><a href="${contextPath}/listProducts">Home</a></li>
						<li class="active"><a href="${contextPath}/orderHistory?username=${pageContext.request.userPrincipal.name}">My Order History</a></li>
						<li class="active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ADMIN <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li role="presentation"><a href="${contextPath}/addProducts">Add New Product</a></li>
								<li role="separator" class="divider"></li>
								<li role="presentation"><a href="${contextPath}/userList">User List</a></li>
								<li role="separator" class="divider"></li>
								<li role="presentation"><a href="${contextPath}/purchaseReport">Purchase Report</a></li>
								<li role="separator" class="divider"></li>
								<li role="presentation"><a href="${contextPath}/changepassword?username=${pageContext.request.userPrincipal.name}">Change Password</a></li>
							</ul>
						</li>
						<li class="dropdown" style="float: right;">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li role="presentation"><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
				</form>
			</div>
		</div>
	</nav>
	<div class="container container-page">

		<form:form method="POST" action="${contextPath}/addProducts" modelAttribute="product" class="form-horizontal">
			<div>
				<h2 class="form-heading">Add Product</h2>
				<div class="panel panel-black">
					<div class="panel-heading">
						<h3 class="panel-title">Sporty Shoe Details</h3>
					</div>
					<div class="panel-body">
						<div align="center" class="form-group">
							<div class="col-sm-12">
								<span id="appbusdetailErr" style="color: red;"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Product Name <span style="color:red;">*</span> </label>
							<div class="col-sm-4">
								<input name="name" type="text" maxlength="40" class="form-control" value="${product.name}" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Product Price <span style="color:red;">*</span> </label>
							<div class="col-sm-4">
								<input name="price" id="price" type="text" maxlength="40" class="form-control" value="${product.price}" required/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Product Category <span style="color:red;">*</span> </label>
							<div class="col-sm-4">
								<select name="category" id="category" class="form-control" role="listbox" required>
									<c:choose>
										<c:when test="${product.category == null || product.category == ''}">
											<option  value="" selected>Select Option</option>
											<option  value="CS">Casual Shoes</option>
											<option  value="SS">Sports Shoes</option>
											<option  value="FS">Formal Shoes</option>
											<option  value="SK">Sneakers</option>
										</c:when>
										<c:when test="${product.category == 'CS'}">
											<option  value="">Select Option</option>
											<option  value="CS" selected>Casual Shoes</option>
											<option  value="SS">Sports Shoes</option>
											<option  value="FS">Formal Shoes</option>
											<option  value="SK">Sneakers</option>
										</c:when>
										<c:when test="${product.category == 'SS'}">
											<option  value="">Select Option</option>
											<option  value="CS">Casual Shoes</option>
											<option  value="SS" selected>Sports Shoes</option>
											<option  value="FS">Formal Shoes</option>
											<option  value="SK">Sneakers</option>
										</c:when>
										<c:when test="${product.category == 'FS'}">
											<option  value="">Select Option</option>
											<option  value="CS">Casual Shoes</option>
											<option  value="SS">Sports Shoes</option>
											<option  value="FS" selected>Formal Shoes</option>
											<option  value="SK">Sneakers</option>
										</c:when>
										<c:when test="${product.category == 'SK'}">
											<option  value="" >Select Option</option>
											<option  value="CS">Casual Shoes</option>
											<option  value="SS">Sports Shoes</option>
											<option  value="FS">Formal Shoes</option>
											<option  value="SK" selected>Sneakers</option>
										</c:when>
									</c:choose>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div align="center">
					<button id="submitbutton" style="width: 150px" class="btn btn-lg btn-primary inline-block" type="submit" >Submit</button>
					<c:if test="${(product.id != null && product.id > 0) || pageContext.request.userPrincipal.name != null}">
						<button id="backbutton" style="width: 150px" class="btn btn-lg btn-primary inline-block" type="button" onclick="history.back()">Back</button>
					</c:if>
				</div>
			</div>
			<input type="hidden" name="id" id="productId" value="${product.id}" />
		</form:form>
	</div>
	
	<script	type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
