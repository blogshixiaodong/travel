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
                        <li><a href="#">旅游线路</a></li>
                        <li><a href="touristnote.jsp">旅游游记</a></li>
                        <li><a href="news.jsp">旅游新闻</a></li>
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
                                <li><a href="message_add.jsp">游客登陆</a></li>
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
    $(function() {
        $.ajax({
            url: "touristNote/findTouristNoteList.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": 1,
                "pageContainer.pageSize": 5
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                createTouristNoteTable(json);
            }
        });

    });

    function createTouristNoteTable(json) {
        var tbody = $("#touristnote tbody");
        tbody.html("");
        //创建表格
        for(var i = 0; i < json.rows.length; i++) {
            var touristNote = json.rows[i];
            var tr = $("<tr></tr>");
            var touristNoteId = $("<td></td>").html(touristNote.touristNoteId);
            var touristNoteHeadLine = $("<td></td>").html(touristNote.touristNoteHeadLine);
            var touristNoteTime = $("<td></td>").html(jsonDateToString(touristNote.touristNoteTime));
            var visitorId = $("<td></td>").html(touristNote.visitor.visitorId);
            tr.append(touristNoteId);
            tr.append(touristNoteHeadLine);
            tr.append(touristNoteTime);
            tr.append(visitorId);
            tbody.append(tr);
        }
        //创建按钮组
        var btnGroup = $("#btnGroup");
        createBtnGroup(btnGroup, json);
    }

    $("#btnGroup").on("click", ".btn", function() {
        var pageNo = $(this).attr("pageNo");
        $.ajax({
            url: "touristNote/findTouristNoteList.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": pageNo,
                "pageContainer.pageSize": 5
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                createTouristNoteTable(json);
            }
        });
    });

    $("#submitCondition").click(function() {
        $("#btnGroup").html("");
        $("#touristnote tbody").html("");
        var head = $("#headCondition").val();
        $.ajax({
            url: "touristNote/findTouristNoteListByHeadLine.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": 1,
                "pageContainer.pageSize": 5,
                "touristNote.touristNoteHeadLine": head
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                console.log(json);
                createTouristNoteTable(json);
            },
            error: function () {
                alert("error");
            }
        });
    })

</script>
</body>
</html>
