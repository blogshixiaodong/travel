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
                            <li><a href="introduce.jsp">福州介绍</a></li>
                            <li><a href="scenery.jsp">福州景点</a></li>
                            <li><a href="touristline.jsp">旅游线路</a></li>
                            <li><a href="touristnote.jsp">旅游游记</a></li>
                            <li><a href="#">旅游新闻</a></li>
                            <li><a href="hotel.jsp">周边酒店</a></li>
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
                    <front style="float: right">
                        <front style="float: right">
                            <form style="margin:0px" class="form-inline">
                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-addon">名称</span>
                                        <input id="nameCondition" type="text" class="form-control" value="" />
                                    </div>
                                </div>
                                <button id="submitCondition" type="button" class="btn btn-default btn-sm">查找</button>
                            </form>
                        </front>
                    </front>
                </div>
                <table id="scenerys" class="table table-striped table-hover"></table>
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
        var columns = [{
            field: 'sceneryId',
            title: '景点编号',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'sceneryName',
            title: '景点名称',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return '<a href="scenery/querySceneryBySceneryId.action?scenery.sceneryId=' + row.sceneryId + '">' + value + '</a>';
            }
        }, {
            field: 'sceneryPrice',
            title: '门票价格',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'sceneryOpenTime',
            title: '开放时间',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return jsonDateToString(value);
            }
        }];
        var url = "scenery/queryAllScenery.action";
        var queryParams = function(params) {
            return {
                "pageContainer.pageSize": params.pageSize,
                "pageContainer.currentPageNo": params.pageNumber,
            };
        };
        $(function() {

            initTable($("#scenerys"), url, queryParams, columns);

        });

        $("#submitCondition").click(function() {
            var name = $("#nameCondition").val();
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                    "scenery.sceneryName": name
                }
            };
            var url = "scenery/querySceneryBySceneryName.action"
            initTable($("#scenerys"), url, queryParams, columns);
            return false;
        });

    </script>
</body>
</html>
