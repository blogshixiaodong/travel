<%@ page import="org.springframework.web.bind.annotation.RequestMapping" %>
<%@ page import="com.fz.travel.bean.Hotel" %><%--
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
    <title>酒店详细信息</title>
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
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <front>
                        酒店名称 <s:property value="#session.hotel.hotelName" />
                    </front>
                    <front>
                        电话:<s:property value="#session.hotel.hotelPhone" />
                    </front>
                    <front>
                        地址:<s:property value="#session.hotel.hotelAddress" />
                    </front>
                        价格:<s:property value="#session.hotel.hotelPrice" /> 元/小时
                    <front style="float: right">
                        <button type="submit" class="btn btn-default btn-sm" onclick="window.location.href='visitor/destine_hotel.jsp' ">预定</button>
                    </front>
                </div>



                <div class="panel-body">
                    <div >
                        <img src="statics/images/1.jpg" />
                    </div>
                    <hr />
                    <p>
                        <s:property value="#session.hotel.hotelIntroduce" />
                    </p>
                </div>
                <div class="panel-footer">
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
