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
								<div><h2>修改信息</h2></div>
								<div class="clearfix"></div>
							</div>
                            <div class="panel-body">
                                <front style="float: right">
                                    <front style="float: right">
                                        <form style="margin:0px" class="form-inline">
                                            <div class="form-group" style="margin:0px auto">
                                                <div class="input-group input-group-sm" style="margin-left:20px">
                                                    <span class="input-group-addon">名称</span>
                                                    <input type="text" class="form-control" id="sceneryName" value="" />
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-default btn-sm" id="submit" style="margin-left: 30px">查找</button>
                                        </form>
                                    </front>
                                </front>
                            </div>
							<div class="x_content">
								<div class="row">
									<table id="scenerys" class="table table-striped table-hover"></table>
			                    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                修改
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group date" >
                                景点编号：<input id="updateSceneryId" type="text" class="form-control" readonly="readonly"/>
                            </div>
                            <div class="input-group date" >
                                景点名称：<input id="updateSceneryName" type="text" class="form-control" />
                            </div>
                            <div class="input-group date" >
                                景点价格：<input id="updateSceneryPrice" type="text" class="form-control" />
                            </div>
                            <%--<div class="input-group date" >
                                开放时间：<input id="updateSceneryOpenTime" type="text" class="form-control" />
                            </div>--%>
                            开放时间：
                            <div class="input-group date" id="myDatepicker" style="position: relative">
                                <input id="updateSceneryOpenTime" type="text" class="form-control"/>
				                            <span class="input-group-addon" >
				                               <span class="glyphicon glyphicon-calendar"></span>
				                            </span>
                            </div>
                            <div class="form-group">
                                <div class="input-group date" >
                                    景点介绍：
                                    <div class="col-md-13 col-sm-12 col-xs-13">
                                        <textarea id="updateSceneryIntroduce" rows="8" class="resizable_textarea form-control" placeholder="具体酒店介绍..."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button id="updateBtn" type="button" class="btn btn-primary">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
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
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/daterangepicker/js/moment.min.js"></script>
    <script src="../vendors/daterangepicker/js/daterangepicker.js"></script>
    <script src="../vendors/daterangepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

		$(function() {
			var url = "../scenery/queryAllScenery.action";
			initTable($("#scenerys"), url, queryParams, columns);
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
                    $("#udpateSceneryOpenTime").val("");
                }else{
                    $("#updateSceneryOpenTime").val(this.startDate.format(this.locale.format));
                }
            });
		});

		function queryParams(params){
			return {
				"pageContainer.pageSize": params.pageSize,
				"pageContainer.currentPageNo": params.pageNumber
			}
		}

		var columns = [{
			field: 'sceneryId',
			title: '景点编号',
			align: 'center',
			valign: 'middle',
			sortable: true // 开启排序功能
		}, {
			field: 'sceneryName',
			title: '景点名称',
			align: 'center',
			valign: 'middle'
		}, {
			field: 'sceneryPrice',
			title: '景点价格',
			align: 'center',
			valign: 'middle',
			sortable: true
		}, {
			field: 'sceneryOpenTime',
			title: '开放时间',
			align: 'center',
			valign: 'middle',
            formatter: function(value,row,index){
                return jsonDateToString(value);
            }
		}, {
			field: 'sceneryIntroduce',
			title: '景点介绍',
			align: 'center',
			valign: 'middle'
		}, {
            //field: '删除',
            title: '修改',
            align: 'center',
            valign: 'middle',
            formatter:function(value,row){
                return '<button class="btn btn-primary btn-xs updateBtnGroup">'+"修改"+' </button>';
            }
        }];

        function querySceneryByName(params){
            var sceneryName = $("#sceneryName").val();
            if(sceneryName == ""){
                return;
            }
            return{
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber,
                "scenery.sceneryName": sceneryName
            }
        }
        //查询确认键
        $("#submit").click(function(){
             var url = "../scenery/querySceneryBySceneryName.action";
             initTable($("#scenerys"),url,querySceneryByName,columns);
             return false;
        });
        //修改键
        $('#scenerys').on("click", ".updateBtnGroup", function() {
            var sceneryId = $(this).parent().parent().children().get(0).innerHTML;
            var sceneryName = $(this).parent().parent().children().get(1).innerHTML;
            var sceneryPrice = $(this).parent().parent().children().get(2).innerHTML;
            var sceneryOpenTime = $(this).parent().parent().children().get(3).innerHTML;
            var sceneryIntroduce = $(this).parent().parent().children().get(4).innerHTML;
            $("#updateSceneryId").val(sceneryId);
            $("#updateSceneryName").val(sceneryName);
            $("#updateSceneryPrice").val(sceneryPrice);
            $("#updateSceneryOpenTime").val(sceneryOpenTime);
            $("#updateSceneryIntroduce").val(sceneryIntroduce);
            $("#myModal").modal();
        });
        //确认修改键
        $("#updateBtn").click(function(){
            var sceneryId = $("#updateSceneryId").val();
            var sceneryName = $("#updateSceneryName").val();
            var sceneryPrice = $("#updateSceneryPrice").val();
            var sceneryOpenTime = $("#updateSceneryOpenTime").val();
            var sceneryIntroduce = $("#updateSceneryIntroduce").val();
            if(sceneryName == "" || sceneryOpenTime == "" || sceneryPrice == "" || sceneryIntroduce == ""){
                alert("修改失败，修改信息需填写完整");
                return;
            }
            if(!checkNumber(sceneryPrice)){
                alert("景点价格格式不正确");
                return;
            }
            $("#myModal").modal("hide");
            $.ajax({
                url: "../scenery/updateScenery.action",
                type: "post",
                data: {
                    "scenery.sceneryId" : sceneryId,
                    "scenery.sceneryName": sceneryName,
                    "scenery.sceneryOpenTime": sceneryOpenTime,
                    "scenery.sceneryPrice": sceneryPrice,
                    "scenery.sceneryIntroduce": sceneryIntroduce
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