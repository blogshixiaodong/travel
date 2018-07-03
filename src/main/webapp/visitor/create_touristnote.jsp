<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/2
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布游记</title>
    <link rel="stylesheet" href="../vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../module/css/common.css" />
</head>
<body>
    <div class="container">
        <jsp:include page="../statics/templates/nav.jsp"></jsp:include>

        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    编辑游记
                </div>
                <div class="panel-body">
                    <form role="form" action="../touristNote/createTouristNote.action" method="post">
                        游记标题：
                        <div class="form-group">
                            <textarea name="touristNote.touristNoteHeadLine" class="form-control" rows="1" cols="50"></textarea>
                        </div>
                        正文内容：
                        <div class="form-group">
                            <textarea name="touristNote.touristNoteInfo" class="form-control" rows="20" cols="50"></textarea>
                        </div>
                        <div class="form-group" style="float: right">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">保存</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript" src="../vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $("#submitTouristNote").click(function() {

        });

    </script>
</body>
</html>
