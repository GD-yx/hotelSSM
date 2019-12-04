<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 10:42
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
    <a href="/commodity/add">新增</a>
</div>
<table class="table">
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类型</th>
        <th>计量单位</th>
        <th>商品价格</th>
        <th>操作</th>
    </tr>
    <tbody>
    <c:forEach items="${commodities.list}" var="c">
        <tr>

            <td>${c.cid}</td>
            <td>${c.cname}</td>
            <td>${c.cotype}</td>
            <td>${c.cunit}</td>
            <td>${c.cprice}</td>
            <th>
                <a href="/commodity/edit?id=${c.cid}">修改</a>
                <a href="/commodity/delete?id=${c.cid}">删除</a>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/commodity/list?pageNum=1">首页</a></li>
    <li><a href="/commodity/list?pageNum=${commodities.prePage}">上一页</a></li>
    <c:forEach items="${commodities.navigatepageNums}" var="p">
        <li><a href="/commodity/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/commodity/list?pageNum=${commodities.nextPage}">下一页</a></li>
    <li><a href="/commodity/list?pageNum=${commodities.pages}">尾页</a></li>
</ul>
</body>
</html>

