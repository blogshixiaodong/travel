<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
</head>
<body>
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			 <a href="" class="site_title"><i class="fa fa-paw"></i>
				<span>后台管理</span> 
			</a>
		</div>
		<div class="clear fix"></div>
		<!-- menu profile quick info -->
		<div class="profile clear fix">
			<div class="profile_pic">
				<img src="../vendors/admin/images/img.jpg" alt="..." class="img-circle profile_img"/>
			</div>
			<div class="profile_info">
				<span>控制台</span>
			</div>
		</div>
		<br />
		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<h3>General</h3>
				<ul class="nav side-menu">
					<li>
						<a><i class="fa fa-home"></i>景点信息<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="#">上传图片</a></li>
							<li><a href="#">添加景点</a></li>
							<li><a href="#">修改景点</a></li>
							<li><a href="#">删除景点</a></li>
						</ul>
					</li>
					<li>
						<a><i class="fa fa-edit"></i>酒店信息<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="create_hotel.jsp">添加酒店</a> </li>
							<li><a href="update_hotel.jsp">修改酒店</a> </li>
							<li><a href="delete_hotel.jsp">删除酒店</a> </li>
						</ul>
					</li>

					<li>
						<a><i class="fa fa-edit"></i>旅游新闻<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="create_news.jsp">添加新闻</a></li>
							<li><a href="news.jsp">删除更改新闻</a></li>
						</ul>
					</li>
					
					<li>
						<a><i class="fa fa-table"></i>留言信息<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="message.jsp">留言回复删除</a></li>
						</ul>
					</li>
					<li>
						<a><i class="fa fa-bar-chart-o"></i>旅游线路<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="create_touritline.jsp">发布线路</a></li>
							<li><a href="update_touristline.jsp">修改线路</a></li>
							<li><a href="delete_touristline.jsp">删除线路</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /menu footer buttons -->
			<div class="sidebar-footer hidden-small">
				<a data-toggle="tooltip" data-placement="top" title="Settings"> 
					<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
				</a> 
				<a data-toggle="tooltip" data-placement="top" title="FullScreen">
					<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
				</a> 
				<a data-toggle="tooltip" data-placement="top" title="Lock"> 
					<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
				</a> 
				<a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
					<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
				</a>
			</div>
			<!-- /menu footer buttons -->
		</div>
		<!-- /sidebar menu -->
	</div>
</body>
</html>