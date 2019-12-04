<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品类型修改</title>
</head>
<body>
<form action="/commoditytype/update" method="post">
    编号：<input type="text" name="coid" value="${commoditytype.coid}"/><br/>
    商品类型：<input type="text" name="cotype" value="${commoditytype.cotype}"/><br/>
    <input type="submit" value="修改"/><br/>
</form>
</body>
</html>
