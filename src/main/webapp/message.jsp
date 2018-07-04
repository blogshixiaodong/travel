<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/6/30
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FuZhou Scenery</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/index.css" />
</head>
<body>
<div class="container">

    <jsp:include page="statics/templates/nav.jsp"></jsp:include>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                留言信息
            </div>
            <div class="panel-body">
                <front style="float: right">
                    <front style="float: right">
                        <form style="margin:0px" class="form-inline" >
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">留言内容</span>
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

<script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="module/js/common/common.js"></script>
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
                        return jsonDateToString1(value);
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
                        return jsonDateToString1(value);
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

    $("#submitCondition").click(function() {
        var head = $("#headCondition").val();

        var urls = "message/queryMessageByMessageInfo.action";
//            TouristNoteTable.init(urls, function(params) {
//                return {
//                    "pageContainer.pageSize": params.pageSize,
//                    "pageContainer.currentPageNo": params.pageNumber,
//                    "touristNote.touristNoteHeadLine": head
//                }
//            });
        $("#message").bootstrapTable("destroy");
        var opt = {
            url: urls,
            silent: true,
            query: {
                "pageContainer.pageSize": 5,
                "pageContainer.currentPageNo": 1,
                "message.messageInfo": head
            }
        };
        // $("#touristnote").bootstrapTable("refresh", opt);

        MessageTable.init(urls, function(params) {
            return {
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber,
                "message.messageInfo": head
            };
        });
        return false;
    });

</script>

</body>
</html>
