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



        <jsp:include page="statics/templates/nav.jsp"></jsp:include>

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
