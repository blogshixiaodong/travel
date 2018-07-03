<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top-nav</title>
</head>
<body>
	<!-- top navigation -->
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
			  <div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars" target="teacher_left"></i></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="">
					<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
						<img src="../vendors/admin/images/img.jpg" alt="">
							<s:property value = "#session.admin.username"/>
						<span class=" fa fa-angle-down"></span>
					</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li><a href="${pageContext.request.contextPath}/adminAccount/adminOutLogin.action"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
					</ul>
				</li>
			</ul>
			</nav>
		</div>
	</div>
	<!-- /top navigation -->
</body>
</html>