<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
    <style>
        a{
            text-decoration: none;
            cursor: pointer;
        }
    </style>
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
                <form>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="orderId" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="dorm_num" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单内容</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" rows="3" disabled="disabled" id="context"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <button type="button" class="btn btn-info" id="edit_all">
            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            一键处理</button>
    </div>
</div>
<div class="row" style="margin-top: 10px">
    <div class="col-md-12">
        <table class="table table-bordered" id="manager_order_table">
            <thead>
                <th><input type="checkbox" id="check_all"></th>
                <th>维修订单号</th>
                <th>需维修用户</th>
                <th>房间号</th>
                <th>处理状态</th>
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
        to_pageNum(1);
    })
    function to_pageNum(pn){
        $("#page_info").empty();
        $("#nav_page").empty();
        $("#manager_order_table tbody").empty();
        $.ajax({
            url:"getRequests",
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
    function bulid_table(result){
        $.each(result.extend.pageInfo.list,function (index,item) {
            var check_item_td = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            var order_td = $("<td></td>").append(item.orderid);
            var user_td = $("<td></td>").append(item.user);
            var dormNum_td = $("<td></td>").append(item.dormNum);
            var state_td = $("<td></td>");
            if(item.state == 0){
                state_td.append("未处理") ;
            }else {
                state_td.append("已处理") ;
            }
            var show_a = $("<a></a>").append("查看").attr("class","show_a");
            var edit_a = $("<a></a>").append("处理").attr("class","edit_a");
            var option_td = $("<td></td>").append(show_a).append(" ").append(edit_a);
            edit_PageNum = result.extend.pageInfo.pageNum;
            $("<tr></tr>")
                .append(check_item_td)
                .append(order_td)
                .append(user_td)
                .append(dormNum_td)
                .append(state_td)
                .append(option_td)
                .appendTo("#manager_order_table tbody");
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

    //全选和全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$("#check_all").prop("checked"));
    });
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    $(document).on("click",".show_a",function () {
        // alert($(this).parent().parent().find("td:eq(1)").text());
        getOrder($(this).parent().parent().find("td:eq(1)").text())
        $('#myModal').modal('show');
    });
    function getOrder(orderId){
        $("#context").empty();
        $.ajax({
            url:"ord/"+orderId,
            type:"GET",
            success:function (result) {
                bulid_OrderModel(result);
            }
        })
    }
    function bulid_OrderModel(result){
        $("#orderId").val(result.extend.order.orderid);
        $("#dorm_num").val(result.extend.order.dormNum);
        $("#context").append(result.extend.order.orderdescribe);
    }
    $(document).on("click",".edit_a",function () {
        var id = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("你确定要处理订单号为:"+id+"的维修服务么？")){
            $.ajax({
                url:"ord",
                type:"POST",
                data: "_method=PUT&orderid="+id,
                success:function (result) {
                    if (result.code == 100){
                        alert("成功");
                        to_pageNum(edit_PageNum);
                    }
                }
            })
        }
    });
    //一键处理按钮事件绑定
    $("#edit_all").click(function () {
        var orderIds = "";
        $.each($(".check_item:checked"),function (index, item) {
           orderIds = orderIds + $(this).parent().parent().find("td:eq(1)").text()+"-";
        });
        orderIds = orderIds.substring(0,orderIds.lastIndexOf("-"));
        // alert(orderIds);
        if (confirm("你确定处理【"+orderIds+"】这些订单号么")){
            $.ajax({
                url:"ord/"+orderIds,
                type:"POST",
                data:"_method=PUT",
                success:function (result) {
                    if (result.code == 100){
                        alert("成功");
                        to_pageNum(edit_PageNum);
                        $("#check_all").prop("checked",false);
                    }
                }
            })
        }
    });
</script>
</body>
</html>
