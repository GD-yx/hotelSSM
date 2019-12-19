<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/17
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>旅客消费</title>
    <script src="/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/bootstrap/js/vue.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div class="container" id="app">
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

            </ul>
        </div>
        <div class="col-md-9 column">
            <div style="margin-top: 20px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>旅客消费</h1>
                房间号：<label>${unsettled.roomid}</label>&nbsp;&nbsp;&nbsp;&nbsp;
                旅客姓名：<label>${unsettled.name}</label><br/><br/>
                <button href="#" class="btn-info add">添加消费</button>
                <button href="#" class="btn-info add">返回</button>
            </div>
            <div class="col-md-10 column" id="content">
                <table class="table table-bordered table-hover" style="width: 1000px" text-align="center">
                    <thead>
                    <tr>
                        <th>消费商品</th>
                        <th>计量单位</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>消费金额</th>
                        <th>消费时间</th>
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
                <table>
                    <thead>
                    <tr>
                        <th>商品名称</th>
                        <th>商品类别</th>
                        <th>计量单位</th>
                        <th>销售价格</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="modeltabletbody">

                    </tbody>
                </table>
               <%-- <form class="form-horizontal" role="form">


                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" name="id" v-model = "id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomid" class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roomid" name="roomid" v-model = "roomid"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomtype" class="col-sm-2 control-label">房间类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roomtype" name="roomtype" v-model = "roomtype"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">旅客姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" v-model = "name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="checkdate" class="col-sm-2 control-label">入住日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="checkdate" name="checkdate" v-model = "checkdate"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="settledtime" class="col-sm-2 control-label">结账时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="settledtime" name="settledtime" v-model = "settledtime"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rprice" class="col-sm-2 control-label">住宿费</label>
                        <div class="col-sm-10">
                            <input type="rprice" class="form-control" id="rprice" name="rprice" v-model = "idcard"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cprice" class="col-sm-2 control-label">其他消费</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cprice" name="cprice" v-model = "cprice"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="consume" class="col-sm-2 control-label">结账金额</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="consume" name="consume" v-model = "consume"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="button" id="save" class="btn btn-default">结账</button>
                        </div>
                    </div>
                </form>--%>
            </div>

        </div>
    </div>
</div>

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
                        commodities+="<td>"+commodity.cunit+"</td>";
                        commodities+="<td>"+commodity.cprice+"</td>";
                        commodities+="<td>"+commodity.cprice+"</td>";
                        commodities+="<td>"+commodity.cprice+"</td>";
                        commodities+="<td>"+new Date()+"</td>";
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
            $("#myModal").modal('show');
            getAll(1,pageSize);


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
</body>
</html>
