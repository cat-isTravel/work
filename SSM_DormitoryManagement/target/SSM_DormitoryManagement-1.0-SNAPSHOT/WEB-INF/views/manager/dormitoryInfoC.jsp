<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/22
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<%--    <script src="static/js/jquery-1.12.4.min.js"></script>--%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        div h1{
            color: #4DAF29;
        }
        table td{
            text-align: center;
        }
        table th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-4 col-md-offset-5"> <h1>宿舍楼信息</h1></div>
</div>

<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
        <table class="table table-hover" id="dorm_table">
            <thead>
           <tr>
               <th>宿舍类型</th>
               <th>宿舍层数</th>
               <th>房间号</th>
               <th>当前入住人数</th>
               <th>最大入住人数</th>
           </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-1"> <span id="pageInfo"></span></div>
            <div class="col-md-offset-1 col-md-4">
                <nav aria-label="Page navigation" id="nav_page">

                </nav>
            </div>
        </div>
    </div>

</div>
<script>
    $(function () {
        // alert("1");
        to_pageNum(1);
        // alert("2");
    });
    function to_pageNum(pn){
        $("#nav_page").empty();
        $("#pageInfo").empty();
        $("#dorm_table tbody").empty();
        $.ajax({
            url:"dormNum",
            data:"stratum=C&pn="+pn,
            success:function (result) {
                // console.log(result);
                bulid_dormInfoTable(result);
                bulid_pageInfo(result);
                bulid_page_nav(result);
            }
        });
    }
    function bulid_dormInfoTable(result){
        $.each(result.extend.dormInfo.list,function (index, item) {
            var info_td = $("<td></td>").text("职工宿舍");
            var stratum_td = $("<td></td>").text(item.stratum);
            var dorm_num_td = $("<td></td>").text(item.dormNum);
            var hasPeo_td = $("<td></td>").text(item.haspeoin);
            var maxPeo_td = $("<td></td>").text(item.maxpeoNum);
            $("<tr></tr>").append(info_td).append(stratum_td).append(dorm_num_td).append(hasPeo_td).append(maxPeo_td).appendTo("#dorm_table tbody");
        });
    }

    function bulid_pageInfo(result){
        $("#pageInfo").append("当前的页码为:"+result.extend.dormInfo.pageNum+" 共有 "+ result.extend.dormInfo.total+"记录 总页码数为"+result.extend.dormInfo.pages);
    }

    function  bulid_page_nav(result){
        var page_ul = $("<ul></ul>").attr("class","pagination");
        var page_last_a = $("<a></a>").append("上一页");
        var page_last_li = $("<li></li>").append(page_last_a);
        var to_one_a = $("<a></a>").append("&laquo;");
        var to_one_li = $("<li></li>").append(to_one_a);
        page_ul.append(page_last_li);
        page_ul.append(to_one_li);

        if (result.extend.dormInfo.pageNum == 1){
            page_last_li.addClass("disabled");
            to_one_li.addClass("disabled");
        }
        to_one_a.click(function () {
            to_pageNum(1);
        });
        page_last_a.click(function () {
            to_pageNum(result.extend.dormInfo.pageNum -1);
        });
        $.each(result.extend.dormInfo.navigatepageNums,function (index, item) {
            var item_a = $("<a></a>").append(item)
            var item_li = $("<li></li>").append(item_a);
            if (result.extend.dormInfo.pageNum == item){
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
            to_pageNum(result.extend.dormInfo.pageNum + 1) ;
        });
        if (result.extend.dormInfo.pageNum == result.extend.dormInfo.pages){
            to_last_li.addClass("disabled");
            next_li.addClass("disabled");
        }
        page_ul.append(to_last_li).append(next_li).appendTo("#nav_page");
    }
</script>
</body>
</html>
