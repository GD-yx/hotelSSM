<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间新增</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<form action="/room/insert" method="post">
    房间号：<input type="text" name="roomid"/><br/>
    房间类型：
        <select name="rtype">
            <c:forEach items="${roomtypes.list}" var="t">
            <option value="${t.rtid}" selected>${t.rtname}</option>
            </c:forEach>
        </select>

    状态：<input type="text" name="status"/><br/>
    价格：<input type="text" name="rprice"/><br/>
    备注：<input type="text" name="remark"/><br/>
    <input type="submit" value="添加"/><br/>
</form>
</body>
</html>
