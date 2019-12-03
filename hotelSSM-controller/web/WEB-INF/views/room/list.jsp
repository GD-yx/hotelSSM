<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
    <a href="/room/add">新增</a>
    <a href="#">修改</a>
    <a href="#">删除</a>
</div>
<table class="table">
    <tr>
        <th>选择</th>
        <th>房间号</th>
        <th>房间类型</th>
        <th>状态</th>
        <th>价格</th>
        <th>备注</th>
    </tr>
    <tbody>
    <c:forEach items="${rooms.list}" var="r">
        <tr>
            <td><input type="checkbox"/></td>
            <td>${r.roomid}</td>
            <td>${r.rtname}</td>
            <td>${r.status}</td>
            <td>${r.rprice}</td>
            <td>${r.remark}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/room/list?pageNum=1">首页</a></li>
    <li><a href="/room/list?pageNum=${rooms.prePage}">上一页</a></li>
    <c:forEach items="${rooms.navigatepageNums}" var="p">
        <li><a href="/room/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/room/list?pageNum=${rooms.nextPage}">下一页</a></li>
    <li><a href="/room/list?pageNum=${rooms.pages}">尾页</a></li>
</ul>
</body>
</html>
