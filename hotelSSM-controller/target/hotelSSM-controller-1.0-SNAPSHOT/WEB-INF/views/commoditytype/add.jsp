<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品类型新增</title>
</head>
<body>
<form action="/commoditytype/insert" method="post">
    编号：<input type="text" name="coid"/><br/>
    类型：<input type="text" name="cotype"/><br/>
    <input type="submit" value="添加"/><br/>
</form>
</body>
</html>
