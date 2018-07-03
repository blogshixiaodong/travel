<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布旅游线路</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/admin/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../vendors/admin/css/custom.min.css" rel="stylesheet">
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
                                <h2>所有课程</h2>
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
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 col-xs-12 form-group" style="margin-left: 30px">
                                        <div class="input-group" >
                                            线路价格：<input id="hotelName" type="text" class="form-control" />
                                        </div>
                                        <div class="input-group date" >
                                            酒店地址：<input id="hotelAddress" type="text" class="form-control" />
                                        </div>
                                        <div class="input-group date" >
                                            酒店电话：<input id="hotelPhone" type="text" class="form-control" />
                                        </div>
                                        <div class="input-group date" >
                                            酒店价格：<input id="hotelPrice" type="text" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group date" >
                                                酒店介绍：
                                                <div class="col-md-13 col-sm-12 col-xs-13">
                                                    <textarea id="hotelIntroduce" rows="8" class="resizable_textarea form-control" placeholder="具体酒店介绍..."></textarea>
                                                    <br/><br/>
                                                    <button id="leaveInfoSubmit" type='button' class='btn btn-success btn-sm'>提交</button>
                                                    <button id="leaveInfoReset" type='button' class='btn btn-success btn-sm'>重置</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        //入口函数
        //$(sendAjax(1));

        function sendAjax(currentPage){
            $.ajax({
                url:"allCourses.action",
                type:"post",
                data:{
                    "pageContainer.currentPageNo":currentPage
                },
                dataType:"json",

                success: function(responseText){
                },
                error: function(data){
                }
            });
        }
        $("#btnGroup").on('click','.btn',function(){
            var pageNo = $(this).attr('pageNo');
            sendAjax(pageNo);
        });
    </script>
</body>
</html>