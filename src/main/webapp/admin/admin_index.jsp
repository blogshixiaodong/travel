<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap -->
	<link href="../vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="../vendors/admin/css/font-awesome.min.css" rel="stylesheet">
	<!-- Custom Theme Style -->
	<link href="../vendors/admin/css/custom.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../module/css/common.css" />
	<link rel="stylesheet" href="../module/css/index.css" />
	</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<!-- left nav bar -->
				<jsp:include page="left.jsp" />
			</div>

			<jsp:include page="top-nav.jsp" />

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					欢迎光临：
				</div>
			</div>
			<!-- /page content -->

			<jsp:include page="footer.jsp" />
		</div>
	</div>

	<!-- jQuery -->
	<script src="../vendors/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/js/bootstrap.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="../vendors/admin/js/custom.min.js"></script>
	<script src="../vendors/admin/js/common.js"></script>

	<script type="text/javascript">
	//入口函数
	//$(sendAjax(1));

	function sendAjax(currentPage){
		$.ajax({
			url:"allCourses.action",
			type:"post",
			data:{
				"pageContainer.currentPageNo":currentPage
			},
			dataType:"json",

			success: function(responseText){
			},
			error: function(data){
			}
		});
	}
	 $("#btnGroup").on('click','.btn',function(){
			var pageNo = $(this).attr('pageNo');
			sendAjax(pageNo);
	});
	</script>
</body>

</html>