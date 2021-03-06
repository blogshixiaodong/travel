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

    <jsp:include page="statics/templates/nav.jsp"></jsp:include>
<%--    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                旅游新闻
            </div>
            <div class="panel-body">
                <a href="news.jsp" >显示所有新闻</a>
            </div>
        </div>
    </div>--%>

    <div class="row">
         <div class="panel panel-warning">
             <div class="panel-heading">
            新闻标题： <s:property value="#session.news.newsHeadLine" />
             <front style="float: right;" >
                 <button id="returnBtn" class="btn btn-default btn-sm" type="submit">返回</button>
             </front>
             <front style="margin-left: 30px" >
                 新闻类型： <s:property value="#session.news.newsType" />
             </front>
             <front style="margin-left: 30px">
                 发表时间：<s:date name="#session.news.newsDate" format="yyyy-MM-dd"/>
             </front>
             </div>
             <div class="panel-body">
                 <div class="panel-heading">

                 </div>
                 <p>
                      <s:property value="#session.news.newsContent" />
                 </p>
                 <div class="panel-footer">
                     <div class="clearfix" />
                 </div>
             </div>
         </div>
    </div>
</div>
<script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="module/js/common/common.js"></script>
<script type="text/javascript">
    $("#returnBtn").click(function(){
       location.href = "news.jsp";
    });

</script>
</body>
</html>
