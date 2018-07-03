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
                            <div style="margin-left: 30px"><h2>留言</h2></div>
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
                        <div class="row">


                        <table id="message" class="table table-striped table-hover"></table>
                    </div>
                </div>
            </div>
        </div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                回复
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group date" >
                                留言编号：<br>
                                <input id="updateMessageId" type="text" class="form-control" readonly="readonly"/>
                            </div>
                            <div class="input-group date" >
                                留言信息：<br>
                                <input id="updateMessageInfo" type="text" class="form-control" readonly="readonly"/>
                            </div>

                            <div class="form-group">
                                <div class="input-group date" >
                                    回复信息：
                                    <div class="col-md-13 col-sm-12 col-xs-13">
                                        <textarea id="updateReplyInfo" rows="8" class="resizable_textarea form-control" ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button id="updateBtn" type="button" class="btn btn-primary">
                                提交回复
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
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
<script src="../vendors/admin/js/custom.min.js"></script>
<script src="../vendors/admin/js/common.js"></script>
<script type="text/javascript" src="../vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="../module/js/common/common.js"></script>
<script type="text/javascript">
    //激活下拉列表
    $(".dropdown-toggle").dropdown();

    $(function() {
        var url = "../message/queryAllMessage.action";
        initTable($("#message"), url, queryParams, columns);
    });

    function queryParams(params){
        return {
            "pageContainer.pageSize": params.pageSize,
            "pageContainer.currentPageNo": params.pageNumber
        }
    }
    var  columns = [{
        field: 'messageId',
        title: '留言编号',
        align: 'center',
        valign: 'middle',
    },  {
        field: 'messageInfo',
        title: '留言内容',
        align: 'center',
        valign: 'middle',
    },  {
        field: 'messageTime',
        title: '留言时间',
        align: 'center',
        valign: 'middle',
        formatter: function(value, row, index) {
            return jsonDateToString(value);
        },
    },{
        field: 'replayInfo',
        title: '回复内容',
        align: 'center',
        valign: 'middle',
        formatter:function(value,row,index){
            if(value==null||value=="")
                return "暂无回复信息！";
            else
                return value;
        },
    },  {
        field: 'replayTime',
        title: '回复时间',
        align: 'center',
        valign: 'middle',
        formatter: function(value, row, index) {
            if(value==null||value=="")
                return "暂无回复信息！";
            else
                return jsonDateToString(value);
        },
    }, {
        //field: '删除',
        title: '操作',
        align: 'center',
        valign: 'middle',
        formatter: function(value, row, index) {
            return '<a href="../message/deleteMessageByMessageId?message.messageId='+row.messageId+ '">' + '删除'+ '</a>'+'     '+ '<a href="#" class=" updatebBtnGroup">'+"回复"+' </a>';
        }
    }];

    $('#message').on("click", ".updatebBtnGroup", function() {
        var messageId =  $(this).parent().parent().children().get(0).innerHTML;
        var messageInfo = $(this).parent().parent().children().get(1).innerHTML;
        var replayInfo = $(this).parent().parent().children().get(3).innerHTML;
        $("#updateMessageId").val(messageId)
        $("#updateMessageInfo").val(messageInfo)

        if(replayInfo =="暂无回复信息！"){
            $("#myModal").modal();
        }else{
            alert("已回复!");
        }
        return false;
    });

    $("#updateBtn").click(function(){
        $("#myModal").modal("hide");
        var messageId = $("#updateMessageId").val();
        var replyInfo = $("#updateReplyInfo").val();
        if(replyInfo==""||replyInfo==null){
            alert("回复信息不能为空！");
            return;
        }
        $.ajax({
            url: "../message/replyMessage.action",
            type: "post",
            data: {
                "message.messageId" : messageId,
                "message.replayInfo": replyInfo,
            },
            dataType: "json",
            success: function(responseText){
                alert(responseText);
                location.href = "../admin/message.jsp";
            }
        });
    });
</script>
</body>
</html>