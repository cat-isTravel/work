<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/26
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="user_modelAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addModel_form">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3" placeholder="UserName" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="OK_inputPassword" placeholder="Password" name="OkPsw">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_addModel_save">新增用户</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="user_modelUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="UpdateModel_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <label class="col-sm-2 control-label" id="update_username"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" placeholder="Password" name="OkPsw">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_updateModel_save">修改用户</button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <button type="button" class="btn btn-primary btn-sm" id="user_addBtn">
            <span class="glyphicon glyphicon-plus" aria-hidden="true">
            </span>
            新增
        </button>
        <button type="button" class="btn btn-danger btn-sm" id="user_deleteAllBtn">
            <span class="glyphicon glyphicon-trash" aria-hidden="true">
            </span>
            批量删除
        </button>
    </div>
</div>
<div class="row">
    <div class="col-md-12" style="margin-top: 10px">
        <table class="table table-bordered" id="user_table">
            <thead>
            <th><input type="checkbox" id="check_all"></th>
            <th>用户名</th>
            <th>密码</th>
            <th>操作</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-4"><span id="page_info"></span></div>
    <div class="col-md-8">
        <nav aria-label="Page navigation" id="nav_page">

    </nav>
    </div>
</div>
<script>
    var edit_pageNum = "";
    $(function () {
       to_pageNum(1);
    });
    function to_pageNum(pn){
        $("#user_table tbody").empty();
        $("#page_info").empty();
        $("#nav_page").empty();
        $.ajax({
            url:"getUsers",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                // console.log(result);
                bulid_table_user(result);
                bulid_pageInfo(result);
                bulid_page_nav(result);
            }
        });
    }
    function bulid_table_user(result){
        $.each(result.extend.pageInfo.list,function (index,item) {
            var check_td = $("<td></td>").append("<input type='checkbox' class='check_item'>").attr("item_id",item.id);
            var username_td = $("<td></td>").text(item.username);
            var password_td = $("<td></td>").text(item.password);
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit_id",item.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del_id",item.id);
            var btn_td = $("<td></td>").append(editBtn).append('&nbsp;&nbsp;').append(delBtn)
            $("<tr></tr>").append(check_td).append(username_td).append(password_td).append(btn_td).appendTo("#user_table tbody");
            edit_pageNum = result.extend.pageInfo.pageNum;
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
    //单个删除按钮
    $(document).on("click",".delete_btn",function () {
        var id = $(this).attr("del_id");
        if (confirm("你确定删除"+$(this).parent().parent().find("td:eq(1)").text()+"么?")){
            $.ajax({
                url:"User",
                data:"_method=DELETE&id="+id,
                type:"POST",
                success:function (result) {
                    if(result.code == 100){
                        alert("成功");
                        to_pageNum(edit_pagNum);
                    }
                }
            })
        }
    });
    $("#user_addBtn").click(function () {
        $('#user_modelAdd').modal({
            backdrop:true
        });
    });
    $("#user_addModel_save").click(function () {
       // alert($("#addModel_form").serialize());
       $.ajax({
           url:"User",
           type:"POST",
           data:$("#addModel_form").serialize(),
           success:function (result) {
               if (result.code == 100 ){
                   alert("成功");
                   $('#user_modelAdd').modal('hide')
                   to_pageNum(999999);
               }else {
                   alert("账号密码错误");
               }
           }
       })
    });
    //编辑按钮弹出模态框
    $(document).on("click",".edit_btn",function () {
        $("#update_username").empty();
        var id = $(this).attr("edit_id");
        $.ajax({
            url:"User/"+id,
            type:"GET",
            success:function (result) {
               $("#update_username").append(result.extend.user.username);
            }
        });
        $("#user_modelUpdate").modal('show');
    });
    //编辑模态框保存按钮
    $("#user_updateModel_save").click(function () {
       $.ajax({
           url:"User",
           type:"POST",
           data:$("#UpdateModel_form").serialize()+"&_method=PUT",
           success:function (result) {
               if(result.code == 100){
                   alert("成功");
                   to_pageNum(edit_pageNum);
               }else {
                   alert("两次输入密码不一致");
               }
           }
       })
    });
    //删除全部
    $("#user_deleteAllBtn").click(function () {
        var ids = "";
        var name = "";
        $.each($(".check_item:checked"),function (index, item) {
            name = name + $(this).parent().parent().find("td:eq(1)").text()+",";
            ids =  ids + $(this).parent().attr("item_id")+"-";
        });
        name = name.substring(0,name.lastIndexOf(","));
        ids = ids .substring(0,ids.lastIndexOf("-"));
        // alert(name);
        // alert(ids);
        if (confirm("你确定要删除【"+name+"】这些么？")){
            $.ajax({
                url:"User",
                type:"POST",
                data:"_method=DELETE&ids="+ids,
                success:function (result) {
                    if (result.code == 100){
                        alert("成功");
                        to_pageNum(edit_pageNum);
                        $("#check_all").prop("checked",false);
                    }else {
                        alert("删除失败");
                    }
                }
            });
        }
    });
</script>
</body>
</html>
