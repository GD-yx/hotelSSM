<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2020/1/23
  Time: 17:37
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
<div class="container" id="app">
    <!-- 第一行 -->
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h1>后台管理</h1>
        </div>
        <div class="col-md-8 column">
            <h1 class="pull-right username">当前用户：${username}</h1>
        </div>
        <div>
            <a href="/home">返回首页</a>
        </div>
    </div>
    <!-- 第二行 -->
    <div class="row clearfix">

        <div class="col-md-9 column">

            <div class="col-md-10 column" id="content">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>类型</th>
                        <th>单位</th>
                        <th>价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">

                    </tbody>
                </table>
                <a class="pageNumber" id="first"  href="#" >首页</a>
                <a class="pageNumber" id="prev" href="#">上一页</a>
                <a class="pageNumber" id="next"href="#">下一页</a>
                <a class="pageNumber" id="last" href="#">尾页</a>

                <ul id="navigatepageNums">

                </ul>
                <button href="#" class="btn-info add">新增</button>
            </div>
        </div>

    </div>

</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">

                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="cid" class="col-sm-2 control-label">商品编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cid" name="cid" v-model = "cid"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cname" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cname" name="cname" v-model = "cname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="coid" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <%--<input type="text" class="form-control" id="coid" name="coid" v-model = "coid"/>--%>
                            <select id="coid" name="coid">
                                <c:forEach items="${commoditytypes.list}" var="c">
                                    <option value="${c.coid}" selected>${c.cotype}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cunit" class="col-sm-2 control-label">单位</label>
                        <div class="col-sm-10">
                            <%--<input type="text" class="form-control" id="cunit" name="cunit" v-model = "cunit"/>--%>
                            <select id="cunit" name="cunit">
                                <option value="瓶" selected>瓶</option>
                                <option value="包" selected>包</option>
                                <option value="盒" selected>盒</option>
                                <option value="根" selected>根</option>
                                <option value="打" selected>打</option>
                                <option value="台" selected>台</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cprice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cprice" name="cprice" v-model = "cprice"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" id="save" class="btn btn-default">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $(document).ajaxError(function(){
            alert("一个错误发生");
        });
        getAll(1,pageSize);
        var page = {};
        var pageSize=4;
        //查询所有
        function getAll(pageNum,pageSize){
            $.ajax({
                url:"/commodity/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var commodities = "";
                    $.each(pageInfo.list,function (index,commodity) {
                        commodities+="<tr>";
                        //commodities+="<td>"+commodity.cid+"</td>";
                        commodities+="<td>"+commodity.cname+"</td>";
                        commodities+="<td>"+commodity.cotype+"</td>";
                        commodities+="<td>"+commodity.cunit+"</td>";
                        commodities+="<td>"+commodity.cprice+"</td>";
                        commodities+="<td><button  cid="+commodity.cid+"  class='delete btn btn-danger' >删除</button>";
                        commodities+="<button  cid="+commodity.cid+" cname="+commodity.cname+" coid="+commodity.coid+" cunit="+commodity.cunit+" cprice="+commodity.cprice+" class='update btn btn-info' >编辑</button></td>";
                        commodities+="</tr>";
                    })//commodity
                    //分页
                    $("#navigatepageNums").empty();
                    $.each(pageInfo.navigatepageNums,function (index,num) {
                        var pageNumbers=$("<li class='pageNumber'>"+num+"</li>");
                        pageNumbers.appendTo("#navigatepageNums");
                        pageNumbers.data("value",num);
                    })//number
                    $("#first").data("value",1);
                    $("#prev").data("value",pageInfo.prePage);
                    $("#next").data("value",pageInfo.nextPage);
                    $("#last").data("value",pageInfo.pages);
                    //页码
                    $(".pageNumber").on("click",function () {
                        getAll($(this).data("value"),pageSize);
                    })
                    page=pageInfo;
                    $("#tbody").html(commodities);
                    //删除
                    $(".delete").on('click',function (e) {
                        e.preventDefault();
                        if(confirm("确定删除？")){
                            $.post("/commodity/delete",{cid:$(this).attr("cid")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    })
                    //修改
                    $(".update").on('click',function () {
                        $("#save").data("op","update");
                        $("#cid").val($(this).attr("cid"));
                        $("#cname").val($(this).attr("cname"));
                        $("#coid").val($(this).attr("coid"));
                        $("#cunit").val($(this).attr("cunit"));
                        $("#cprice").val($(this).attr("cprice"));
                        $("#cid").prop("disabled","disabled");
                        $("#myModal").modal('show');
                    });
                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "update"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj = {cid:$("#cid").val(),cname:$("#cname").val(),
                            coid:$("#coid").val(),cunit:$("#cunit").val(),cprice:$("#cprice").val()};
                        console.log(obj);
                        $.post("/commodity/update",obj,function(){
                            $("tbody").empty();
                            getAll(1,pageSize);
                        });
                    });
                }
            })
        }
        //添加
        $("#content").on("click",".add",function(){
            $("#save").data("op","insert");
            $("#cid").prop("disabled","disabled");
            $("#cid").val("");
            $("#cname").val("");
            $("#coid").val("");
            $("#cunit").val("");
            $("#cprice").val("");
            $("#myModal").modal('show');
        });
        $("#save").click(function(){
            var op = $("#save").data("op");
            if(op != "insert"){
                return;
            }
            $("#myModal").modal('hide');
            var obj = {cid:$("#cid").val(),cname:$("#cname").val(),
                coid:$("#coid").val(),cunit:$("#cunit").val(),cprice:$("#cprice").val()};
            console.log(obj);
            $.post("/commodity/insert",obj,function(){
                $("tbody").empty();
                getAll(1,pageSize);
            });
        });
    });
</script>
</html>
