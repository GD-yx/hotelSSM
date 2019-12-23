<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/5
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
    <a href="/employee/add">新增</a>

</div>
<table class="table">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>出生日期</th>
        <th>身份证号码</th>
        <th>邮箱</th>
        <th>电话号码</th>
        <th>地址</th>
        <th>职位</th>
        <th>操作</th>
    </tr>
    <tbody>
    <c:forEach items="${employees.list}" var="e">
        <tr>

            <td>${e.id}</td>
            <td>${e.name}</td>
            <td>${e.gender}</td>
            <td>${e.time}</td>
            <td>${e.idcard}</td>
            <td>${e.email}</td>
            <td>${e.phonenumber}</td>
            <td>${e.address}</td>
            <td>${e.position}</td>
            <th>
                <a href="/employee/edit?id=${e.id}">修改</a>
                <a href="/employee/delete?id=${e.id}">删除</a>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/employee/list?pageNum=1">首页</a></li>
    <li><a href="/employee/list?pageNum=${employees.prePage}">上一页</a></li>
    <c:forEach items="${employees.navigatepageNums}" var="p">
        <li><a href="/employee/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/employee/list?pageNum=${employees.nextPage}">下一页</a></li>
    <li><a href="/employee/list?pageNum=${employees.pages}">尾页</a></li>
</ul>
<a href="/index">返回主界面</a>
</body>
</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工管理</title>
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
                <table class="table table-bordered table-hover" style="width: 1000px">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>性别</th>
                        <th>出生日期</th>
                        <th>身份证</th>
                        <th>邮箱</th>
                        <th>联系方式</th>
                        <th>地址</th>
                        <th>职位</th>
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
                        <label for="id" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" name="id" v-model = "id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" v-model = "name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="gender" name="gender" v-model = "gender"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="birthday" name="birthday" v-model = "birthday"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idcard" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="idcard" name="idcard" v-model = "idcard"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" v-model = "email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phonenumber" name="phonenumber" v-model = "phonenumber"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="address" name="address" v-model = "address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="position" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="position" name="position" v-model = "position"/>
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
                url:"/employee/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var employees = "";
                    $.each(pageInfo.list,function (index,employee) {
                        employees+="<tr>";
                        //employee+="<td>"+employee.id+"</td>";
                        employees+="<td>"+employee.name+"</td>";
                        employees+="<td>"+employee.gender+"</td>";
                        employees+="<td>"+employee.birthday+"</td>";
                        employees+="<td>"+employee.idcard+"</td>";
                        employees+="<td>"+employee.email+"</td>";
                        employees+="<td>"+employee.phonenumber+"</td>";
                        employees+="<td>"+employee.address+"</td>";
                        employees+="<td>"+employee.position+"</td>";
                        employees+="<td><button  id="+employee.id+"  class='delete btn btn-danger' >删除</button>";
                        employees+="<button id="+employee.id+" name="+employee.name+" " +
                            "birthday="+employee.birthday+" idcard="+employee.idcard+" " +
                            "email="+employee.email+" phonenumber="+employee.phonenumber+" " +
                            "address="+employee.address+" position="+employee.position+"  " +
                            "gender="+employee.gender+" class='update btn btn-info' >编辑</button></td>";
                        employees+="</tr>";

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
                    $("#tbody").html(employees);

                    //删除
                    $(".delete").on('click',function (e) {
                        e.preventDefault();
                        if(confirm("确定删除？")){
                            $.post("/employee/delete",{id:$(this).attr("id")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    })

                    //修改
                    $(".update").on('click',function () {
                        $("#myModal").modal('show');
                        $("#id").prop("disabled","disabled");
                        $("#save").data("op","update");
                        $("#id").val($(this).attr("id"));
                        $("#name").val($(this).attr("name"));
                        $("#gender").val($(this).attr("gender"));
                        $("#birthday").val($(this).attr("birthday"));
                        $("#idcard").val($(this).attr("idcard"));
                        $("#email").val($(this).attr("email"));
                        $("#phonenumber").val($(this).attr("phonenumber"));
                        $("#address").val($(this).attr("address"));
                        $("#position").val($(this).attr("position"));


                    });

                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "update"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj = {id:$("#id").val(),name:$("#name").val(),gender:$("#gender").val(),
                            birthday:$("#birthday").val(),idcard:$("#idcard").val(),email:$("#email").val(),
                            phonenumber:$("#phonenumber").val(),address:$("#address").val(),position:$("#position").val()};
                        console.log(obj);
                        $.post("/employee/update",obj,function(){
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
            $("#id").prop("disabled","disabled");
            $("#id").val("");
            $("#name").val("");
            $("#gender").val("");
            $("#birthday").val("");
            $("#idcard").val("");
            $("#email").val("");
            $("#phonenumber").val("");
            $("#address").val("");
            $("#position").val("");
            $("#myModal").modal('show');

        });
        $("#save").click(function(){
            var op = $("#save").data("op");
            if(op != "insert"){
                return;
            }
            $("#myModal").modal('hide');
            var obj = {id:$("#id").val(),name:$("#name").val(),gender:$("#gender").val(),
                birthday:$("#birthday").val(),idcard:$("#idcard").val(),email:$("#email").val(),
                phonenumber:$("#phonenumber").val(),address:$("#address").val(),position:$("#position").val()};
            console.log(obj);
            $.post("/employee/insert",obj,function(){
                $("tbody").empty();
                getAll(1,pageSize);
            });
        });
    });

</script>
</html>