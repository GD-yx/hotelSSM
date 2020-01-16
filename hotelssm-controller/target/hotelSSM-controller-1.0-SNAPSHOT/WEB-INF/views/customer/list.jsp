<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/9
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
   &lt;%&ndash; <a href="/customer/add">新增</a>&ndash;%&gt;

</div>
<table class="table">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>联系方式</th>
        <th>地址</th>
        <th>身份证号码</th>
        <th>入住日期</th>
        <th>房间号</th>
        <th>操作</th>
    </tr>
    <tbody>
    <c:forEach items="${customers.list}" var="c">
        <tr>

            <td>${c.id}</td>
            <td>${c.name}</td>
            <td>${c.gender}</td>
            <td>${c.phonenumber}</td>
            <td>${c.address}</td>
            <td>${c.idcard}</td>
            <td>${c.checkdate}</td>
            <td>${c.croomid}</td>
            <th>
                <a href="/customer/edit?id=${c.id}">修改</a>
                <a href="/customer/delete?id=${c.id}">删除</a>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="/customer/list?pageNum=1">首页</a></li>
    <li><a href="/customer/list?pageNum=${customers.prePage}">上一页</a></li>
    <c:forEach items="${customers.navigatepageNums}" var="p">
        <li><a href="/customer/list?pageNum=${p}">${p}</a></li>
    </c:forEach>
    <li><a href="/customer/list?pageNum=${customers.nextPage}">下一页</a></li>
    <li><a href="/customer/list?pageNum=${customers.pages}">尾页</a></li>
</ul>
<a href="/index">返回主界面</a>
</body>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户信息管理</title>
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
                <li class="sub-menu  conceal">
                    <a class="" href="#">
                        <span>商品管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class=" conceal">
                            <a href="/commodity/index">商品信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/commoditytype/index">类型管理</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>房间管理</span> <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class=" conceal">
                            <a class="" href="/room/index">房间信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/roomtype/index">类型管理</a>
                        </li>

                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>员工管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/employee/index">员工信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="#">权限管理</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>客户管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/unsettled/index">入住信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/customer/index">客户信息</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>财务管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/consume/index">顾客消费记录</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="#">财务统计</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>基础资料管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/admin/user/list">用户管理</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/admin/role/list">角色管理</a>
                        </li>
                    </ul>
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
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系方式</th>
                        <th>家庭住址</th>
                        <th>身份证</th>
                        <th>入住日期</th>
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
                        <label for="idcard" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="idcard" name="idcard" v-model = "idcard"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="checkdate" class="col-sm-2 control-label">入住日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="checkdate" name="checkdate" v-model = "email"/>
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

    $(function () {
        $(document).ajaxError(function(){
            alert("一个错误发生");
        });


        var page={};
        var pageSize = 4;
        //查询所有
        function getAll(pageNum,pageSize) {
            $.ajax({
                url:"/customer/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var customers = "";
                    $.each(pageInfo.list,function (index,customer) {
                        customers+="<tr>";
                        //customers += "<td>"+customer.id+"</td>";
                        customers += "<td>"+customer.name+"</td>";
                        customers += "<td>"+customer.gender+"</td>";
                        customers += "<td>"+customer.phonenumber+"</td>";
                        customers += "<td>"+customer.address+"</td>";
                        customers += "<td>"+customer.idcard+"</td>";
                        customers += "<td>"+customer.checkdate+"</td>";
                        customers+="<td><button  id="+customer.id+" class='delete btn btn-danger' >删除</button>";
                        customers+="<button  id="+customer.id+" name="+customer.name+" " +
                         "gender="+customer.gender+" phonenumber="+customer.phonenumber+" " +
                         "address="+customer.address+" idcard="+customer.idcard+" " +
                         "checkdate="+customer.checkdate+" class='update btn btn-info' >编辑</button></td>";
                        customers+="</tr>";
                    })//customer

                    //分页
                    $("#navigatepageNums").empty();
                    $.each(pageInfo.navigatepageNums,function (index,num) {
                        var pageNumbers=$("<li class='pageNumber'>"+num+"</li>");
                        pageNumbers.appendTo("#navigatepageNums");
                        pageNumbers.data("value",num);
                    })
                    $("#first").data("value",1);
                    $("#prev").data("value",pageInfo.prevPage);
                    $("#next").data("value",pageInfo.nextPage);
                    $("#last").data("value",pageInfo.pages);


                    $(".pageNumber").on("click",function () {
                        getAll($(this).data("value"),pageSize);
                    })
                    page=pageInfo;
                    $("#tbody").html(customers);

                    //删除
                    $(".delete").on('click',function () {
                        if(confirm("确定删除？")){
                            $.post("/customer/delete",{id:$(this).attr("id")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    });


                    //修改
                    $(".update").on('click',function () {
                        $("#myModal").modal('show');
                        $("#id").prop("disabled","disabled");
                        $("#save").data("op","update");
                        $("#id").val($(this).attr("id"));
                        $("#name").val($(this).attr("name"));
                        $("#gender").val($(this).attr("gender"));
                        $("#address").val($(this).attr("address"));
                        $("#idcard").val($(this).attr("idcard"));
                        $("#phonenumber").val($(this).attr("phonenumber"));
                        $("#checkdate").val($(this).attr("checkdate"));

                    });

                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "update"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj =
                            {id:$("#id").val(),name:$("#name").val(),gender:$("#gender").val(),
                                phonenumber:$("#phonenumber").val(), address:$("#address").val(),
                                idcard:$("#idcard").val(),checkdate:$("#checkdate").val()};
                        console.log(obj);
                        $.post("/customer/update",obj,function(){
                            $("tbody").empty();
                            getAll(1,pageSize);
                        });
                    });

                }
            })

        }
        getAll(1,pageSize);

        //添加
        $("#content").on("click",".add",function () {
            $("#save").data("op","insert");
            $("#id").prop("disabled","disabled");
            $("#id").val("");
            $("#name").val("");
            $("#gender").val("");
            $("#phonenumber").val("");
            $("#address").val("");
            $("#idcard").val("");
            $("#checkdate").val("");
                $("#myModal").modal('show');
        });
        $("#save").click(function () {
            var op  = $("#save").data("op");
            if(op != "insert"){
                return;
            }
            $("#myModal").modal('hide')
            var obj =
                {id:$("#id").val(),name:$("#name").val(),gender:$("#gender").val(),
                phonenumber:$("#phonenumber").val(), address:$("#address").val(),
                idcard:$("#idcard").val(),checkdate:$("#checkdate").val()};
            console.log(obj);
            $.post("/customer/insert",obj,function () {
                $("tbody").empty();
                getAll(1,pageSize);
            });
        });

    });

</script>
</html>
