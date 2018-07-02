<%@ page import="com.fz.travel.bean.Hotel" %><%--
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
    <link rel="stylesheet" href="../vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="../module/css/common.css" />
    <link rel="stylesheet" href="../module/css/index.css" />
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
                            <li><a href="../introduce.jsp">福州介绍</a></li>
                            <li><a href="../scenery.jsp">福州景点</a></li>
                            <li><a href="#">旅游线路</a></li>
                            <li><a href="../touristnote.jsp">旅游游记</a></li>
                            <li><a href="#">旅游新闻</a></li>
                            <li><a href="../hotel.jsp">周边酒店</a></li>
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
                    预定酒店订单
                </div>
                <div class="panel-body">
                    <front style="float: left">
                        <front style="float: left">
                            <form style="margin:0px" class="form-inline">
                                <div class="panel-heading">
                                    <front style="margin-left: 30px">
                                        酒店名称 <s:property value="#session.hotel.hotelName" />
                                    </front>
                                    <front style="margin-left: 30px">
                                        电话:<s:property value="#session.hotel.hotelPhone" />
                                    </front>
                                    <front style="margin-left: 30px">
                                        地址:<s:property value="#session.hotel.hotelAddress" />
                                    </front>
                                    <front style="margin-left: 30px">
                                        价格:<s:property value="#session.hotel.hotelPrice" /> 元/小时
                                    </front>
                                    <front style="margin-left: 30px">
                                        支付流水号:<input type = "text">
                                    </front>
                                    <front>
                                        <button class="btn btn-default btn-sm" style="margin-left: 30px" id="submit">确认提交</button>
                                    </front>
                                </div>
                            </form>
                        </front>
                    </front>
                </div>
                <table id="hotels" class="table table-striped table-hover"></table>
            </div>
        </div>
    </div>

    <script src="http://apps.bdimg.com/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="../module/js/common/common.js"></script>
    <script type="text/javascript">

        //激活下拉列表
        $(".dropdown-toggle").dropdown();

        $("#submit").click(function(){
            var hotelId = "<%=((Hotel)session.getAttribute("hotel")).getHotelId() %>";
            $.ajax({
               url: "../hotel/createVisitorHotel.action",
               type: "post",
               data: {
                   "hotel.hotelId": hotelId
               },
               dataType: "json",
               success: function(){
                   alert("预定成功");
                   location.href = "../index.jsp";
               }
            });
            return false;
        });
    </script>
</body>
</html>
