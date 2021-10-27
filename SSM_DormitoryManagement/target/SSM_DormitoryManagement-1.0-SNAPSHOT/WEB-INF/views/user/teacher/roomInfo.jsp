<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 10:51
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
    <table class="table table-bordered" id="tea_table_roomInfo">
      <thead>
      <th>层数</th>
      <th>房间号</th>
      <th>已住人数</th>
      <th>最多人数</th>
      </thead>
      <tbody>

      </tbody>
    </table>
  </div>
</div>
<script>
  $(function () {
    bulid_teaIndex_roomInfo();
  });
  function bulid_teaIndex_roomInfo(){
    $.ajax({
      url:"tea/roomInfo",
      type:"GET",
      success:function (result) {
        console.log(result);
        bulid_table(result);
      }
    });
  }
  function bulid_table(result){
    var stratum = $("<td></td>").append(result.extend.dorm.stratum);
    var dorm_num = $("<td></td>").append(result.extend.dorm.dormNum);
    var hasPeo = $("<td></td>").append(result.extend.dorm.haspeoin);
    var maxPeo = $("<td></td>").append(result.extend.dorm.maxpeoNum);
    $("<tr></tr>")
            .append(stratum)
            .append(dorm_num)
            .append(hasPeo)
            .append(maxPeo)
            .appendTo("#tea_table_roomInfo tbody")
  }
</script>
</body>
</html>
