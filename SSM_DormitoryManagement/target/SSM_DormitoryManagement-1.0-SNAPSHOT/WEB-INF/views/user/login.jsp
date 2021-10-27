<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录系统</title>
  <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
  <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
  <style>
    body {
      background: url('https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg') no-repeat;
      background-size: 100% 130%;
    }

    #login_box {
      width: 20%;
      height: 400px;
      background-color: #00000060;
      margin: auto;
      margin-top: 10%;
      text-align: center;
      border-radius: 10px;
      padding: 50px 50px;
    }

    h2 {
      color: #ffffff90;
      margin-top: 5%;
    }

    #input-box {
      margin-top: 5%;
    }

    span {
      color: #fff;
    }

    input {
      border: 0;
      width: 60%;
      font-size: 15px;
      color: #fff;
      background: transparent;
      border-bottom: 2px solid #fff;
      padding: 5px 10px;
      outline: none;
      margin-top: 10px;
    }

    button {
      margin-top: 29px;
      width: 60%;
      height: 30px;
      border-radius: 10px;
      border: 0;
      color: #fff;
      text-align: center;
      line-height: 30px;
      font-size: 15px;
      background-image: linear-gradient(to right, #30cfd0, #330867);
      cursor: pointer;
    }
    #sign_up {
      margin-top: 45%;
      margin-left: 60%;
    }

    a {
      color: #b94648;
      cursor: crosshair;
    }
    .form-control {
      width: 71%;
      margin-left: 31px;
    }
  </style>
</head>

<body>
<div id="login_box">
  <h2>LOGIN</h2>
  <span style="color: red">${empty requestScope.msg?"":requestScope.msg}</span>
  <div id="input_box">

    <input type="text" placeholder="请输入用户名" id="login_user">
  </div>
  <div class="input_box">
    <input type="password" placeholder="请输入密码" id="login_psw">
  </div>
  <br>
  <select class="form-control" id="identity">
    <option>学生</option>
    <option>教职工</option>
    <option>管理员</option>
  </select>
  <button id="login_bt">登录</button><br>

</div>
<script>
  $(function () {

  });
  $("#login_bt").click(function () {
    var username = $("#login_user").val();
    var password = $("#login_psw").val();
    var identity = $("#identity").val();
    location.href = "http://localhost:8080/SSM_DormitoryManagement/login?username=" + username + "&password=" + password + "&identity=" + identity;

  })
</script>
</body>

</html>