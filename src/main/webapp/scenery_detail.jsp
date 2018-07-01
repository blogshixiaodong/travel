<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <title>景点详细信息</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/scenery_detail.css" />
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
            <div class="panel panel-warning">
                <div class="panel-heading">
                   景点名称
                </div>
                <div class="panel-body">
                    <div >
                        <img src="statics/images/1.jpg" />
                    </div>
                    <hr />
                    <p>
                        大家好，欢迎大家访问CSDN博客开发组Blog。非常感谢大家这些年来对CSDN Blog的支持，为了更好的提高我们的服务质量和增加和用户的互动，我们特推出了博客开发组Blog，希望通过它能够获取用户对CSDN Blog平台、运营和发展的意见。大家对CSDN博客发展如果有什么好的意见也可以直接发信给我，我是CSDN的博客产品经理陈瑞江，电子邮件是crj AT csdn.net（请把AT换成@）。
                    </p>
                </div>
                <div class="panel-footer">
                    <front>
                        价格： 99￥
                    </front>
                    <front>
                        开放时间：2018-7-1
                    </front>
                    <div class="clearfix" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>

</body>
</html>
