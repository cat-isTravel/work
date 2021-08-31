<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
	<%@include file="/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("a.deleteItem").click(function () {
				return confirm("你确定删除"+$(this).parent().parent().find("td:first").text()+"么？");
			})
			$("a.clear").click(function () {
				return confirm("你确定清空购物车么？");
			})
			$("input.ItemCount").change(function () {
				var count = this.value;
				var bookId = $(this).attr("bookId");
				var bookName = $(this).parent().parent().find("td:first").text();
				if ( confirm("你确定修改"+ bookName +"数量为"+ count +"么") ){
					location.href = "<%=basePath%>cartServlet?action=updateItem&count="+count+"&bookId="+bookId
				}else {
					this.value = this.defaultValue;
				}
			})
		})
	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">购物车</span>
		<%@include file="/common/login_successed.jsp"%>
	</div>
	
	<div id="main">
	
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<c:if test="${not empty sessionScope.cart}">
				<c:forEach items="${sessionScope.cart.items}" var="item">
			<tr>
				<td>${item.value.name}</td>
				<td>
				<input type="text" value="${item.value.count}" style="width: 80px"class="ItemCount" bookId="${item.value.id}">
				</td>
				<td>${item.value.price}</td>
				<td>${item.value.totalPrice}</td>
				<td><a href="<%=basePath%>cartServlet?action=deleteItem&id=${item.value.id}" class="deleteItem">删除</a></td>
			</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty sessionScope.cart}">
				<td colspan="5"><a href="<%=basePath%>index.jsp">亲，当前还没有商品在购物车中</a></td>
			</c:if>
		</table>
		<c:if test="${not empty sessionScope.cart}">
		<div class="cart_info">
			<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
			<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
			<span class="cart_span"><a href="<%=basePath%>cartServlet?action=cleanCart&id=${item.value.id}" class="clear">清空购物车</a></span>
			<span class="cart_span"><a href="<%=basePath%>orderServlet?action=creatOrder">去结账</a></span>
		</div>
		</c:if>
	</div>

	<%@include file="/common/foot.jsp"%>
</body>
</html>