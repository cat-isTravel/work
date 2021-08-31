<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>尚硅谷会员注册页面</title>
	<%@include file="/common/head.jsp"%>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
</style>

	<script type="text/javascript">
		$(function (){
			$("#sub_btn").click(function (even){
				var usernameText = $("#username").val();
				var usernamePart = /^\w{5,12}$/;
				if (!usernamePart.test(usernameText)){
					$("span.errorMsg").text("输入的用户名不合法");
					return false;
				}
				var passwordText = $("#password").val();
				var passwordPart = /^\w{5,12}$/;
				if (!passwordPart.test(passwordText)){
					$("span.errorMsg").text("输入的密码不合法");
					return false;
				}
				var repwdText = $("#repwd").val();
				if (repwdText != passwordText){
					$("span.errorMsg").text("两次输入的密码不一致");
					return false;
				}
				var emailText = $("#email").val();
				var emailPart = /^[a-zA-Z0-9_-]+ @[a-zA-Z0-9_-]+ \\. [a-zA-Z0-9_-]+$/;
				if (emailPart.test(emailText)){
					$("span.errorMsg").text("输入的邮箱不合法");
					return false;
				}
				var codeText = $("#code").val().trim();
				if (codeText == null || codeText == ""){
					$("span.errorMsg").text("验证码不能为空");
					return false;
				}
				$("span.errorMsg").text("")
			})
			$("#switchover_code").click(function () {
				this.src = "<%=basePath%>/kaptcha.jpg?d="+new Date();
			})
			$("#username").blur(function () {
				 var username = this.value ;
				$.getJSON("http://localhost:8080/book/accountServlet","action=ajaxRegistUser&username="+username,function (date) {
					if (date.username){
						$("span.errorMsg").text("用户已存在")
					}
					else {
						$("span.errorMsg").text("用户名可用")
					}
				});
			})
		})
	</script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册尚硅谷会员</h1>
								<span class="errorMsg">
									<%--<%=request.getAttribute("msg")==null?"请输入用户名和密码":request.getAttribute("msg")%>--%>
									${empty requestScope.msg?"请输入用户名和密码":requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="accountServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username"
										   value="${requestScope.username}"
									/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password"/>
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email"
										   value="${requestScope.email}"
									/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 150px;" id="code" name="code"/>
									<img alt="" src="<%=basePath%>/kaptcha.jpg" style="float: right; margin-right: 40px"width="90px" height="45px" id="switchover_code">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<%@include file="/common/foot.jsp"%>
</body>
</html>