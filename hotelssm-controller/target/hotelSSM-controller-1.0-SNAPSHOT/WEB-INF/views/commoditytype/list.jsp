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
    <script src="/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/bootstrap/js/vue.js"></script>
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

    </div>
    <!-- 第二行 -->
    <div class="row clearfix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li> <i class="icon icon-archive"></i>商品
                    <a href="/commodity/index"><i class="icon icon-archive"></i>商品管理</a>
                    <a href="/commoditytype/index"><i class="icon icon-archive"></i>类型管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>房间
                    <a href="/room/index"><i class="icon icon-archive"></i>房间管理</a>
                    <a href="/roomtype/index"><i class="icon icon-archive"></i>类型管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>员工
                    <a href="/employee/index"><i class="icon icon-archive"></i>员工管理</a>
                    <a href="#"><i class="icon icon-archive"></i>权限管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>客户
                    <a href="/unsettled/index"><i class="icon icon-archive"></i>入住信息</a>
                    <a href="/customer/index"><i class="icon icon-archive"></i>客户信息</a>
                </li>
                <li> <i class="icon icon-archive"></i>财务管理
                    <a href="/consume/index"><i class="icon icon-archive"></i>顾客消费记录</a>
                    <a href="#"><i class="icon icon-archive"></i>财务统计</a>
                </li>
            </ul>
        </div>
        <div class="col-md-9 column">

    <%--搜索--%>
           <%-- <div class="input-group" style="margin-bottom: 20px">
                <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
                     id="searchboxExample">
                    <input id="inputSearchExample3" type="search" style="width: 200px;"
                           class="form-control search-input" placeholder="按名字搜索">
                    <label for="inputSearchExample3" class="input-control-icon-left search-icon"
                           style="top: 8px;"><i class="icon icon-search"></i></label>
                    <span class="input-group-btn">
   				                 <button class="btn btn-primary" type="button" @click="searchName()">搜索</button>
                            </span>
                </div>
            </div>--%>
    <%--显示--%>
            <div class="col-md-10 column" id="content">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>名称</th>
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
    <!-- 第三行 -->
    <div class="row clearfix">
        <div class="col-md-12 column">
            <!-- 绝对水平居中的方法 -->
            <div class="center-block" style="width:400px;
			max-width:100%;
			background-color:#ccc;">
                <h3>没有版权，想怎样就怎样！</h3>
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
                        <label for="coid" class="col-sm-2 control-label">分类编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="coid" name="coid" v-model = "coid"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cotype" class="col-sm-2 control-label">分类名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cotype" name="cotype" v-model = "cotype"/>
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
<%--<script src="/static/bootstrap/js/commoditytype/list.js"></script>--%>

<script type="text/javascript">
    $(function(){
        $(document).ajaxError(function(){
            alert("一个错误发生");
        });


        var page = {};
        var pageSize=4;
        //查询所有
        function getAll(pageNum,pageSize){
            $.ajax({
                url:"/commoditytype/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var commoditytypes = "";
                    $.each(pageInfo.list,function (index,commoditytype) {
                        commoditytypes+="<tr>";
                        //commoditytypes+="<td>"+commoditytype.coid+"</td>";
                        commoditytypes+="<td>"+commoditytype.cotype+"</td>";
                        commoditytypes+="<td><button  coid="+commoditytype.coid+"  class='delete btn btn-danger' >删除</button>";
                        commoditytypes+="<button coid="+commoditytype.coid+" cotype="+commoditytype.cotype+" class='update btn btn-info' >编辑</button></td>";
                        commoditytypes+="</tr>";

                    })//commoditytype

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
                    $("#tbody").html(commoditytypes);

                    //删除
                    $(".delete").on('click',function (e) {
                        e.preventDefault();
                        if(confirm("确定删除？")){
                            $.post("/commoditytype/delete",{coid:$(this).attr("coid")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    })

                    //修改
                    $(".update").on('click',function () {
                        $("#myModal").modal('show');
                        $("#save").data("op","update");
                        $("#coid").val($(this).attr("coid"));
                        $("#cotype").val($(this).attr("cotype"));
                        $("#coid").prop("disabled","disabled");

                    });

                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "update"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj = {coid:$("#coid").val(),cotype:$("#cotype").val()};
                        console.log(obj);
                        $.post("/commoditytype/update",obj,function(){
                            $("tbody").empty();
                            getAll(1,pageSize);
                        });

                    });

                }
            })

        }
        getAll(1,pageSize);

        //添加
        $("#content").on("click",".add",function(){
            $("#save").data("op","insert");
            $("#coid").prop("disabled","disabled");
            $("#coid").val("");
            $("#cotype").val("");
            $("#myModal").modal('show');

        });
        $("#save").click(function(){
            var op = $("#save").data("op");
            if(op != "insert"){
                return;
            }
            $("#myModal").modal('hide');
            var obj = {coid:$("#coid").val(),cotype:$("#cotype").val()};
            console.log(obj);
            $.post("/commoditytype/insert",obj,function(){
                $("tbody").empty();
                getAll(1,pageSize);
            });
        });
    });

</script>
</html>
