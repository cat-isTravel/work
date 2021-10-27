<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/27
  Time: 15:06
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
<div class="modal fade" id="tea_modelAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addModel_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tea_addModel_num" placeholder="num" name="num">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tea_addModel_name" placeholder="name" name="name">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="gender" id="optionsRadios1" value="男" checked>
                                    男
                                </label>
                                <label>
                                    <input type="radio" name="gender" id="optionsRadios2" value="女">
                                    女
                                </label>
                            </div>


                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属系院</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="faculties" id="tea_faculties">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="phoneNum" name="phonenum" id="tea_addModel_phoneNum">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">宿舍号</label>
                        <div class="col-sm-3">
                            <select class="form-control">
                                <option>C栋</option>
                                <option>D栋</option>
                                <div class="col-sm-6" style="float: left">
                                    <input type="text" class="form-control" id="add_hourseN_tea" placeholder="宿舍号" name="dormNum">
                                    <span  class="help-block"></span>
                                </div>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="tea_addModel_save">新增用户</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="tea_modelUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateModel_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10 disabled">
                            <input type="text" class="form-control" id="tea_updateModel_num"  name="num" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tea_updateModel_name" placeholder="name" name="name">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="gender" value="男" checked>
                                    男
                                </label>
                                <label>
                                    <input type="radio" name="gender" value="女">
                                    女
                                </label>
                            </div>


                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属系院</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="faculties" id="update_tea_faculties">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="phoneNum" name="phonenum" id="tea_updateModel_phoneNum">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">宿舍号</label>
                        <div class="col-sm-3">
                            <select class="form-control">
                                <option>C栋</option>
                                <option>D栋</option>
                                <div class="col-sm-6" style="float: left">
                                    <input type="text" class="form-control" id="update_hourseN_tea" placeholder="宿舍号" name="dormNum">
                                    <span  class="help-block"></span>
                                </div>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="tea_updateModel_save">编辑用户</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <button type="button" class="btn btn-primary btn-sm" id="tea_addBtn">
            <span class="glyphicon glyphicon-plus" aria-hidden="true">
            </span>
            新增
        </button>
        <button type="button" class="btn btn-danger btn-sm" id="tea_deleteAllBtn">
            <span class="glyphicon glyphicon-trash" aria-hidden="true">
            </span>
            批量删除
        </button>
    </div>
</div>
    <div class="row" style="margin-top: 10px">
        <div class="col-md-12">
        <table class="table table-bordered"id="tea_table">
            <thead>
            <th><input type="checkbox" id="check_all"></th>
            <th>工号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>所属系院</th>
            <th>电话号码</th>
            <th>宿舍号</th>
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
    var edit_pageNum;
    $(function () {
        to_pageNum(1);
    });
    function to_pageNum(pn){
        $("#tea_table tbody").empty();
        $("#page_info").empty();
        $("#nav_page").empty();
        $.ajax({
            url:"teas",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                bulid_pageInfo(result);
                bulid_page_nav(result);
                bulid_tea_table(result);
            }
        });
    }
    function bulid_tea_table(result){
        $.each(result.extend.pageInfo.list,function (index, item) {
            var check_item_td = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            var num_td = $("<td></td>").append(item.num);
            var name_td = $("<td></td>").append(item.name);
            var gender_td = $("<td></td>").append(item.gender);
            var faculties_td = $("<td></td>").append(item.faculties);
            var phonenum_td = $("<td></td>").append(item.phonenum);
            var dormNum_td = $("<td></td>").append(item.dormNum);
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-num",item.num);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            btnTd.append(editBtn).append("&nbsp;&nbsp;").append(delBtn);
            $("<tr></tr>")
                .append(check_item_td)
                .append(num_td)
                .append(name_td)
                .append(gender_td)
                .append(faculties_td)
                .append(phonenum_td)
                .append(dormNum_td)
                .append(btnTd)
                .appendTo("#tea_table tbody")
        });
        edit_pageNum = result.extend.pageInfo.pageNum;
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

    $("#tea_addBtn").click(function () {
        bulid_college_tea("#tea_faculties");
       $("#tea_modelAdd").modal('show');
    });
    function bulid_college_tea(ele){
        $(ele).empty();
        $.ajax({
            url:"col",
            type:"GET",
            success:function (result) {
               $.each(result.extend.colleges,function (index, item) {
                   var option = $("<option></option>").append(item.college);
                   $(ele).append(option);
               });
            }
        });
    }
    //添加模态框保存按钮
    $("#tea_addModel_save").click(function () {
       // alert($("#addModel_form").serialize());
        if (!numTest("#tea_addModel_num")){
            return false;
        }
        if (!nameTest_form("#tea_addModel_name")){
            return false;
        }
        if (!numberTest_form("#tea_addModel_phoneNum")){
            return false;
        }
        if (!dormNum_test("#add_hourseN_tea")){
            return false;
        }
        $.ajax({
            url:"teas",
            type:"POST",
            data:$("#addModel_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("成功");
                    $('#tea_modelAdd').modal('hide');
                    to_pageNum(99999);
                }else {
                    alert("错误");
                    show_validate_msg("#add_hourseN_tea","error",result.msg);
                }
            }
        });
    });
