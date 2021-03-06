<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<h3 class="box-title">SportyShoes User List</h3>
			</div>
			<div class="box-header form-inline">
				<div class="col-md-12 pull-right">
					<form method="GET" action="${contextPath}/searchUser" class="form-inline">
					<div style="float: right;">
						<input type="search" name="username" class="control-label form-control  input-sm" value="${param.username}" placeholder="User Name" />
							&nbsp;&nbsp;
						<button type="submit" class="btn btn-primary pull-right" title="Search">
							<i class="fa fa-search"></i>
						</button>
					</div>
					</form>
				</div>
			</div>
			<div class="box-body table-responsive no-padding">
				<table class="table">
					<tr>
						<th width="140">User Id</th>
						<th width="120">User Name</th>
					</tr>

					<c:if test="${!empty listOfSignUpUsers}">
						<c:forEach items="${listOfSignUpUsers}" var="user">
						<c:if test="${pageContext.request.userPrincipal.name != user.username}">
							<tr>
								<td>${user.id}</td>
								<td>${user.username}</td>
							</tr>
						</c:if>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
</div>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
