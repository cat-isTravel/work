<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 15:54
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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form id="stu_order_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-9 col-sm-offset-1">
                            <input type="text" class="form-control" id="user" value="${sessionScope.user.num}" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 10px">
                        <label class="col-sm-3 control-label">申请房间号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="dormNum" value="${sessionScope.user.dormNum}" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                    <select class="form-control col-md-12" style="margin-bottom: 10px"name="ordertitle">
                        <option>床</option>
                        <option>门窗</option>
                        <option>厕所</option>
                        <option>电器</option>
                        <option>其他</option>
                    </select>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">详细内容</label>
                    <textarea class="form-control" rows="3"name="orderdescribe">
                    </textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_order">生成订单</button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <button type="button" class="btn btn-info" id="request_tea">
            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            维修申请</button>
    </div>
</div>
<div class="row" style="margin-top: 10px">
    <div class="col-md-12">
        <table class="table table-bordered" id="stu_request_table">
            <thead>
                <th>服务订单号</th>
                <th>用户名</th>
                <th>申请房间号</th>
                <th>服务关键词</th>
                <th>服务状态</th>
                <th>操作</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>
<div class="row" style="margin-top: 5px">
    <div class="col-md-4"><span id="page_info"></span></div>
    <div class="col-md-8">
        <nav aria-label="Page navigation" id="nav_page">

        </nav>
    </div>
</div>
<script>
    var edit_PageNum;
    $(function () {
        // alert(new Date());
        to_pageNum(1);
    });
    function to_pageNum(pn){
        $("#page_info").empty();
        $("#nav_page").empty();
        $("#tea_request_table tbody").empty();
        $.ajax({
            url:"getMyRequest/"+${sessionScope.user.dormNum},
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                // console.log(result);
                bulid_pageInfo(result);
                bulid_page_nav(result);
                bulid_table(result);
            }
        });
    }
    //tea_request_table
    function bulid_table(result){
        $.each(result.extend.pageInfo.list,function (index, item) {
            var orderId = $("<td></td>").append(item.orderid);
            var user = $("<td></td>").append(item.user);
            var dorm_num = $("<td></td>").append(item.dormNum);
            var orderTitle = $("<td></td>").append(item.ordertitle);
            var state = $("<td></td>");
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除")
            var del_td = $("<td></td>").append(delBtn);
            edit_PageNum = result.extend.pageInfo.pageNum;
            if (item.state == 0){
                state.append("未处理");
            }else {
                state.append("已处理");
            }
            $("<tr></tr>")
                .append(orderId)
                .append(user)
                .append(dorm_num)
                .append(orderTitle)
                .append(state)
                .append(del_td)
                .appendTo("#stu_request_table tbody")
        });
    }
    function bulid_pageInfo(result){
        $("#page_info").append("当前页码数为:"+result.extend.pageInfo.pageNum+" 总共有"+result.extend.pageInfo.pages+" 共有"+result.extend.pageInfo.total+"条记录");

    }
    function bulid_page_nav(result){
        var page_ul = $("<ul></ul>").attr("class","pagination");
        var page_last_a = $("<a></a>").append("上一页");
        var page_last_li = $("<li></li>").append(page_last_a);
        var to_one_a = $("<a></a>").append("&laquo;");
        var to_one_li = $("<li></li>").append(to_one_a);
        page_ul.append(page_last_li);
        page_ul.append(to_one_li);

        if (result.extend.pageInfo.pageNum == 1){
            page_last_li.addClass("disabled");
            to_one_li.addClass("disabled");
        }
        to_one_a.click(function () {
            to_pageNum(1);
        });
        page_last_a.click(function () {
            to_pageNum(result.extend.pageInfo.pageNum -1);
        });
        $.each(result.extend.pageInfo.navigatepageNums,function (index, item) {
            var item_a = $("<a></a>").append(item)
            var item_li = $("<li></li>").append(item_a);
            if (result.extend.pageInfo.pageNum == item){
                item_li.addClass("active");
            }
            item_a.click(function () {
                to_pageNum(item);
            });
            page_ul.append(item_li);
        });
        var to_last_a = $("<a></a>").append("&raquo;")
        var to_last_li = $("<li></li>").append(to_last_a);
        var next_a = $("<a></a>").append("下一页");
        var next_li = $("<li></li>").append(next_a);
        next_a.click(function () {
            to_pageNum(result.extend.pageInfo.pageNum + 1) ;
        });
        if (result.extend.pageInfo.pageNum == result.extend.pageInfo.pages){
            to_last_li.addClass("disabled");
            next_li.addClass("disabled");
        }
        page_ul.append(to_last_li).append(next_li).appendTo("#nav_page");
    }

    $("#request_tea").click(function () {
        $('#myModal').modal('show');
    });

    $("#stu_order").click(function () {
       // alert($("#tea_order_form").serialize());
        var user = $("#user").val();
        var dorm_num = $("#dormNum").val();
        $.ajax({
          url:"ord",
          type: "POST",
          data: $("#stu_order_form").serialize()+"&user="+user+"&dormNum="+dorm_num,
          success:function (result) {
            if (result.code == 100){
                alert("成功");
                to_pageNum(9999999);
                $('#myModal').modal('hide');
            }else {
                alert("失败");
            }
          }
        });

    });
    $(document).on("click",".delete_btn",function () {
        var orderId = $("#stu_request_table").parent().parent().find("td:eq(0)").text();
       if (confirm("你确定要删除订单号为 ："+orderId+"么?")){
           $.ajax({
               url:"ord",
               type:"POST",
               data:"_method=DELETE&orderId="+orderId,
               success:function (result) {
                   if (result.code == 100){
                       alert("成功");
                       to_pageNum(edit_PageNum)
                   }else {
                       alert("失败");
                   }
               }
           });
       }
    });
</script>
</body>
</html>
