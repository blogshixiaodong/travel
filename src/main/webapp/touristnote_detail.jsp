<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>查看游记</title>
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
                    游记标题:<s:property value="#session.touristNote.touristNoteHeadLine" />
                    <front style="float: right;" >
                        <button id="returnBtn" class="btn btn-default btn-sm" type="submit">返回</button>
                    </front>
                </div>
                <div class="panel-body">
                    <hr />
                    <p>
                    <td><s:property value="#session.touristNote.touristNoteInfo" /></td>
                    </p>
                </div>
                <div class="panel-footer">
                    <front>
                        游记发表时间：<s:date name="#session.touristNote.touristNoteTime" format="yyyy-MM-dd"/>
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
        $("#returnBtn").click(function(){
           location.href = "touristnote.jsp";
        });

    </script>
</body>
</html>
