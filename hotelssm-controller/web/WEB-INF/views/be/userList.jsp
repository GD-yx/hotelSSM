<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Basic Table</title>
		<link href="/static/css/bootstrap.min.css" rel="stylesheet">
		<link href="/static/css/style.css" rel="stylesheet">
		<script src="/static/js/jquery-3.3.1.min.js"></script>
		
	</head>
	<body>
		<section id="container" class="">
			<header class="header white-bg">
				<a href="#" class="logo">图书 <span>管理</span></a>
			</header>

			<div id="sidebar" class="nav-collapse">
				<ul class="sidebar-menu">
					<li class="">
					    <a class="" href="/home">
					        <span>首页</span>
					    </a>
					</li>

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
		</section>
		<section id="main-content">
			<section class="wrapper">
			
				<button class="btn btn-primary" id="addUser"  data-toggle="modal" data-target="#myModal">添加用户</button>
				<table class="table table-striped table-advance table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>用户名</th>
							<th>角色</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allUser}" var="u">
							<tr>
								<td>${u.id }</td>
								<td>${u.username }</td>
								
								<td>${u.name }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</section>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
		            </div>
		            <div class="modal-body">
		            <form role="form">
						  <div class="form-group">
						    <label for="userName">名称</label>
						    <input type="text" class="form-control" id="userName" placeholder="请输入名称">
						  </div> 
						  <div class="form-group">
						    <label for="password">密码</label>
						    <input type="text" class="form-control" id="password" placeholder="请输入密码">
						  </div>
						  
						  
						  <div class="form-group">
						    <label for="password">角色</label>
						     <select name="role" id="role">
						      <c:forEach items="${roles}" var="r">
									<option value="${r.id }" class="role" >${r.name }</option>
							  </c:forEach>
							  </select>
						  </div>
					</form>
		            	
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" id="submit">保存</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
		
		
		
		
		<input type="hidden" id="userId" value="${user.id }">
		<script src="/static/js/bootstrap.min.js"></script>
		<script src="/static/js/common-scripts.js"></script>
		<script type="text/javascript" src="/static/js/menu.js"></script>
		<script type="text/javascript">
			$("#submit").click(function(){

				$.post("/admin/user/inser",{"userName":$("#userName").val(),"password":$("#password").val(),"roleId":$("#role").find("option:selected").val()},function(result){

        			window.location.reload();
        			
        		})
			})
		</script>
	</body>
</html>
