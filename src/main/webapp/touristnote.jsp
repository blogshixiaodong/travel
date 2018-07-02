<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游游记</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
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
                            <li><a href="news.jsp">旅游新闻</a></li>
                            <li><a href="hotel.jsp">周边酒店</a></li>


                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    留言
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">


                                    <li><a href="message_add.jsp">我要留言</a></li>
                                    <li><a href="message.jsp">留言查看</a></li>



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
                                    <li><a href="visitorLogin.jsp">游客登陆</a></li>
                                    <li><a href="adminLogin.jsp">管理员登陆</a></li>
                                </ul>
                            </li>
                            <li><a href="#">注册</a></li>
                        </ul>
                    </div>

                </div>
            </nav>
        </div>
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    游记列表
                </div>

                </div>
            </nav>
        </div>

                <div class="panel-body">
                    <front style="float: right">
                        <front style="float: right">
                            <form style="margin:0px" class="form-inline">
                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-addon">游记标题</span>
                                        <input id="headCondition" type="text" class="form-control" name="search" value="" />
                                    </div>
                                </div>
                                <button id="submitCondition" type="submit" class="btn btn-default btn-sm">查找</button>
                            </form>
                        </front>
                    </front>
                </div>
                <table id="touristnote" class="table table-striped table-hover"></table>
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
            field: 'touristNoteId',
            title: '游记编号',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'touristNoteHeadLine',
            title: '标题',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return '<a href="touristNote/findTouristNoteById.action?touristNote.touristNoteId=' + row.touristNoteId + '">' + value + '</a>';
            }
        }, {
            field: 'touristNoteTime',
            title: '发表时间',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return jsonDateToString(value);
            },
        }, {
            field: 'visitor.visitorId',
            title: '作者',
            align: 'center',
            valign: 'middle',

        }];

        $(function() {
            var url = "touristNote/findTouristNoteList.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber
                }
            };
            initTable($("#touristnote"), url, queryParams, columns);
        });

        $("#submitCondition").click(function() {
            var head = $("#headCondition").val();
            var urls = "touristNote/findTouristNoteListByHeadLine.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                    "touristNote.touristNoteHeadLine": head
                }
            };
            initTable($("#touristnote"), urls, queryParams, columns);
            return false;
        });
    </script>
</body>
</html>
