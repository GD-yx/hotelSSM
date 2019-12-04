<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品类型管理</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
    <a href="/commoditytype/add">新增</a>
</div>
<table class="table">
    <tr>
        <th>主键</th>
        <th>商品类型</th>
        <th>操作</th>
    </tr>
    <tbody>
    <c:forEach items="${commoditytypes.list}" var="c">
        <tr>
            <td>${c.coid}</td>
            <td>${c.cotype}</td>
            <td>
                <a href="/commoditytype/edit?id=${c.coid}">修改</a>
                <a href="/commoditytype/delete?id=${c.coid}" >删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/commoditytype/list?pageNum=1">首页</a></li>
    <li><a href="/commoditytype/list?pageNum=${commoditytypes.prePage}">上一页</a></li>
    <c:forEach items="${commoditytypes.navigatepageNums}" var="p">
        <li><a href="/commoditytype/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/commoditytype/list?pageNum=${commoditytypes.nextPage}">下一页</a></li>
    <li><a href="/commoditytype/list?pageNum=${commoditytypes.pages}">尾页</a></li>
</ul>
</body>
</html>
