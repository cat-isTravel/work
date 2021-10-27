<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <table class="table table-bordered">
            <thead>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>系院</th>
            <th>专业</th>
            <th>电话号码</th>
            <th>房间号</th>
            </thead>
            <tbody>
            <tr>
                <td>${sessionScope.user.num}</td>
                <td>${sessionScope.user.name}</td>
                <td>${sessionScope.user.gender}</td>
                <td>${sessionScope.user.faculties}</td>
                <td>${sessionScope.user.professional}</td>
                <td>${sessionScope.user.phonenum}</td>
                <td>${sessionScope.user.dormNum}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
