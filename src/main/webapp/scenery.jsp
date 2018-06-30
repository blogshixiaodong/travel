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
        <!-- 导航栏部分 -->
        <div class="row">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">FuZhou Travel</a>
                    </div>
                    <div>
                        <ul class="nav navbar-nav navbar-left">
                            <li><a href="#">福州介绍</a></li>
                            <li><a href="#">福州景点</a></li>
                            <li><a href="#">旅游线路</a></li>
                            <li><a href="#">旅游游记</a></li>
                            <li><a href="#">旅游新闻</a></li>
                            <li><a href="#">周边酒店</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    留言
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">我要留言</a></li>
                                    <li><a href="#">留言查看</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    登陆
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">游客登陆</a></li>
                                    <li><a href="#">管理员登陆</a></li>
                                </ul>
                            </li>
                            <li><a href="#">注册</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    景点信息
                </div>
                <div class="panel-body">
                    <front style="float: left">
                        <div class="btn-toolbar" role="group">
                            <div class="btn-group" role="group">
                                <a role="button" class="btn btn-default btn-sm" href="#" disabled="">首页</a>
                                <a role="button" class="btn btn-default btn-sm" href="#">1</a>
                                <a role="button" class="btn btn-default btn-sm" href="#">2</a>
                                <a role="button" class="btn btn-default btn-sm" href="#">3</a>
                                <a role="button" class="btn btn-default btn-sm" href="#">尾页</a>
                            </div>
                        </div>
                    </front>
                    <front style="float: right">
                        <front style="float: right">
                            <form style="margin:0px" class="form-inline" action="DiscussList.jsp" method="get">
                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-addon">名称</span>
                                        <input type="text" class="form-control" name="search" value="" />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-default btn-sm">查找</button>
                            </form>
                        </front>
                    </front>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>标题</th>
                        <th>时间</th>
                        <th>类型</th>
                        <th>类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>100</td>
                        <td>1</td>
                        <td>100</td>
                    </tr>
                    </tbody>

                </table>
            </div>

        </div>

    </div>

    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        var json = "{'total': 200, 'pageSize': 2, 'rows': [" +
            "{" +
            "'sceneryId': 1," +
            "'sceneryName': 'name'," +
            "'sceneryOpenTime': '2018-7-1'" +
            "}]}"

        alert(json);
        //激活下拉列表
        $(".dropdown-toggle").dropdown();
//        $.get(
//            "localhost:",
//            function (result) {
//                if(result.code == 200) {
//                    var data = jsonConvertToBootstrapTableData(result);
//                    $(".table").bootstrapTable({
//                        data: data,
//                        dataType: json,
//                        cache: false,
//                        striped: true
//                    })
//                }
//            }
//        );

        function initTable(json) {
            $(".table").bootstrapTable({
                url:"http://127.0.0.1/yjstar-manager/system/role_manage/data1.json",
                method: 'get',
                dataType: "json",
                // data:json.data.dataList,
                cache: false, // 不缓存
                // height: getHeight(), // 设置高度，会启用固定表头的特性
                striped: true, // 隔行加亮
                pagination: true, // 开启分页功能
                search: false, // 开启搜索功能
                showColumns: false, // 开启自定义列显示功能
                showRefresh: false, // 开启刷新功能
                queryParams: queryParams,
                pageSize: json.pageSize, //每页的记录行数（*）
                minimumCountColumns: 2, // 设置最少显示列个数
                clickToSelect: true, // 单击行即可以选中
                uniqueId: "id", //每一行的唯一标识，一般为主键列
                sortName: 'id', // 设置默认排序为 name
                sortOrder: 'desc', // 设置排序为反序 desc
                columns: [{
                    field: 'sceneryId',
                    title: '景点编号',
                    align: 'center',
                    valign: 'middle',
                    sortable: true // 开启排序功能
                },{
                    field: 'sceneryName',
                    title: '景点名称',
                    align: 'center',
                    valign: 'middle',
                    formatter: operateFormatter,
                    events: window.operateEvents,
                }, {
                    field: 'sceneryOpenTime',
                    title: '开放时间',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }]
            });
            function operateFormatter(value, row, index) {
                return [
                    '<a href="#edit-modal-dialog" data-toggle="modal" class="edit" title="edit" href="javascript:void(0)">',
                    '修改',
                    '</a>  ',
                    '&nbsp;&nbsp;&nbsp;&nbsp;',
                    '<a href="#impower-modal-dialog" data-toggle="modal" class="impower" title="impower" href="javascript:void(0)">',
                    '授权',
                    '</a>  ',
                    '&nbsp;&nbsp;&nbsp;&nbsp;',
                    '<a class="remove" href="javascript:void(0)" title="Remove">',
                    '删除',
                    '</a>',
                ].join('');
            }
            function queryParams(params) {
                console.log(params);
                return {
                    pageSize: params.limit,
                    offset: params.offset,
                    roleName: $("#roleName").val(),
                    name: params.sort,
                    order: params.order
                };
            }
        }
        initTable(json);


    </script>
</body>
</html>