/*



 **/

    //表单校验方法
    function numTest(ele){
        var num = $(ele).val();
        var num_test = /^[a-z][0-9]{5}$/;
        if (num_test.test(num)){
            show_validate_msg(ele, "success", "");
        }else {
            show_validate_msg(ele, "error", "工号格式错误");
            return false;
        }
        return true;
    }
    function nameTest_form(ele){
        var name = $(ele).val();
        var name_test = /^[\u4e00-\u9fa5]{2,4}$/;
        if (name_test.test(name)){
            show_validate_msg(ele, "success", "");
        }else {
            show_validate_msg(ele, "error", "姓名格式错误");
            return false;
        }
        return true;
    }
    function numberTest_form(ele){
        var phoneNum = $(ele).val();
        var phoneNum_test = /^[1][3,4,5,7,8,9][0-9]{9}$/;

        if (!phoneNum_test.test(phoneNum)) {
            show_validate_msg(ele, "error", "联系方式输入错误");
            return false;
        } else {
            show_validate_msg(ele, "success", "联系方式输入正确");
        }
        return true;
    }
    function dormNum_test(ele){
        var dorm_num = $(ele).val();
        var dorm_num_test = /^[3,4][1,2,3,4][0][1-9]$/
        if (dorm_num_test.test(dorm_num)){
            show_validate_msg(ele, "success", "");
        }else {
            show_validate_msg(ele, "error", "查不到该宿舍号");
            return false;
        }
        return true;
    }
    //表单校验状态结束。
    function show_validate_msg(ele,status,msg){
        $(ele).next("span").text("");
        $(ele).parent().removeClass("has-success has-error");
        if (status == "success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //单个删除按钮
    $(document).on("click",".delete_btn",function () {
        var tea_num = $(this).parent().parent().find("td:eq(1)").text();
       if (confirm("你确定删除工号为"+tea_num+"的么？")){
           $.ajax({
               url:"teas",
               type:"POST",
               data:"_method=DELETE&num="+tea_num,
               success:function (result) {
                   if (result.code == 100){
                       alert("成功");
                       to_pageNum(edit_pageNum);
                   }
               }
           });
       }
    });

    //编辑按钮功能实现
    $(document).on("click",".edit_btn",function () {
        var num = $(this).attr("edit-num");
        getTea(num);
        bulid_college_tea("#update_tea_faculties");
        $("#tea_modelUpdate").modal('show');
    });
    //编辑模态框回显信息
    function getTea(num){
        $.ajax({
            url:"teas/"+num,
            type:"GET",
            success:function (result) {
                console.log(result);
                bulid_tea_ModelUpdate(result);
            }
        });
    }
    function bulid_tea_ModelUpdate(result){
        $("#tea_updateModel_num").val(result.extend.tea.num);
        $("#tea_updateModel_name").prop("placeholder",result.extend.tea.name);
        $("#tea_updateModel_phoneNum").prop("placeholder",result.extend.tea.phonenum);
        $("#update_hourseN_tea").prop("placeholder",result.extend.tea.dormNum);
    }

    //编辑模态框保存按钮
    $("#tea_updateModel_save").click(function () {
        // alert($("#updateModel_form").serialize());
        $("#tea_h")
        if (!nameTest_form("#tea_addModel_name")){
            return false;
        }
        if (!numberTest_form("#tea_updateModel_phoneNum")){
            return false;
        }
        if(!dormNum_test("#update_hourseN_tea")){
            return false;
        }
        var num = $("#tea_updateModel_num").val();
       $.ajax({
           url:"teas",
           type:"POST",
           data:$("#updateModel_form").serialize()+"&num="+num+"&_method=PUT",
           success:function (result) {
              if(result.code == 100){
                  alert("成功");
                  $("tea_modelUpdate").modal('hide');
                  to_pageNum(edit_pageNum);
              }else {
                  show_validate_msg("#update_hourseN_tea","error",result.msg);
              }
           }
       })
    });
</script>
</body>
</html>
