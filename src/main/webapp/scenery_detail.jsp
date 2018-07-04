<%@ page import="com.fz.travel.bean.Scenery" %><%--
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
        <jsp:include page="statics/templates/nav.jsp"/>
        <div class="row">
            <div class="panel panel-warning">
                <div class="panel-heading">
                   景点名称:<s:property value="#session.scenery.sceneryName" />
                    <front style="float: right;" >
                        <button id="returnBtn" class="btn btn-default btn-sm" type="submit">返回</button>
                    </front>
                </div>

                <div class="panel-body">
                    <div style="display: inline; width: 40%">
                        <img id="sceneryImg" style="width: 60%"/>
                    </div>
                    <div style="display: inline;">
                        <s:property value="#session.scenery.sceneryIntroduce" />
                    </div>
                    <hr />

                </div>
                <div class="panel-footer">
                    <front>
                        价格： <s:property value="#session.scenery.sceneryPrice" />
                    </front>
                    <front>
                        开放时间：<s:property value="#session.scenery.sceneryOpenTime" />
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
    <script type="text/javascript">
        $(function(){
            var sceneryImg ="<%=((Scenery)session.getAttribute("scenery")).getSceneryPhoto()%>";
            var path = "images/getImage.action?name="+sceneryImg;
            $("#sceneryImg").attr('src',path);
        });

        $("#returnBtn").click(function(){
           location.href = "scenery.jsp";
        });
    </script>
</body>
</html>
