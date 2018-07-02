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
               旅游新闻
            </div>
            <div class="panel-body">
                <front style="float: right">
                    <front style="float: right">
                        <form style="margin:0px" class="form-inline" action="DiscussList.jsp" method="get">
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">新闻标题</span>
                                    <input type="text" class="form-control" name="search" value="" />
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default btn-sm">查找</button>
                        </form>
                    </front>
                </front>
            </div>
            <table id="news" class="table table-striped table-hover"></table>
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
            url: "news/queryAllNews.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": 1,
                "pageContainer.pageSize": 5
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                createNewsTable(json);
            }
        });

    });

    function createNewsTable(json) {
        var tbody = $("#news tbody");
        tbody.html("");
        //创建表格

        for(var i = 0; i < json.rows.length; i++) {
            var news = json.rows[i];
            var tr = $("<tr></tr>");
            var newsId = $("<td></td>").html(news.newsId);
            var newsType = $("<td></td>").html(news.newsType);
            var newsDate = $("<td></td>").html(jsonDateToString(news.newsDate));
            var newsHeadLine = $("<td></td>").html(news.newsHeadLine);
            tr.append(newsId);
            tr.append(newsType);
            tr.append(newsDate);
            tr.append(newsHeadLine);
            tbody.append(tr);
        }
        //创建按钮组
        var btnGroup = $("#btnGroup");
        createBtnGroup(btnGroup, json);
    }

    $("#btnGroup").on("click", ".btn", function() {
        var pageNo = $(this).attr("pageNo");
        $.ajax({
            url: "news/queryAllNews.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": pageNo,
                "pageContainer.pageSize": 5
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                createNewsTable(json);
            }
        });
    });

    $("#submitCondition").click(function() {
        $("#btnGroup").html("");
        $("#news tbody").html("");
        var head = $("#headCondition").val();
        $.ajax({
            url: "news/queryNewsByNewsHeadLine.action",
            type: "post",
            data: {
                "pageContainer.currentPageNo": 1,
                "pageContainer.pageSize": 5,
                "news.newsHeadLine": head
            },
            dataType: "json",
            success: function(responseText) {
                var json = JSON.parse(responseText);
                console.log(json);
                createNewsTable(json);
            },
            error: function () {
                alert("error");
            }
        });
    })

</script>


</body>
</html>
