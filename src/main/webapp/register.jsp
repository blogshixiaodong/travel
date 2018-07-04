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

    <%--daterangepicker--%>
    <link href="vendors/daterangepicker/css/daterangepicker.css" rel="stylesheet">
    <link href="vendors/daterangepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/index.css" />

</head>
<body>
<div class="container">
    <!-- 导航栏部分 -->

    <jsp:include page="statics/templates/nav.jsp"/>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                旅游新闻
            </div>
            <div class="row"><div class="col-sm-8 col-sm-offset-2">


                <div class="panel panel-default">
                    <div class="panel-heading">注册</div>
                    <div class="panel-body">
                        <form style='margin:0px' class='form-horizontal' id='register' >
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>账号*</label>
                                <div class='col-xs-10'>
                                    <input type='text' class='form-control ' name='accountId' id='accountId'>
                                </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>密码*</label>
                                <div class='col-xs-10'>
                                    <input type='password' class='form-control ' name='password' id='password'>
                                 </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>密码重复*</label>
                                <div class='col-xs-10'>
                                    <input type='password' class='form-control ' name='password1' id='password1'>
                                </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>性别*</label>
                            <div class='col-xs-10'>
                                <input type='radio' name='visitorGender'  value="男">男
                                <input type='radio' name='visitorGender' value="女">女
                            </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>电话号码*</label>
                                <div class='col-xs-10'>
                                    <input type='text' class='form-control ' name='visitorPhone' id='visitorPhone'>
                                </div>
                             </div>
                            <div class='form-group row'>
                            <label  class='col-xs-2 control-label'>出生年月*</label>
                                <div class="input-group date" id="myDatepicker" style="position: relative">
                                    <input id="visitorDate" type="text" class="form-control" readonly="readonly"/>
				                            <span class="input-group-addon">
				                               <span class="glyphicon glyphicon-calendar"></span>
				                            </span>
                                </div>
                            </div>
                             <div class='form-group'>
                             <div class='col-xs-10 col-xs-offset-2'>
                                 <input  id="submit" class="submit btn btn-default" type="button" value="注册">
                                 <input  class="reset btn btn-default" type="reset" value="重置">
                             </div>
                             </div>
                        </form>
                    </div>
                </div>

                <script type="text/javascript">

                </script>
            </div></div>
        </div>
    </div>
    </div>
</div>

<script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="module/js/common/common.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="vendors/daterangepicker/js/moment.min.js"></script>
<script src="vendors/daterangepicker/js/daterangepicker.js"></script>
<script src="vendors/daterangepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script language="javascript">

    $(function() {
        $("#myDatepicker").daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            autoUpdateInput: false,
            timePicker24Hour: true,
            timePicker: false,
            "locale": {
                format: 'YYYY-MM-DD HH:mm',
            }
        },function(start,end,label){
            beginTimeTake = start;
            if(!this.startDate){
                $("#visitorDate").val("");
            }else{
                var date = this.startDate.format(this.locale.format);
                date = date.split(" ")[0];
                $("#visitorDate").val(date);
            }
        });
    });

    function Validate() {
        return true;
    }
    $("#submit").click(function(){
        var visitorGender = $('input[name="visitorGender"]').val();
        var accountId = $("#accountId").val();
        var password = $("#password").val();
        var password1 = $("#password1").val();
        var visitorPhone = $("#visitorPhone").val();
        var visitorDate = $("#visitorDate").val();
        if(visitorGender == "" || accountId == "" || password == "" || password1 == "" || visitorPhone == "" || visitorDate == ""){
            alert("请将信息填写完整");
            return;
        }
        if(password != password1){
            alert("两次密码不匹配");
            return;
        }
        if(!isPoneAvailable(visitorPhone) ){
            alert("电话号码格式错误");
            return;
        }
            $.ajax({
            url: "visitor/createVisitor.action",
            type: "post",
            data: {
                "visitor.visitorGender": visitorGender,
                "visitor.visitorPhone": visitorPhone,
                "visitor.visitorDate": visitorDate,
                "visitorAccount.accountId": accountId,
                "visitorAccount.password": password
            },
            dataType: "json",
            success: function(responseText){
                alert(responseText);
                location.href = "visitorLogin.jsp";
            }
        });
    });

    $("#accountId").blur(function(){
        var accountId = $("#accountId").val();
       if(!isNumberAvailable(accountId)){
           alert("账号由纯数字组成");
           return;
       }
        $.ajax({
            url: "visitorAccount/hasVisitorAccount",
            type: "post",
            data: {
                "visitorAccount.accountId": accountId
            },
            dataType: "json",
            success: function(responseText){
                if(!responseText == ""){
                    alert(responseText);
                }
            }
        });
    });

    function isNumberAvailable(number){
        var myreg = /^[0-9]*$/;
        if (!myreg.test(number)) {
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
