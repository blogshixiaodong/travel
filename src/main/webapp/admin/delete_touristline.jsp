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
                                <div><h2>删除线路信息</h2></div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">

                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <table id="touristLineList" class="table table-striped table-hover"></table>
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
            field: 'touristLineName',
            title: '线路名称',
            align: 'center',
            valign: 'middle'
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
                return '<button class="btn btn-primary btn-xs deletLine">删除</button>';
            }
        }];

        $('#touristLineList').on("click", ".deletLine", function() {
            var touristLineId = $(this).parent().parent().children().get(0).innerHTML;
            $.ajax({
                url: "../touristLine/removeTouristLine.action",
                type: "post",
                dataType: "json",
                data: {
                    "touristLine.touristLineId": touristLineId
                },
                success: function(responseText) {
                    alert(responseText);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("删除出错,请重新尝试.");
                    location.reload();
                }
            });

        });

    </script>
</body>
</html>