<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<%@include file="/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("button.addCart").click(function () {
				var id = $(this).attr("bookid");
				// location.href="http://localhost:8080/book/cartServlet?action=addCart&id="+id;
				$.getJSON("<%=basePath%>cartServlet","action=AjaxAddCart&id="+id,function (date) {
					$("#CartTotalCount").html("您的购物车中有" + date.cartTotalCount + "件商品");
					$("#productName").html("您刚刚将<span style='color: red'>" + date.bookName + "</span>加入到了购物车中");
					// alert( date.cartTotalCount );
					// alert( date.bookName );
				});
			})
		})

	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">网上书城</span>
			<div>
				<c:if test="${empty sessionScope.user}">
				<a href="pages/user/login.jsp">登录</a> |
				<a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${not empty sessionScope.user}">
				<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临尚硅谷书城</span>
				<a href="<%=basePath%>orderServlet?action=queryMyOrder">我的订单</a>
				<a href="accountServlet?action=logout">注销</a>
				<a href="pages/cart/cart.jsp">购物车</a>
				</c:if>
				<a href="pages/manager/manager.jsp">后台管理</a>
			</div>
	</div>
	<div id="main">
		<div id="book">
			<div class="book_cond">
				<form action="client/bookServlet" method="get">
					<input type="hidden" name="action" value="pageByPrice">
					价格：<input id="min" type="text" name="min" value="${param.min}"> 元 -
						<input id="max" type="text" name="max" value="${param.max}"> 元
						<input type="submit" value="查询" />
				</form>
			</div>
			<div style="text-align: center">
				<c:if test="${not empty sessionScope.cart}">
				<span style="color: red" id="CartTotalCount">您的购物车中有${sessionScope.cart.totalCount}件商品</span>
				<c:if test="${not empty sessionScope.bookName}">
				<div id="productName">
					您刚刚将<span style="color: red" id="book_name">${sessionScope.bookName}</span>加入到了购物车中
				</div>
				</c:if>
				</c:if>
				<c:if test="${empty sessionScope.cart}">
					<span style="color: red" id="CartTotalCount">当前购物车没有商品</span>
					<div id="productName"> &nbsp; </div>
				</c:if>
			</div>
			<c:forEach items="${requestScope.page.item}" var="books">
			<div class="b_list">
				<div class="img_div">
					<img class="book_img" alt="" src="${books.img_path}" />
				</div>
				<div class="book_info">
					<div class="book_name">
						<span class="sp1">书名:</span>
						<span class="sp2">${books.name}</span>
					</div>
					<div class="book_author">
						<span class="sp1">作者:</span>
						<span class="sp2">${books.author}</span>
					</div>
					<div class="book_price">
						<span class="sp1">价格:</span>
						<span class="sp2">￥${books.price}</span>
					</div>
					<div class="book_sales">
						<span class="sp1">销量:</span>
						<span class="sp2">${books.sales}</span>

					</div>
					<div class="book_amount">
						<span class="sp1">库存:</span>
						<span class="sp2">${books.stock}</span>
					</div>
					<div class="book_add">
						<button class="addCart" bookid="${books.id}">加入购物车</button>
					</div>
				</div>
			</div>
			</c:forEach>


		</div>
		
		<%@include file="/common/page_nav.jsp"%>
	
	</div>
	
	<%@include file="/common/foot.jsp"%>
</body>
</html>