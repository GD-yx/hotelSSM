<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间类型管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
    <a href="/roomtype/add">新增</a>
    <a href="#">修改</a>
    <%--<a><input type="button" value="删除" onclick="deleteItems()"/></a>--%>
    <a  href="#" id="delete">删除</a>
</div>
<table class="table">
    <tr>
        <th>选择</th>
        <th>主键</th>
        <th>房间类型</th>
    </tr>
    <tbody>
    <c:forEach items="${roomtypes.list}" var="t">
        <tr>
            <td><input type="checkbox" class="cb" rtid="${t.rtid}" /></td>
            <td>${t.rtid}</td>
            <td>${t.rtname}</td>

        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/roomtype//list?pageNum=1">首页</a></li>
    <li><a href="/roomtype/list?pageNum=${roomtypes.prePage}">上一页</a></li>
    <c:forEach items="${roomtypes.navigatepageNums}" var="p">
        <li><a href="/roomtype/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/roomtype/list?pageNum=${roomtypes.nextPage}">下一页</a></li>
    <li><a href="/roomtype/list?pageNum=${roomtypes.pages}">尾页</a></li>
</ul>
</body>
<script>
    $("#delete").click(function () {
        var items = $(".cb:checked").attr("rtid");
        $.ajax({

        })
    })
    function deleteItems() {
        var items = $(".cb:checked");
        if(items){

        }

        /*var len = items.length;
        for(var i = 0;i<len;i++){
            $(items[i]).parent(".item").remove();
        }*/
    }
</script>
</html>
