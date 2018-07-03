<%@ page import="com.fz.travel.bean.Visitor" %><%--
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

    <jsp:include page="statics/templates/nav.jsp"></jsp:include>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                旅游新闻
            </div>
            <div class="panel-body">

                        <form style="margin:0px" class="form-inline" action="message/createMessage.action" method="post" onsubmit="return Validate();">
                            留言：<br>
                            <textarea name="message.messageInfo" id="message.messageInfo" cols="100%" rows="5"></textarea><br>
                            <button id="submitCondition" type="submit" class="btn btn-default btn-sm">发表</button>
                        </form>

            </div>
            <table id="message" class="table table-striped table-hover"></table>
        </div>
    </div>

</div>

<script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="module/js/common/common.js"></script>
<script language="javascript">
    function Validate() {
        var messageInfo = document.getElementById("message.messageInfo");
        var visitor = <%=(Visitor)session.getAttribute("visitor")%>;
        alert(visitor.toString());
        if (messageInfo.value == null || messageInfo.value== "") {
            alert("请输入留言！");
            messageInfo.focus();

            return false;
        }
        if(visitor.toString()==null||visitor.toString()==""){
            alert("请登录！");

            return false;
        }

        return true;
    }
</script>
</body>
</html>
