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
								<div><h2>删除酒店信息</h2></div>
								<div class="clearfix"></div>
							</div>
                            <div class="panel-body">
                                <front style="float: left">
                                    <front style="float: left">
                                        <form style="margin:0px" class="form-inline">
                                            <div class="form-group" style="margin:0px auto">
                                                <div class="input-group input-group-sm" style="margin-left:20px">
                                                    <span class="input-group-addon">名称</span>
                                                    <input type="text" class="form-control" id="hotelName" value="" />
                                                </div>
                                                <div class="input-group input-group-sm" style="margin-left:30px">
                                                    <span class="input-group-addon">地址</span>
                                                    <input type="text" class="form-control" id="hotelAddress" value="" />
                                                </div>
                                                <div class="input-group input-group-sm" style="margin-left:30px">
                                                    <span class="input-group-addon">价格</span>
                                                    <input type="text" class="form-control" id="hotelLowPrice" value="" style="width:50px;" />
                                                </div>-
                                                <div class="input-group input-group-sm">
                                                    <input type="text" class="form-control" id="hotelHighPrice" value="" style="width:50px;" />
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-default btn-sm" id="submit" style="margin-left: 30px">查找</button>
                                            <button type="reset" class="btn btn-default btn-sm" style="margin-left: 20px">重置</button>
                                        </form>
                                    </front>
                                </front>
                            </div>
							<div class="x_content">
								<div class="row">
									<table id="hotels" class="table table-striped table-hover"></table>
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
    <script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="../module/js/common/common.js"></script>
	<script type="text/javascript">

		$(function() {
			var url = "../hotel/queryAllHotel.action";
			initTable($("#hotels"), url, queryParams, columns);
		});

		function queryParams(params){
			return {
				"pageContainer.pageSize": params.pageSize,
				"pageContainer.currentPageNo": params.pageNumber
			}
		}

		var columns = [{
			field: 'hotelId',
			title: '酒店编号',
			align: 'center',
			valign: 'middle',
			sortable: true // 开启排序功能
		}, {
			field: 'hotelName',
			title: '酒店名称',
			align: 'center',
			valign: 'middle'
		}, {
			field: 'hotelPrice',
			title: '酒店价格',
			align: 'center',
			valign: 'middle',
			sortable: true
		}, {
			field: 'hotelPhone',
			title: '酒店电话',
			align: 'center',
			valign: 'middle'
		}, {
			field: 'hotelAddress',
			title: '酒店地址',
			align: 'center',
			valign: 'middle'
		}, {
            //field: '删除',
            title: '删除',
            align: 'center',
            valign: 'middle',
            formatter:function(value,row){
                return '<button class="btn btn-primary btn-xs deleteBtnGroup">'+"删除"+' </button>';
            }
        }];

        function queryHotelByCondition(params){
            var hotelName = $("#hotelName").val();
            var hotelAddress = $("#hotelAddress").val();
            var hotelLowPrice = $("#hotelLowPrice").val();
            var hotelHighPrice = $("#hotelHighPrice").val();
            if(hotelName == "" && hotelAddress == "" && hotelHighPrice == "" && hotelLowPrice == ""){
                alert("至少输入一个查询条件");
                window.location = "./update_hotel.jsp";
            }
            return{
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber,
                "hotel.hotelName":hotelName,
                "hotel.hotelAddress":hotelAddress,
                "hotelLowPrice":hotelLowPrice,
                "hotelHighPrice":hotelHighPrice
            }
        }
	 $("#submit").click(function(){
		 var url = "../hotel/queryHotelByCondition.action";
         initTable($("#hotels"),url,queryHotelByCondition,columns);
		 return false;
	});
	$('#hotels').on("click", ".deleteBtnGroup", function() {
		var hotelId = $(this).parent().parent().children().get(0).innerHTML;
		$.ajax({
			url: "../hotel/deleteHotelByHotelId.action",
			type: "post",
			data: {
				"hotel.hotelId" : hotelId
			},
			dataType: "json",
			success: function(responseText){
				alert(responseText);
				location.reload();
			}
		});
	});
	</script>
</body>
</html>