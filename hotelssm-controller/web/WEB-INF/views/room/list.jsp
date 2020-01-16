<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间管理</title>
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
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>房间号</th>
                        <th>类型</th>
                        <th>状态</th>
                        <th>价格</th>
                        <th>备注</th>
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
                        <label for="roomid" class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roomid" name="roomid" v-model = "roomid"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="rtype" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <%--<input type="text" class="form-control" id="coid" name="coid" v-model = "coid"/>--%>
                            <select id="rtype" name="rtype">
                                <c:forEach items="${roomtypes.list}" var="r">
                                    <option value="${r.rtid}" selected>${r.rtname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <%--<input type="text" class="form-control" id="cunit" name="cunit" v-model = "cunit"/>--%>
                            <select id="status" name="status">
                                <option value="空房" selected>空房</option>
                                <option value="自用房" selected>自用房</option>
                                <option value="预定" selected>预定</option>
                                <option value="待清洁" selected>待清洁</option>
                                <option value="待维修" selected>待维修</option>
                                <option value="满" selected>满</option>
                                <option value="不可用" selected>不可用</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rprice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="rprice" name="rprice" v-model = "rprice"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="remark" name="remark" v-model = "remark"/>
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
                url:"/room/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var rooms = "";
                    $.each(pageInfo.list,function (index,room) {
                        rooms+="<tr>";
                        rooms+="<td>"+room.roomid+"</td>";
                        rooms+="<td>"+room.rtname+"</td>";
                        rooms+="<td>"+room.status+"</td>";
                        rooms+="<td>"+room.rprice+"</td>";
                        rooms+="<td>"+room.remark+"</td>";
                        rooms+="<td><button  roomid="+room.roomid+"  class='delete btn btn-danger' >删除</button>";
                        rooms+="<button  roomid="+room.roomid+" rtype="+room.rtype+" status="+room.status+" rprice="+room.rprice+" remark="+room.remark+" class='update btn btn-info' >编辑</button></td>";
                        rooms+="</tr>";

                    })//room

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
                    $("#tbody").html(rooms);

                    //删除
                    $(".delete").on('click',function (e) {
                        e.preventDefault();
                        if(confirm("确定删除？")){
                            $.post("/room/delete",{roomid:$(this).attr("roomid")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    })

                    //修改
                    $(".update").on('click',function () {
                        $("#save").data("op","update");
                        $("#roomid").val($(this).attr("roomid"));
                        $("#rtid").val($(this).attr("rtid"));
                        $("#status").val($(this).attr("status"));
                        $("#rprice").val($(this).attr("rprice"));
                        $("#remark").val($(this).attr("remark"));
                        $("#roomid").prop("disabled","disabled");
                        $("#myModal").modal('show');
                    });

                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "update"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj = {roomid:$("#roomid").val(),rtype:$("#rtype").val(),
                            status:$("#status").val(),rprice:$("#rprice").val(),remark:$("#remark").val()};
                        console.log(obj);
                        $.post("/room/update",obj,function(){
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
            //$("#roomid").prop("disabled","disabled");
            $("#roomid").val("");
            $("#rtid").val("");
            $("#status").val("");
            $("#rprice").val("");
            $("#remark").val("");
            $("#myModal").modal('show');

        });
        $("#save").click(function(){
            var op = $("#save").data("op");
            if(op != "insert"){
                return;
            }
            $("#myModal").modal('hide');
            var obj = {roomid:$("#roomid").val(),rtype:$("#rtype").val(),
                status:$("#status").val(),rprice:$("#rprice").val(),remark:$("#remark").val()};
            console.log(obj);
            $.post("/room/insert",obj,function(){
                $("tbody").empty();
                getAll(1,pageSize);
            });
        });
    });

</script>
</html>




