<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/2
  Time: 8:35
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
</div>
</body>
</html>
