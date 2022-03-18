<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/theme.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SportyShoes.com</title>
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
		<div class="box" style="margin-top:20px">
			<div class="box-header">
				<h3 class="box-title">SportyShoes List</h3>
			</div>
			<div class="box-header form-inline">
					<div class="form-group">
						<label id="msg" style="display: none;color: red">Invalid Date! From Date can not be greater than End Date</label>
					</div>
				<div class="col-md-12 pull-right">
					<form method="GET" action="${contextPath}/filterPurchaseHistory" class="form-inline">
						<div class="form-group">
							<label class="control-label col-sm-4">From Date</label>
							<div class="col-sm-8">
								<div class="input-group date">
	  								<input type="datepicker" id="fromDate" name="fromDate" class="control-label form-control  input-sm" value="${param.fromDate}"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">To Date</label>
							<div class="col-sm-8">
								<div class="input-group date">
	  								<input type="datepicker" id="toDate" name="toDate" class="control-label form-control  input-sm" value="${param.toDate}"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Category</label>
							<div class="col-sm-8">
	      						<select name="category" class="control-label form-control input-sm" value="${param.category}" style="max-width:600px">
		      						<option value="">Select Cateory</option>
									<option  value="CS">Casual Shoes</option>
									<option  value="SS">Sports Shoes</option>
									<option  value="FS">Formal Shoes</option>
									<option  value="SK">Sneakers</option>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-primary pull-right" title="Search" onclick="return checkDateRange();">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<div class="box-body table-responsive no-padding">
				<table class="table">
					<tr>
						<th width="140">Product Id</th>
						<th width="120">Product Name</th>
						<th width="120">Product Price</th>
						<th width="120">Product Category</th>
						<th width="120">Product Ordered On </th>
						<th width="60">Product Ordered By</th>
					</tr>

					<c:if test="${!empty purchaseReports}">
						<c:forEach items="${purchaseReports}" var="report">
							<tr>
								<td>${report.productId}</td>
								<td>${report.productName}</td>
								<td>Rs. ${report.productPrice}</td>
								<td>
									<c:choose>
										<c:when test="${report.productCategory == 'CS'}">
											Casual Shoes
										</c:when>
										<c:when test="${report.productCategory == 'SS'}">
											Sports Shoes
										</c:when>
										<c:when test="${report.productCategory == 'FS'}">
											Formal Shoes
										</c:when>
										<c:when test="${report.productCategory == 'SK'}">
											Sneakers
										</c:when>
									</c:choose>
								</td>
								<td><fmt:formatDate value="${report.productOrderedOn}" pattern="dd/MM/yyyy" /></td>
								<td>${report.productOrderedBy}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
</div>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".input-group.date").datepicker({
			    format: "dd/mm/yyyy"
			});
		});
		
		function checkDateRange() {
			var from = $("#fromDate").val();
			var to = $("#toDate").val();
			var compFlag = compareTwoDates(from, to);
			if (compFlag == false) {
				document.getElementById("msg").style.display = "block";
				return false;
			}
		}

		function compareTwoDates(fromDate, toDate) {
			var isValid = false;
			var splitedFromDate = fromDate.split('/');
			var fromMm = parseInt(splitedFromDate[0], 10);
			var fromDd = parseInt(splitedFromDate[1], 10);
			var fromYyyy = parseInt(splitedFromDate[2], 10);

			var splitedToDate = toDate.split('/');
			var toMm = parseInt(splitedToDate[0], 10);
			var toDd = parseInt(splitedToDate[1], 10);
			var toYyyy = parseInt(splitedToDate[2], 10);

			var newFromDate = new Date(fromYyyy, fromMm - 1, fromDd);
			var newToDate = new Date(toYyyy, toMm - 1, toDd);

			if (newFromDate.getFullYear() > newToDate.getFullYear()) {
				isValid = false;
				return isValid;
			} else if (newFromDate.getFullYear() == newToDate.getFullYear()) {
				var fromMmOne = newFromDate.getMonth() + 1;
				var toMmOne = newToDate.getMonth() + 1;
				if (fromMmOne > toMmOne) {
					isValid = false;
					return isValid;
				} else if (fromMmOne == toMmOne) {
					if (newFromDate.getDate() > newToDate.getDate()) {
						isValid = false;
						return isValid;
					}
				}

			}
			isValid = true;
			return isValid;
		}
	</script>
</body>
</html>
