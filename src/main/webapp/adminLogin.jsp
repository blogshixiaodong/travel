<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Signin Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.min.css" >
    <!-- Custom styles for this template -->
    <link href="vendors/login/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <form class="form-signin" method="POST">
      <h1 class="h3 mb-3 font-weight-normal">Admin Sign In</h1>
        <label for="inputAccount" class="sr-only">Account</label>
        <input type="text" id="inputAccount" name="accountId" class="form-control" placeholder="Account" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">admin Sign in</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript">
      $("#submit").click(function(){
        var accountId = $("#inputAccount").val();
        var password = $("#inputPassword").val();
        $.ajax({
          url: "adminAccount/adminLoginCheck.action",
          type: "post",
          data: {
            "accountId": accountId,
            "password": password
          },
          dataType: "json",
          success: function(msg){
            if(msg == ""){
              location.href = "./index.jsp";
              return;
            }
            alert("登录失败");
            location.href = "./adminLogin.jsp";
          }
        });
        return false;
      });
    </script>
  </body>
</html>