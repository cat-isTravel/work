<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 10:22
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
        <table class="table table-bordered"id="stu_table_roommate">
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

            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
       bulid_teaIndex_roommateInfo();
    });
    function bulid_teaIndex_roommateInfo(){
        $.ajax({
           url:"stu/roommate",
           type:"GET",
           success:function (result) {
               bulid_table(result);
           },
        });
    }
    function bulid_table(result){
        $.each(result.extend.students,function (index, item) {
            var num_td = $("<td></td>").append(item.num);
            var name_td = $("<td></td>").append(item.name);
            var gender_td = $("<td></td>").append(item.gender);
            var faculties_td = $("<td></td>").append(item.faculties);
            var professional_td = $("<td></td>").append(item.professional);
            var phonenum_td = $("<td></td>").append(item.phonenum);
            var dormNum_td = $("<td></td>").append(item.dormNum);
            $("<tr></tr>")
                .append(num_td)
                .append(name_td)
                .append(gender_td)
                .append(faculties_td)
                .append(professional_td)
                .append(phonenum_td)
                .append(dormNum_td).appendTo("#stu_table_roommate tbody")
        });
    }
</script>
</body>
</html>
