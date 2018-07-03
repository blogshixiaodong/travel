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
            <div class="row"><div class="col-sm-8 col-sm-offset-2">


                <div class="panel panel-default">
                    <div class="panel-heading">注册</div>
                    <div class="panel-body">
                        <form style='margin:0px' class='form-horizontal' id='register' >
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>用户名*</label>
                                <div class='col-xs-10'>
                                    <input type='text' class='form-control ' name='visitoraccount.accountId' id='visitoraccount.accountId'>
                                </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>密码*</label>
                                <div class='col-xs-10'>
                                    <input type='password' class='form-control ' name='vositoraccount.password' id='visitoraccount.password'>
                                 </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>密码重复*</label>
                                <div class='col-xs-10'>
                                    <input type='password' class='form-control ' name='vositoraccount.password1' id='vositoraccount.password1'>
                                </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>性别</label>
                            <div class='col-xs-10'>
                                <input type='text' class='form-control ' name='visitor.visitorGender' id='visitor.visitorGender'>
                            </div>
                            </div>
                            <div class='form-group row'>
                                <label  class='col-xs-2 control-label'>电话号码</label>
                                <div class='col-xs-10'>
                                    <input type='text' class='form-control ' name='visitor.visitorPhone' id='visitor.visitorPnone'>
                                </div>
                             </div>
                            <div class='form-group row'>
                            <label  class='col-xs-2 control-label'>出生年月</label>
                                <div class='col-xs-10'>
                                    <input  class='form-control ' name='visitor.visitorDate' id='visitor.visitorDate'>
                                </div>
                            </div>

                             <div class='form-group'>
                             <div class='col-xs-10 col-xs-offset-2'>
                                 <input  class="submit btn btn-default" type="submit" value="注册">
                                 <input  class="reset btn btn-default" type="reset" value="重置">
                             </div>
                             </div>
                        </form>
                    </div>
                </div>

                <script type="text/javascript">
                    $().ready(function() {
                        $.validator.addMethod("bsf",function(value,element,params){
                            if(params==false) return true;
                            for(var i=0;i<value.length;i++){
                                var c=value.charAt(i);
                                if(!((c>='a'&&c<='z')||(c>='A'&&c<='Z')||(c=='_')||(c>='0'&&c<='9'))){
                                    return false;
                                }
                            }
                            return true;
                        },"只能是字母数字和下划线");

                        $("#register").validate({
                            onfocusout: false,
                            rules: {
                                username: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 15,
                                    bsf:true,
                                    remote: {
                                        url: "module/usernamevalidate.jsp",     //后台处理程序
                                        type: "post",               //数据发送方式
                                        dataType: "json",           //接受数据格式
                                        data: {                     //要传递的数据
                                            username: function() {
                                                return $("#username").val();
                                            }
                                        }
                                    }
                                },
                                password: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 15
                                },
                                rpass: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 15,
                                    equalTo: "#password"
                                },
                                nick:{
                                    required: true,
                                    maxlength: 12
                                },
                                email: {
                                    required: false,
                                    email: true
                                },
                                school: {
                                    maxlength: 30
                                },
                                motto: {
                                    maxlength: 50
                                }
                            },
                            messages: {
                                nick: {
                                    required: "昵称不能为空",
                                    maxlength: "昵称最多只能有12个字符长度"
                                },
                                username: {
                                    required: "用户名不能为空",
                                    minlength: "用户名长度为5~15个字符",
                                    maxlength: "用户名长度为5~15个字符",
                                    remote:"用户名已经存在"
                                },
                                password: {
                                    required: "密码不能为空",
                                    minlength: "密码长度为5~15个字符",
                                    maxlength: "密码长度为5~15个字符"
                                },
                                rpass: {
                                    required: "重复密码不能为空",
                                    equalTo: "两次输入的密码不一致",
                                    minlength: "密码长度为5~15个字符",
                                    maxlength: "密码长度为5~15个字符"
                                },
                                email: "请输入一个合法的邮箱地址"
                            }
                        });
                    });
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
<script language="javascript">
    function Validate() {

        return true;
    }
</script>
</body>
</html>
