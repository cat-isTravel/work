<%--
  Created by IntelliJ IDEA.
  User: 51901
  Date: 2021/9/30
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生自助系统</title>
  <link href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
  <link href="static/css/index.css" rel="stylesheet">
  <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
  <script src="static/js/jquery-1.12.4.min.js"></script>
  <script src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  <script src="static/layui/layui.js"></script>
  <style>
    .layui-side{
      position: absolute;
      bottom: -15%;
      margin-right: 10px;
    }

    .layui-bg-black {
      background-color: #23262E !important;
    }
  </style>
  <script>
    layui.use('element', function() {
      var element = layui.element;

    });

    layui.use('element', function() {
      var element = layui.element;
      var active = {
        tabAdd : function(url, id, name) {
          element.tabAdd('contentnav', {
            title : name,
            content : '<iframe data-frameid="' + id
                    + '" scrolling="auto" frameborder="0" src="' + url
                    + '" style="width:100%;"></iframe>',
            id : id
          });
          rightMenu();
          iframeWH();
        },
        tabChange : function(id) {
          element.tabChange('contentnav', id);
        },
        tabDelete : function(id) {
          element.tabDelete('contentnav', id);
        },
        tabDeleteAll : function(ids) {
          $.each(ids, function(index, item) {
            element.tabDelete('contentnav', item);
          });
        }
      };
      $(".site-url").on(
              'click',
              function() {
                var nav = $(this);
                var length = $("ul.layui-tab-title li").length;
                if (length <= 0) {
                  active.tabAdd(nav.attr("data-url"),
                          nav.attr("data-id"), nav.attr("data-title"));
                } else {
                  var isData = false;
                  $.each($("ul.layui-tab-title li"), function() {
                    if ($(this).attr("lay-id") == nav.attr("data-id")) {
                      isData = true;
                    }
                  });
                  if (isData == false) {
                    active.tabAdd(nav.attr("data-url"), nav
                            .attr("data-id"), nav.attr("data-title"));
                  }
                  active.tabChange(nav.attr("data-id"));
                }
              });
      function rightMenu() {
        //右击弹出
        $(".layui-tab-title li").on('contextmenu', function(e) {
          var menu = $(".rightmenu");
          menu.find("li").attr('data-id', $(this).attr("lay-id"));
          l = e.clientX;
          t = e.clientY;
          menu.css({
            left : l,
            top : t
          }).show();
          return false;
        });
        //左键点击隐藏
        $("body,.layui-tab-title li").click(function() {
          $(".rightmenu").hide();
        });
      }
      $(".rightmenu li").click(function() {
        if ($(this).attr("data-type") == "closethis") {
          active.tabDelete($(this).attr("data-id"));
        } else if ($(this).attr("data-type") == "closeall") {
          var tabtitle = $(".layui-tab-title li");
          var ids = new Array();
          tabtitle.each(function(i) {
            ids.push($(this).attr("lay-id"));
          });
          //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
          active.tabDeleteAll(ids);
        }
        $('.rightmenu').hide(); //最后再隐藏右键菜单
      });
      function iframeWH() {
        var H = $(window).height() - 80;
        $("iframe").css("height", H + "px");
      }
      $(window).resize(function() {
        iframeWH();
      });
    })
    /*刷新后台页面*/
    function reloadPage() {
      window.location.reload()
    }
    /*退出系统*/
    $(document).on("click", "#logout", function() {
      var msg = "您确定要退出系统吗？";
      if (confirm(msg) == true) {
        window.location.href = "http://localhost:8080/SSM_DormitoryManagement/";
      }
    });
  </script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">
      学生自助系统
      <a id="audio_btn"><i class="glyphicon glyphicon-volume-down"
                           width="15" height="18" id="music_btn"></i></a>
    </div>
    <nav class="layui-layout-left">
      <ul class="layui-inline layui-nav layui-nav-switch"
          style="padding: 0;">
        <li class="layui-nav-item"><a href="javascript:;" type="button"
                                      value="Reload page" onclick="reloadPage()" title="刷新后台页面"><i
                class="layui-icon layui-icon-refresh"></i></a></li>
      </ul>
    </nav>
    <nav class="layui-layout-right">
      <ul class="layui-nav">
        <li class="layui-nav-item layui-hide-xs"><a
                href="javascript:void();"> <cite
                class="adminName">${sessionScope.user.name}</cite>
        </a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" id="logout"><span>退&nbsp;&nbsp;&nbsp;&nbsp;出</span></a>
            </dd>
          </dl></li>
      </ul>
    </nav>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-this"><a href="javascript:;"
                                                 class="site-url" data-id="2" data-title="首页"
                                                 data-url="welcome.jsp"><i class="glyphicon glyphicon-home"></i><span>首页</span></a>
        </li>
        <li class="layui-nav-item"><a href="javascript:;"><i
                class="glyphicon glyphicon-file"></i><span>宿舍信息</span></a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" class="site-url" data-id="3"
                 data-title="我的舍友" data-url="StuRoommate">我的舍友</a>
            </dd>
          </dl></li>
        <li class="layui-nav-item"><a href="javascript:;"><i
                class="glyphicon glyphicon-list"></i><span>房间信息</span></a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" class="site-url" data-id="4"
                 data-title="房间信息" data-url="StuRoomInfo">房间信息</a>
            </dd>
          </dl></li>
        <li class="layui-nav-item"><a href="javascript:;"><i
                class="glyphicon glyphicon-user"></i><span>系统管理</span></a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" class="site-url" data-id="5"
                 data-title="用户信息" data-url="StuUserInfo">用户信息</a>
            </dd>
          </dl></li>
        <li class="layui-nav-item"><a href="javascript:;"><i
                class="glyphicon glyphicon-link"></i><span>维修服务管理</span></a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" class="site-url" data-id="6"
                 data-title="维修申请" data-url="StuRequest">维修申请</a>
            </dd>
          </dl></li>
        <li class="layui-nav-item"><a href="javascript:;"><i
                class="glyphicon glyphicon-cog"></i><span>系统管理</span></a>
          <dl class="layui-nav-child">
            <dd>
              <a href="javascript:;" onclick="reloadPage()"><i
                      class="layui-icon layui-icon-refresh"></i><span>刷新页面</span></a>
            </dd>
          </dl></li>
      </ul>
    </div>
  </div>
</div>
<div class="layui-tab layui-tab-brief" lay-filter="contentnav"
     lay-allowClose="true" style="margin-left: 205px; margin-top: 0;">
  <ul class="layui-tab-title" style="margin-bottom:10px">
    <li class="layui-nav-item layui-this" lay-id="2">首页</li>
  </ul>
  <ul class="layui-bg-green rightmenu"
      style="display: none; position: absolute;">
    <li data-type="closethis">关闭当前</li>
    <li data-type="closeall">关闭所有</li>
  </ul>
  <div class="layui-tab-content" style="padding: 0;">
    <div class="layui-tab-item layui-show">
      <iframe src="welcome" width="100%"
              style="border: none; height: 708px" height="100%"
              name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
    </div>
  </div>
</div>

</body>
</html>
