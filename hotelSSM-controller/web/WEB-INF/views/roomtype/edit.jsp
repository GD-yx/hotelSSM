<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间类型修改</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<form action="/roomtype/update" method="post">
    编号：<input type="text" name="rtid" value="${roomtype.rtid}"/><br/>
    房间类型：<input type="text" name="rtname" value="${roomtype.rtname}"/>
    <input type="submit" value="修改"/><br/>
</form>
</body>
</html>
