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
        <jsp:include page="statics/templates/nav.jsp"/>

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
                        <s:property value="scenery.sceneryid" />
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
