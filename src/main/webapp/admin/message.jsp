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
                            <div style="margin-left: 30px"><h2>留言</h2></div>
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
                        <div class="row">



                        </div>
                        <div class="panel-body">
                            <front style="float: right">
                                <front style="float: right">
                                    <form style="margin:0px" class="form-inline" >
                                        <div class="form-group">
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-addon">留言关键字</span>
                                                <input id="headCondition" type="text" class="form-control" name="search" value="" />
                                            </div>
                                        </div>
                                        <button id="submitCondition" type="submit" class="btn btn-default btn-sm">查找</button>
                                    </form>
                                </front>
                            </front>
                        </div>
                        <table id="message" class="table table-striped table-hover"></table>
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
<script src="../vendors/admin/js/custom.min.js"></script>
<script src="../vendors/admin/js/common.js"></script>
<script type="text/javascript" src="../vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="../module/js/common/common.js"></script>
<script type="text/javascript">
    //激活下拉列表
    $(".dropdown-toggle").dropdown();

    var MessageTable = {
        init: function(url, queryParams) {
            $("#message").bootstrapTable("destroy");
            $("#message").bootstrapTable({
                url: url,
                method: "get",
                cache: false, // 不缓存
                striped: true, // 隔行加亮
                height: 300,
                sortable: true,
                sortName: 'messageId', // 设置默认排序为 name
                sortOrder: "asc",
                uniqueId: "messageId", //每一行的唯一标识，一般为主键列
                pagination: true, // 开启分页功能
                pageNumber: 1,
                pageSize: 3,    //每页的记录行数（*）
                pageList: [5, 10, 15, 20],
                paginationPreText: "上一页",
                paginationNextText: "下一页",
                sidePagination: "server",
                clickToSelect: true, // 单击行即可以选中
                search: false, // 开启搜索功能
                showColumns: false, // 开启自定义列显示功能
                showRefresh: false, // 开启刷新功能
                queryParamsType: "undefined",
                queryParams: queryParams, //查询参数
                columns: [{
                    field: 'messageInfo',
                    title: '留言内容',
                    align: 'center',
                    valign: 'middle',
                },  {
                    field: 'messageTime',
                    title: '留言时间',
                    align: 'center',
                    valign: 'middle',
                    formatter: function(value, row, index) {
                        return jsonDateToString(value);
                    },
                },{
                    field: 'replayInfo',
                    title: '回复内容',
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        if(value==null||value=="")
                            return "暂无回复信息！";
                        else
                            return value;
                    },
                },  {
                    field: 'replayTime',
                    title: '回复时间',
                    align: 'center',
                    valign: 'middle',
                    formatter: function(value, row, index) {
                        if(value==null||value=="")
                            return "暂无回复信息！";
                        else
                            return jsonDateToString(value);
                    },
                }],
                responseHandler: function (e) {
                    var json = JSON.parse(e);
                    return json;
                },
                onLoadSuccess: function() {
                    console.log("加载成功.");
                },
                onLoadError: function() {
                    alert("加载失败, 刷新重试.");
                }
            });
        }
    };

    $(function() {
        MessageTable.init("message/queryAllMessage.action", function(params) {
            return {
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber,
            };
        });
    });


</script>
</body>
</html>