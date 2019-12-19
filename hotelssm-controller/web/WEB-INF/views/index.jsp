<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>YG酒店管理系统</title>
</head>
<body>
<div class="container">
    <!-- 第一行 -->
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h1>后台管理</h1>
        </div>
       <%-- <div class="col-md-8 column">
            <h1 class="pull-right username">当前用户：${username}</h1>
        </div>--%>

    </div>
    <!-- 第二行 -->
    <div class="row clearfix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li>
                    <a href="/roomtype/index">房间类型</a>
                </li>
                <li>
                    <a href="/room/index">房间管理</a>
                </li>
                <li>
                    <a href="/commoditytype/index">商品类型</a>
                </li>
                <li>
                    <a href="/commodity/index">商品管理</a>
                </li>
                <li>
                    <a href="/customer/index">客户信息</a>
                </li>
                <li>
                    <a href="/unsettled/index">入住信息</a>
                </li>
                <li>
                    <a href="/employee/index">员工管理</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
