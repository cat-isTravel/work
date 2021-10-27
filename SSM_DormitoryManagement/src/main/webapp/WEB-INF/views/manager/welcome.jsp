<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
</script>

<style type="text/css">
body {
    width:100%;
    height:100%;
	background: url("images/bac.png");
	background-repeat:no-repeat;
  	background-size:100%;
}
.layui-table td{
	font-size: 20px;
}

td{
	background: linear-gradient(to left, orange, yellow, green, yellow, orange, orange, yellow, green, yellow, orange);
	color: transparent;
	-webkit-background-clip: text;
	animation: move 5s infinite;

	/*color: skyblue;*/
}
.font1{
    background: linear-gradient(to right, red, orange, yellow, green, yellow, orange, red, orange, yellow, green, yellow, orange, red);
    color: transparent;
    -webkit-background-clip: text;
    width: 300px;
    animation: move 5s infinite; 
}
@keyframes move {
      0% {background-position: 0 0;}
      100% {
        background-position: -300px 0;
      }
        }
        
.font2{
            font-size:22px;
            background-image: -webkit-linear-gradient(bottom, rgb(201, 115, 255), rgb(20, 11, 255));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

</style>


</head>
<body>
	<div title="欢迎使用"
		style="padding: 20px; overflow: hidden;">
		<p style="font-size: 30px; line-height: 60px; height: 60px; font-family: Microsoft Yahei" class="font1">欢迎您！</p>
		<p style="font-size: 25px; line-height: 30px; height: 30px;" class="font2">Welcome
			to the system!</p>

		<hr />
		<div class="layui-card-header"><a style="color:purple">系统信息</a></div>
		<table class="layui-table">
			<tbody>
			<col width="128" />
			<col />
			<tr>
				<td>系统名称</td>
				<td>宿舍管理系统</td>
			</tr>
			<tr>
				<td>系统环境</td>
				<td>Window 10</td>
			</tr>
			<tr>
				<td >开发工具</td>
				<td >IntelliJ IDEA 2021</td>
			</tr>
			<tr>
				<td>个人网站</td>
				<td>https://github.com/cat-isTravel </td>
			</tr>
			<tr>
				<td>开发者</td>
				<td>洪焕翔</td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td>519013474@qq.com</td>
			</tr>
			<tr>
				<td>Java版本</td>
				<td>JDK 1.8</td>
			</tr>
			<tr>
				<td>服务器</td>
				<td>Tomcat 9.0</td>
			</tr>
			<tr>
				<td>数据库</td>
				<td>MySQL 8.0</td>
			</tr>
			<tr>
				<td>系统采用技术</td>
				<td>Spring+SpringMVC+Mybatis+LayUI+Bootstrap+JQuery+Ajax</td>
			</tr>
			</tbody>
		</table>
</div>
</body>
</html>