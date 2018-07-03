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
	<link rel="stylesheet" href="../vendors/bootstrap-table/css/bootstrap-table.min.css" />
	<%--daterangepicker--%>
	<link href="../vendors/daterangepicker/css/daterangepicker.css" rel="stylesheet">
	<link href="../vendors/daterangepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

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
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<div style="margin-left: 30px"><h2>添加景点信息</h2></div>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-12 form-group" style="margin-left: 30px">
										<div class="input-group date" >
											景点名称：<input id="sceneryName" type="text" class="form-control" />
										</div>
										<div class="input-group date" >
											门票价格：<input id="sceneryPrice" type="text" class="form-control" />
										</div>
										开放时间：
										<div class="input-group date" id="myDatepicker" style="position: relative">
											<input id="sceneryOpenTime" type="text" class="form-control"/>
				                            <span class="input-group-addon" >
				                               <span class="glyphicon glyphicon-calendar"></span>
				                            </span>
										</div>
										<div class="input-group date" >
											景点图片：<input id="sceneryPhoto" type="text" class="form-control" />
										</div>

										<div class="form-group">
											<div class="input-group date" >
												景点介绍：
												<div class="col-md-13 col-sm-12 col-xs-13">
													<textarea id="sceneryIntroduce" rows="8" class="resizable_textarea form-control" placeholder="具体景点介绍..."></textarea>
													<br/><br/>
													<button id="createScenerySubmit" type='button' class='btn btn-success btn-sm'>提交</button>
													<button id="createSceneryReset" type='button' class='btn btn-success btn-sm'>重置</button>
												</div>
											</div>
										</div>
									</div>
			                    </div>
							</div>
						</div>
					</div>
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
	<script src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="../vendors/daterangepicker/js/moment.min.js"></script>
	<script src="../vendors/daterangepicker/js/daterangepicker.js"></script>
	<script src="../vendors/daterangepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

	$(function(){
		var beginTimeTake;
		$("#myDatepicker").daterangepicker({
			singleDatePicker: true,
			showDropdowns: true,
			autoUpdateInput: false,
			timePicker24Hour: true,
			timePicker: true,
			"locale": {
				format: 'YYYY-MM-DD HH:mm',
				applyLabel: "应用",
				cancelLabel: "取消",
				resetLabel: "重置"
			}
		},function(start,end,label){
			beginTimeTake = start;
			if(!this.startDate){
				$("#sceneryOpenTime").val("");
			}else{
				$("#sceneryOpenTime").val(this.startDate.format(this.locale.format));
			}
		});
	});

	function sendAjax(){
		var sceneryName = $("#sceneryName").val();
		var sceneryPrice = $("#sceneryPrice").val();
		var sceneryOpenTime = $("#sceneryOpenTime").val();
		var sceneryIntroduce = $("#sceneryIntroduce").val();

		if(sceneryName == "" || sceneryPrice == "" || sceneryOpenTime == null || sceneryIntroduce == ""){
			alert("请将信息填写完整");
			$("#sceneryName").value = sceneryName;
			$("#sceneryPrice").value = sceneryPrice;
			$("#sceneryOpenTime").value = sceneryOpenTime;
			$("#sceneryIntroduce").value = sceneryIntroduce;
			return;
		}
		if(!checkNumber(sceneryPrice)){
			alert("价格格式不正确");
			return;
		}
		$.ajax({
			url:"../scenery/createScenery.action",
			type:"post",
			data:{
				"scenery.sceneryName": sceneryName,
				"scenery.sceneryPrice": sceneryPrice,
				"scenery.sceneryOpenTime": sceneryOpenTime,
				"scenery.sceneryIntroduce" : sceneryIntroduce,
			},
			dataType:"json",
			success: function(responseText){
				alert(responseText);
				location.href = "../admin/admin_index.jsp";
			},
			error: function(data){
			}
		});
	}
	 $("#createScenerySubmit").click(function(){
		 sendAjax();
		 return false;
	});
	$("#createSceneryReset").click(function(){
		$("#sceneryName").val("");
		$("#sceneryPrice").val("");
		$("#sceneryOpenTime").val("");
		$("#sceneryIntroduce").val("");
	});


	</script>
</body>
</html>