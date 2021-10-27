<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>宿舍管理系统</title>
  <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
  <link type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
  <style>

    *{
      margin: 0;
      padding: 0;
    }
    .nav{
      float: left;
      margin: 20px 30px 0px 30px;
      width: 200px;
      text-align: center;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-image: linear-gradient(to bottom,#fff,#f5f5f5);
    }
    .nav a{
      display: block;
      width: 100%;
      height: 40px;
      line-height: 40px;
      text-decoration: none;
      color: #000;

    }
    .nav a:hover{
      color: #fff;
      background-color: #408ccb;
    }
    /*.content{*/
    /*  float: left;*/
    /*  margin: 20px 30px 0px 10px;*/
    /*  width: 1200px;*/
    /*  height: 600px;*/
    /*}*/
    input{
      height: 28px;
      border-radius: 5px;
    }
  </style>

</head>
<body>
<%--添加模态框开始--%>
<div class="modal fade" id="myModal_stu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="height: 800px">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">学生新增</h4>
      </div>
      <div class="modal-body">
<%--        添加表单开始--%>
  <form class="form-horizontal" id="stu_form">
    <div class="form-group">
      <label for="addStu_num" class="col-sm-2 control-label">学号</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="addStu_num" placeholder="学号" name="num">
        <span  class="help-block"></span>
      </div>
    </div>
    <div class="form-group">
      <label for="addStu_name" class="col-sm-2 control-label">姓名</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="addStu_name" placeholder="姓名" name="name">
        <span  class="help-block"></span>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">性别</label>
      <div class="radio col-sm-3">
        <label>
          <input type="radio" name="gender" id="optionsRadios1" value="男" checked="checked">
         男
        </label>
      </div>
      <div class="radio">
        <label>
          <input type="radio" name="gender" id="optionsRadios2" value="女">
          女
        </label>
      </div>
    <br>
      <div class="form-group">
        <label class="col-sm-2 control-label">年级</label>
          <div class="col-sm-3">
            <select class="form-control" name="grade" id="stu_grade">
              <option grade_num="2017">2017</option>
              <option grade_num="2018">2018</option>
              <option grade_num="2019">2019</option>
              <option grade_num="2020">2020</option>
              <option grade_num="2021">2021</option>
              <option grade_num="2022">2022</option>
            </select>
          </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">学院</label>
        <div class="col-sm-3">
          <select class="form-control" id="stu_college" name="faculties">

          </select>
        </div>
        <label class="col-sm-2 control-label">专业</label>
        <div class="col-sm-4">
          <select class="form-control" id="stu_major" name="professional">

          </select>
        </div>
      </div>
      <div class="form-group">
        <label for="addStu_number" class="col-sm-2 control-label">电话</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" id="addStu_number" placeholder="电话" name="phonenum">
          <span  class="help-block"></span>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">宿舍号</label>
        <div class="col-sm-3">
          <select class="form-control"name="stratum">
            <option>A栋</option>
            <option>B栋</option>
            <div class="col-sm-6" style="float: left">
              <input type="text" class="form-control" id="hourseN_stu" placeholder="宿舍号" name="dormNum">
              <span  class="help-block"></span>
            </div>
          </select>
        </div>
        </div>
      </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      <button type="button" class="btn btn-primary" id="stu_save">保存数据</button>
    </div>

  </form>
<%--        添加表单结束--%>
      </div>

    </div>
  </div>
</div>
<%--添加模态框结束--%>
<%--修改模态框开始--%>
<div class="modal fade" id="myModal_stu1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="height: 800px">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel1">学生修改</h4>
      </div>
      <div class="modal-body">
        <%--        修改表单开始      --%>
        <form class="form-horizontal" id="stu_form_update">
          <div class="form-group">
            <label for="addStu_num" class="col-sm-2 control-label" name="num">学号</label>
            <div class="col-sm-10">
             <label id="stu_num_l"class="col-sm-2 control-label"></label>
            </div>
          </div>
          <div class="form-group">
            <label for="addStu_name" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="updateStu_name" placeholder="姓名" name="name">
              <span  class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="radio col-sm-3">
              <label>
                <input type="radio" name="gender" id="updateStu_optionsRadios1" value="男" checked="checked">
                男
              </label>
            </div>
            <div class="radio">
              <label>
                <input type="radio" name="gender" id="updateStu_optionsRadios2" value="女">
                女
              </label>
            </div>
            <br>
            <div class="form-group">
              <label class="col-sm-2 control-label">年级</label>
              <div class="col-sm-3">
                <label class="col-sm-2 control-label gradeL" name="grade"></label>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">学院</label>
              <div class="col-sm-3">
                <select class="form-control" id="update_stu_college" name="faculties">

                </select>
              </div>
              <label class="col-sm-2 control-label">专业</label>
              <div class="col-sm-4">
                <select class="form-control" id="update_stu_major" name="professional">

                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="addStu_number" class="col-sm-2 control-label">电话</label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="update_stu_number" placeholder="电话" name="phonenum">
                <span  class="help-block"></span>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">宿舍号</label>
              <div class="col-sm-3">
                <select class="form-control">
                  <option>A栋</option>
                  <option>B栋</option>
                  <div class="col-sm-6" style="float: left">
                    <input type="text" class="form-control" id="update_hourseN_stu" placeholder="宿舍号" name="dormNum">
                    <span  class="help-block"></span>
                  </div>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="update_stu_save">修改数据</button>
          </div>

        </form>
        <%--        修改表单结束      --%>
      </div>

    </div>
  </div>
</div>
<%--修改模态框结束--%>
<div class="content">
  <div class="row" style="margin: 10px">
    <div class="col-md-12">
      <button type="button" class="btn btn-primary btn-sm" id="stu_addBtn">
            <span class="glyphicon glyphicon-plus" aria-hidden="true">
            </span>
        新增
      </button>
      <button type="button" class="btn btn-danger btn-sm" id="stu_deleteAllBtn">
            <span class="glyphicon glyphicon-trash" aria-hidden="true">
            </span>
        删除
      </button>
    </div>
  </div>
  <div class="row">
    <div class="col-md-4">

      <label style="margin-left: 10px">学号:</label>

      <input type="text" placeholder="输入学号搜索"  style="width: 250px" id="select_Stu_num">
      <button type="button" class="btn btn-warning" id="select_num">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
      </button>
    </div>
    <div class="col-md-4">
      <label>年级:</label>
      <input type="text" placeholder="输入年级搜索"  style="width: 250px"id="select_Stu_grade">
      <button type="button" class="btn btn-warning" id="select_grade">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
      </button>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12" style="margin-top: 5px">
      <table class="table table-bordered" id="stu_table">
        <thead>
        <th>
          <input type="checkbox" id="check_all">
        </th>
        <th>学号
          <!--            <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a><-->
        </th>
        <th>姓名
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>性别
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>年级
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>学院
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>专业
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>电话

          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>宿舍号
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        <th>操作
          <!--                    <a><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a>-->
        </th>
        </thead>
        <tbody>

        </tbody>
      </table>
    </div>
  </div>
  <style>
    /*padding: 5px 11px;*/
    .pagination li a{
      padding: 5px 11px;
    }
    a:hover{
      cursor: pointer;
    }
  </style>
  <div class="row">
    <div class="col-md-3" id="pageInfo_div">
      <!--            当前第1页,总共有555条记录 共有111页-->

    </div>
    <div class="col-md-2" >
      页码: <input type="text" id="go_pn" style="width: 30px; height: 25px"><a id="go_pageNum"style="text-decoration: none">&nbsp;前往</a>
    </div>
    <div class="col-md-4 col-md-offset-1" id="page_div">

    </div>

  </div>
</div>
<script type="text/javascript">
  var grade_num = "2017";
  var edit_PageNum;
  var faculties_name = "";
  var select_grade;
  var select_num;
  $(function () {
    // alert("1111");
    to_pageNum(undefined,1);
  });

  function to_pageNum(select_condition,i){
    // alert(select_grade);
    // alert(select_num);
    if (select_condition == undefined){
      $.ajax({
        url:"Stus",
        data:"pn="+i,
        type:"GET",
        success:function (result) {
          bulid_stuTable(result);
          bulid_stuPags(undefined,result);
          bulid_pageInfo(result);
        }
      });
    }else if (select_condition == select_num){
      $.ajax({
        url:"Stus",
        type:"GET",
        data:"select_num="+select_num+"&pn="+i,
        success:function (result) {
          bulid_stuTable(result);
          bulid_stuPags(select_num,result);
          bulid_pageInfo(result);
        }
      });
    }else {
      $.ajax({
        url:"Stus",
        type:"GET",
        data:"select_grade="+select_grade+"&pn="+i,
        success:function (result) {
          bulid_stuTable(result);
          bulid_stuPags(select_grade,result);
          bulid_pageInfo(result);
        }
      });
    }
  }
  function bulid_stuTable(result){
    $("#stu_table tbody").empty();
    $.each(result.extend.pageInfo.list,function(index,item){
      var check_item_td = $("<td></td>").append("<input type='checkbox' class='check_item'>").attr("itemId",item.id);
      var num_td = $("<td></td>").append(item.num);
      var name_td = $("<td></td>").append(item.name);
      var gender_td = $("<td></td>").append(item.gender);
      var grade_td = $("<td></td>").append(item.grade);
      var faculties_td = $("<td></td>").append(item.faculties);
      var professional_td = $("<td></td>").append(item.professional);
      var phonenum_td = $("<td></td>").append(item.phonenum);
      var dormNum_td = $("<td></td>").append(item.dormNum);
      var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
              .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
      //为编辑按钮添加一个自定义的属性，来表示当前员工id
      editBtn.attr("edit-id",item.id);
      edit_PageNum = result.extend.pageInfo.pageNum;
      faculties_name = item.faculties;
      var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
              .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
      //为删除按钮添加一个自定义的属性来表示当前删除的员工id
      delBtn.attr("del-id",item.id);
      var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
      btnTd.append(editBtn).append("&nbsp;&nbsp;").append(delBtn);
      $("<tr></tr>")
              .append(check_item_td)
              .append(num_td)
              .append(name_td)
              .append(gender_td)
              .append(grade_td)
              .append(faculties_td)
              .append(professional_td)
              .append(phonenum_td)
              .append(dormNum_td)
              .append(btnTd)
              .appendTo("#stu_table tbody")
    });


  }
  <%--<strong><span th:text="'当前第'+${pageInfo.pageNum}+'页 总有有'+${pageInfo.total}+'记录 共有'+${pageInfo.pages}+'页'"></span></strong>--%>
  function bulid_pageInfo(result){
    $("#pageInfo_div").empty();
    $("<span></span>").append("当前第"+result.extend.pageInfo.pageNum+" 页 共有"+result.extend.pageInfo.total+"记录 共有"+result.extend.pageInfo.pages)
            .appendTo("#pageInfo_div");
  }

  function bulid_stuPags(select_condition,result){
    $("#page_div").empty();
    var $nav = $("<nav></nav>");
    var ul = $("<ul></ul>").attr("class","pagination");
    var a_last = $("<a></a>").append("上一页");
    var li_last = $("<li></li>").append(a_last);
    if (result.extend.pageInfo.pageNum == 1){
      li_last.addClass("disabled");
    }
    li_last.click(function () {
      to_pageNum(select_condition,result.extend.pageInfo.pageNum - 1);
    });

    var li_one = $("<li></li>");
    var to_one = $("<a></a>").append("&laquo;");
    li_one.append(to_one);
    ul.append(li_last);
    ul.append(li_one);
    to_one.click(function () {
      to_pageNum(select_condition,1);
    });
    if (result.extend.pageInfo.hasPreviousPage == false){
      li_one.addClass("disabled");
    }
    $.each(result.extend.pageInfo.navigatepageNums,function (index, item) {
      var pagNum = $("<li></li>");
      var pag = $("<a></a>").append(item);
      if (item == result.extend.pageInfo.pageNum){
        pagNum.addClass("active");
      }
      pag.click(function () {
        to_pageNum(select_condition,item);
      });
      pagNum.append(pag);
      ul.append(pagNum);

    });
    var lastPages = $("<li></li>");
    var las_a = $("<a></a>").append("&raquo;");
    if (result.extend.pageInfo.pageNum == result.extend.pageInfo.pages ){
      lastPages.addClass("disabled");
    }
    las_a.click(function () {
      to_pageNum(select_condition,result.extend.pageInfo.pages);
    });
    var a_next = $("<a></a>").append("下一页");
    var li_next = $("<li></li>").append(a_next);
    if (result.extend.pageInfo.pages == result.extend.pageInfo.pageNum ){
      li_next.addClass("disabled");
    }
    a_next.click(function () {
      to_pageNum(select_condition,result.extend.pageInfo.pageNum + 1);
    });
    lastPages.append(las_a);
    ul.append(lastPages);
    ul.append(li_next);
    ul.appendTo($nav);
    $nav.appendTo("#page_div");
  }
  //根据条件查询分页条点击方法
  function to_selectNum(select_num,pn){
    alert(select_num);
    $.ajax({
      url:"Stus",
      type:"GET",
      data:"select_num="+select_num+"&pn="+pn,
      success:function (result) {
        bulid_stuTable(result);
        bulid_stuPags(result);
        bulid_pageInfo(result);
      }
    });
  }
  //新增按钮功能
  $("#stu_addBtn").click(function () {
    $("#stu_college").empty();
    $("#addStu_num").val("");
    $("#addStu_num").parent().removeClass("has-error has-success");
    $("#addStu_num").next("span").text("");
    $("#addStu_name").val("");
    $("#addStu_name").parent().removeClass("has-error has-success");
    $("#addStu_name").next("span").text("");
    $("#addStu_number").val("");
    $("#addStu_number").parent().removeClass("has-error has-success");
    $("#addStu_number").next("span").text("");
    $("#hourseN_stu").val("");
    $("#hourseN_stu").parent().removeClass("has-error has-success");
    $("#hourseN_stu").next("span").text("");
    $.ajax({
      url:"col",
      type:"GET",
      success:function (result) {
        bulid_stu_college("#stu_college");
        bulid_stu_major(1,"#stu_major");
      }
    })


    $('#myModal_stu').modal('show')

  })

  //构建下拉列表
  function  bulid_stu_college(ele){
    $.ajax({
      url:"col",
      type:"GET",
      success:function (result) {
        $.each(result.extend.colleges,function (index, item) {
          var option = $("<option></option>").append(item.college).attr("college_id",item.id);
          $(ele).append(option);

        });
      }
    });
    $("#stu_college").change(function () {
      // var id = $("#stu_college option").attr("college_id");
      var id = $("#stu_college option:selected").attr("college_id");
      // alert(id);
      bulid_stu_major(id,"#stu_major");
    });
  }

  //构建专业下拉选项
  function bulid_stu_major(id,ele){
    $(ele).empty();
    // alert(id);
    $.ajax({
      url:"fas",
      data: "id="+id,
      type:"GET",
      success:function (result) {
        $.each(result.extend.faculties,function (index,item) {
          var option = $("<option></option>").append(item.professionalName);
          $(ele).append(option);
        });
      }
    });
  }
  $("#stu_save").click(function () {
    // alert("11111");
    var hour_num = $("#hourseN_stu").val();
    if (!form_add_test()){
      return false;
    }
    // alert("1111");
    $.ajax({
      url:"Stus",
      type:"POST",
      data:$("#stu_form").serialize()+"&hour_num="+hour_num,
      success:function (result) {
        if (result.code == 100){
          show_validate_msg("#addStu_num","success","");
          alert("成功");
          to_pageNum(undefined,9999999);
          $("#myModal_stu").modal('hide');
        }else{
          if (result.msg == "学号已存在"){
            show_validate_msg("#addStu_num","error","学号已存在");
          }
          if (result.msg == "宿舍人数已满"){
            show_validate_msg("#hourseN_stu","error","宿舍人数已满");
          }
        }
      }
    });
  });
  //表单校验
  function form_add_test() {
    // alert($("#stu_grade option:selected").attr("grade_num"));
    var num = $("#addStu_num").val();
    if (grade_num == "2017") {
      var grade_17 = /^[1][7][0-9]{10}$/;
      if (grade_17.test(num)) {

        show_validate_msg("#addStu_num", "success", "");
      } else {
        show_validate_msg("#addStu_num", "error", "学号输入错误");
        return false;
      }
    } else if (grade_num == "2018") {
      var grade_18 = /^[1][8][0-9]{10}$/;
      if (grade_18.test(num)) {
        show_validate_msg("#addStu_num", "success", "");

      } else {
        show_validate_msg("#addStu_num", "error", "学号输入错误");
        return false;
      }
    } else if (grade_num == "2019") {
      var grade_19 = /^[1][9][0-9]{10}$/;
      if (grade_19.test(num)) {
        show_validate_msg("#addStu_num", "success", "");

      } else {
        show_validate_msg("#addStu_num", "error", "学号输入错误");
        return false;
      }
    } else if (grade_num == "2020") {
      var grade_20 = /^[2][0][0-9]{10}$/;
      if (grade_20.test(num)) {
        show_validate_msg("#addStu_num", "success", "");

      } else {
        show_validate_msg("#addStu_num", "error", "学号输入错误");
        return false;
      }
    } else if (grade_num == "2021") {
      var grade_21 = /^[2][1][0-9]{10}$/;
      if (grade_21.test(num)) {
        show_validate_msg("#addStu_num", "success", "");

      } else {
        var grade_22 = /^[2][2][0-9]{10}$/;
        if (grade_22.test(num)) {
          show_validate_msg("#addStu_num", "success", "");

        } else {
          show_validate_msg("#addStu_num", "error", "学号输入错误");
          return false;
        }
      }
    }
    if (!name_test("#addStu_name")){
      return false;
    }
    if (!number_test("#addStu_number")){
      return false;
    }
    if (!dormNum_test("#hourseN_stu")){
      return false;
    }
    return true;
  }
  /*******表单校验方法******/
  //姓名依次往后校验
  function name_test(ele) {
    var name = $(ele).val();
    var name_test = /^[\u4e00-\u9fa5]{2,4}$/;
    if (name_test.test(name)) {
      // alert("正确");
      show_validate_msg(ele, "success", "");
    } else {
      show_validate_msg(ele, "error", "姓名格式错误");
      return false;
    }
    return true;
  }
  //电话输入框校验
  function number_test(ele1) {
    var phoneNum = $(ele1).val();
    var phoneNum_test = /^[1][3,4,5,7,8,9][0-9]{9}$/;

    if (!phoneNum_test.test(phoneNum)) {
      show_validate_msg(ele1, "error", "联系方式输入错误");
      return false;
    } else {
      show_validate_msg(ele1, "success", "联系方式输入正确");
    }
    return true;
  }
  //宿舍号输入框校验
  function dormNum_test(ele) {
    var dorm_num = $(ele).val();
    var dorm_num_test = /^[1,2][1,2,3,4][0][1-9]$/
    if (dorm_num_test.test(dorm_num)) {
      show_validate_msg(ele, "success", "");

    } else {
      show_validate_msg(ele, "error", "查不到该宿舍号");
      return false;
    }
    return true;
  }
  /*******表单校验方法******/
  //年级下拉选项框改变正则表达式(如17级必须以17开头的12位纯数字)
  $("#stu_grade").change(function () {
    // alert($("#stu_grade option:selected").attr("grade_num"))
    grade_num = $("#stu_grade option:selected").attr("grade_num");
  });

  //表单校验状态显示
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
  //绑定编辑按钮事件
  $(document).on("click",".edit_btn",function () {
    // $("#stu_college").empty();
    // $("#addStu_num").val("");
    // $("#addStu_num").parent().removeClass("has-error has-success");
    // $("#addStu_num").next("span").text("");
    $("#updateStu_name").val("");
    $("#updateStu_name").parent().removeClass("has-error has-success");
    $("#updateStu_name").next("span").text("");
    $("#update_stu_number").val("");
    $("#update_stu_number").parent().removeClass("has-error has-success");
    $("#update_stu_number").next("span").text("");
    $("#update_hourseN_stu").val("");
    $("#update_hourseN_stu").parent().removeClass("has-error has-success");
    $("#update_hourseN_stu").next("span").text("");
    // alert($(this));
    var edit_id = $(this).attr("edit-id");
    bulid_stu_college("#update_stu_college");
    // bulid_stu_major(1,"#update_stu_major");
    bulid_updateStu_major();
    // alert(faculties_name);
    getStuById(edit_id);
    $("#myModal_stu1").modal('show');

    // alert($("#myModal_stu1 form").serialize());
    $("#update_stu_save").click(function () {
      if(!name_test("#updateStu_name")){
        return false;
      }
      if(!number_test("#update_stu_number")){
        return false;
      }
      if (!dormNum_test("#update_hourseN_stu")){
        return false;
      }
      // alert(edit_id);
      var hour_num = $("#update_hourseN_stu").val();
      $.ajax({
        url:"Stus/"+edit_id,
        type:"POST",
        data:$("#myModal_stu1 form").serialize()+"&_method=PUT&hour_num="+hour_num,
        success:function () {
          alert("成功");
          $("#myModal_stu1").modal('hide');
          if (select_num == undefined && select_grade == undefined){
            to_pageNum(undefined,edit_PageNum);
          }else if (select_num != undefined &&select_num.length>0){
            to_pageNum(select_num,edit_PageNum);
          }else if (select_grade != undefined && select_grade.length>0){
            to_pageNum(select_grade,edit_PageNum);
          }
        }
      });
    });
  });


  //根基id查询学生信息
  function getStuById(id){
    $("#stu_num_l").empty();
    $("#updateStu_name").empty();
    $(".gradeL").empty();
    $("#myModal_stu1 input[name=gender]").empty();
    $("#update_stu_college").empty();
    $("#update_stu_major").empty();
    $("#update_stu_number").empty();
    $.ajax({
      url:"Stus/"+id,
      type:"GET",
      success:function (result) {

        $("#stu_num_l").append(result.extend.stu.num);
        $("#updateStu_name").attr("placeholder",result.extend.stu.name);
        $(".gradeL").append(result.extend.stu.grade);
        $("#myModal_stu1 input[name=gender]").val(result.extend.stu.gender);
        $("#update_stu_college").val(result.extend.stu.faculties);
        // alert((result.extend.stu.faculties));
        $("#update_stu_major").val(result.extend.stu.professional);
        $("#update_stu_number").attr("placeholder",result.extend.stu.phonenum);
      }
    });
  }
  //修改模态框专业下拉列表

  $("#update_stu_college").change(function () {
    // var id = $("#stu_college option").attr("college_id");
    var col_id = $("#update_stu_college option:selected").attr("college_id");
    bulid_stu_major(col_id,"#update_stu_major");
  });
  //构建点击编辑学生专业下拉列表
  function bulid_updateStu_major(){
    $.ajax({
      url:"col/"+faculties_name,
      type:"GET",
      success:function (result) {
        // alert(result.extend.collegesByName.id);
        // console.log(result);
        bulid_stu_major(result.extend.collegesByName.id,"#update_stu_major");
      }
    });
  }
  //绑定删除按钮单击事件
  $(document).on("click",".delete_btn",function () {
    // alert(confirm("你确定删除"+$(this).parent().parent().find("td:eq(1)").text()));
    var del_id = $(this).attr("del-id");
    if (confirm("你确定删除"+$(this).parent().parent().find("td:eq(2)").text())){
      $.ajax({
        url:"Stus/"+del_id,
        type:"POST",
        data:"_method=DELETE",
        success:function () {
          alert("删除成功");
          if (select_num == undefined && select_grade == undefined){
            to_pageNum(undefined,edit_PageNum);
          }else if (select_num != undefined &&select_num.length>0){
            to_pageNum(select_num,edit_PageNum);
          }else if (select_grade != undefined && select_grade.length>0){
            to_pageNum(select_grade,edit_PageNum);
          }
        }
      });
    }
  });
  //输入学号查询框绑定事件
  $("#select_num").click(function () {
    select_num = $("#select_Stu_num").val();
    $.ajax({
      url:"Stus",
      data:"select_num="+select_num,
      type:"GET",
      success:function (result) {
        // console.log(result);
        bulid_stuTable(result);
        bulid_stuPags(select_num,result);
        bulid_pageInfo(result);
      }

    });
  });
  //输入年级查询
  $("#select_grade").click(function () {
    select_grade = $("#select_Stu_grade").val();
    $.ajax({
      url:"Stus",
      data:"select_grade="+select_grade,
      type:"GET",
      success:function (result) {
        bulid_stuTable(result);
        bulid_stuPags(select_grade,result);
        bulid_pageInfo(result);
      }
    });
  });
  //输入页码跳转指定的页码数
  $("#go_pageNum").click(function () {
    var pn = $("#go_pn").val();
    if (select_num == undefined && select_grade == undefined){
      to_pageNum(undefined,pn);
    }else if (select_num != undefined &&select_num.length>0){
      to_pageNum(select_num,pn);
    }else if (select_grade != undefined && select_grade.length>0){
      to_pageNum(select_grade,pn);
    }
  });
  //全选和全不选
  $("#check_all").click(function () {
    var flag = $(this).prop("checked");
    // alert($(".check_item"));
    $(".check_item").prop("checked",flag);
  });
  //check_item变化 全选框跟着变
  $(document).on("click",".check_item",function () {
    var flag = $(".check_item:checked").length == $(".check_item").length;
    $("#check_all").prop("checked",flag);
  });
  //删除选中项
  $("#stu_deleteAllBtn").click(function () {
    var name = "";
    var ids = "";
    $.each($(".check_item:checked"),function (index, item) {
      ids = ids + $(this).parent().parent().find("td:eq(0)").attr("itemId") + "-";
      name = name + $(this).parent().parent().find("td:eq(2)").text()+",";
    });
    ids  = ids.substring(0,ids.lastIndexOf("-"));
    // alert(ids);
    name = name.substring(0,name.lastIndexOf(","));
    // alert(select_num);
    // alert(select_grade)
    // alert(edit_PageNum);
    if (confirm("你确定要删除【"+ name +"】么？")){
      $.ajax({
        url:"Stus",
        data:"ids="+ids+"&_method=DELETE",
        type:"POST",
        success:function (result) {
          alert("成功");
          if (select_num == undefined && select_grade == undefined){
            // alert("1");
            to_pageNum(undefined,edit_PageNum);
          }else if (select_num != undefined &&select_num.length>0){
            to_pageNum(select_num,edit_PageNum);
          }else if (select_grade != undefined && select_grade.length>0){
            to_pageNum(select_grade,edit_PageNum);
          }else {
            // alert("4");
          }
        }
      });
    }
  });
</script>
</body>
</html>