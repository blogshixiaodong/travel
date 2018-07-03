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
                                <div><h2>修改线路信息</h2></div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">
                                <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                    酒店名称：<input id="updateHotelName" type="text" class="form-control" />
                                                </div>
                                                <div class="input-group date" >
                                                    酒店地址：<input id="updateHotelAddress" type="text" class="form-control" />
                                                </div>
                                                <div class="input-group date" >
                                                    酒店电话：<input id="updateHotelPhone" type="text" class="form-control" />
                                                </div>
                                                <div class="input-group date" >
                                                    酒店价格：<input id="updateHotelPrice" type="text" class="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group date" >
                                                        酒店介绍：
                                                        <div class="col-md-13 col-sm-12 col-xs-13">
                                                            <textarea id="updateHotelIntroduce" rows="8" class="resizable_textarea form-control" placeholder="具体酒店介绍..."></textarea>
                                                            <br/><br/>
                                                            <button id="leaveInfoSubmit" type='button' class='btn btn-success btn-sm'>提交</button>
                                                            <button id="leaveInfoReset" type='button' class='btn btn-success btn-sm'>重置</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                </button>
                                                <button type="button" class="btn btn-primary">
                                                    提交更改
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <table id="touristLineList" class="table table-striped table-hover"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                    +
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
            var url = "../touristLine/findTouristLineList.action";
            initTable($("#touristLineList"), url, queryParams, columns);

        });

        function queryParams(params){
            return {
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber
            }
        }

        var columns = [{
            field: 'touristLineId',
            title: '线路编号',
            align: 'center',
            valign: 'middle',
            sortable: true // 开启排序功能
        }, {
            field: 'touristLinePrice',
            title: '线路价格',
            align: 'center',
            valign: 'middle'
        }, {
            field: "删除操作",
            title: "删除操作",
            align: "center",
            valign: "middle",
            formatter: function(value, row, index) {
                return '<button class="btn btn-primary btn-xs updateLine">修改</button>';
            }
        }];

        $("#touristLineList").on("click", ".updateLine", function() {
            var touristLineId = $(this).parent().parent().children().get(0).innerHTML;
            $.ajax({
                url: "../touristLine/findLineSceneryByTouristLineId.action",
                type: "post",
                dataType: "json",
                data: {
                    "touristLine.touristLineId": touristLineId
                },
                success: function(responseText) {
                    var json = JSON.parse(responseText);
                    console.log(json);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("修改出错,请重新尝试.");
                    location.reload();
                }
            });

            $("#modal").modal();
        });

    </script>
</body>
</html>