<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/2
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <title>线路详细信息</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/scenery_detail.css" />
</head>
<body>
    <div class="container">

        <!-- 导航栏部分 -->


        <jsp:include page="statics/templates/nav.jsp"></jsp:include>


        <div class="row">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    线路编号: <s:property value="#session.touristLine.touristLineId" />
                    <s:property value="#session.touristLine.lineScenerySe" />
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>景点编号</th>
                            <th>景点名称</th>
                            <th>门票价格</th>
                            <th>开放时间</th>
                        </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="#session.touristLine.lineScenerySet" status="i" var="lineScenery">
                                <tr>
                                    <td><s:property value="#lineScenery.scenery.sceneryId" /></td>
                                    <td><s:property value="#lineScenery.scenery.sceneryName" /></td>
                                    <td><s:property value="#lineScenery.scenery.sceneryPrice" /></td>
                                    <td><s:date name="#lineScenery.scenery.sceneryOpenTime" format="yyyy-MM-dd" /></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="module/js/common/common.js"></script>
</body>
</html>
