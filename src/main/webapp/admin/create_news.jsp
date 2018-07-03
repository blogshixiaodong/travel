<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/admin/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../vendors/admin/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="../module/css/common.css" />
    <link rel="stylesheet" href="../module/css/index.css" />
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <!-- left nav bar -->
            <jsp:include page="left.jsp" />
        </div>
        <jsp:include page="top-nav.jsp" />
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div style="margin-left: 30px"><h2>添加新闻</h2></div>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i
                                        class="fa fa-chevron-up"></i></a></li>
                                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-expanded="false"><i
                                        class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a></li>
                                        <li><a href="#">Settings 2</a></li>
                                    </ul></li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <form style="margin:0px" class="form-inline" action="news/createNews.action" method="post">
                        <div class="x_content">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group" style="margin-left: 30px">
                                    <div class="input-group date" >
                                       新闻标题：<input id="news.newsHeadLine" name="news.newsHeadLine" type="text" class="form-control" />
                                    </div>
                                    <div class="input-group date" >
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group date" >
                                            新闻内容：
                                            <div class="col-md-13 col-sm-12 col-xs-13">
                                                <textarea id="news.newsContent" name="news.newsContent" rows="8" class="resizable_textarea form-control"></textarea>
                                                <br/><br/>
                                                <button id="leaveInfoSubmit" type='button' class='btn btn-success btn-sm'>提交</button>
                                                <button id="leaveInfoReset" type='button' class='btn btn-success btn-sm'>重置</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->
        <jsp:include page="footer.jsp" />
    </div>
</div>
<!-- jQuery -->
<script src="../vendors/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/js/bootstrap.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="../vendors/admin/js/custom.min.js"></script>
<script src="../vendors/admin/js/common.js"></script>
<script type="text/javascript">

</script>
</body>
</html>