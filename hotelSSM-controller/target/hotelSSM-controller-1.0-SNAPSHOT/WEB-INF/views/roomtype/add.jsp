<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间类型新增</title>
</head>
<body>
<form action="/roomtype/insert" method="post">
    编号：<input type="text" name="rtid"/><br/>
    类型：<input type="text" name="rtname"/><br/>
    <input type="submit" value="添加"/><br/>
</form>
</body>
</html>