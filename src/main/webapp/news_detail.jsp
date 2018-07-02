<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/6/30
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
        <div class="panel panel-primary">
            <div class="panel-heading">
                旅游新闻
            </div>
            <div class="panel-body">
                <a href="news.jsp" >显示所有新闻</a>
            </div>

        </div>
    </div>

    <div class="row">
         <div class="panel panel-warning">
             <div class="panel-heading">
            新闻标题： <s:property value="#session.news.newsHeadLine" />
             </div>
             <div class="panel-heading">
                 新闻类型： <s:property value="#session.news.newsType" />
                 &nbsp&nbsp&nbsp
                 发表时间：<s:date name="#session.news.newsDate" format="yyyy-MM-dd"/>
             </div>
             <div class="panel-heading">
                 新闻内容： <s:property value="#session.news.newsContent" />
             </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="module/js/common/common.js"></script>
</body>
</html>
