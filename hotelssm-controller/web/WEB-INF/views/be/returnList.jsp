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
					<li  class=" conceal">
					    <a class="" href="/admin/borrowbook/add">
					        <span>借阅书籍</span>
					    </a>
					</li>
					<li class="sub-menu  conceal">
						<a class="" href="#">
							<span>图书信息</span><span class="arrow"></span>
						</a>
						<ul class="sub">
							<li class=" conceal">
								<a href="/admin/book/list">书籍信息</a>
							</li>
							<li class="conceal">
								<a class="" href="/admin/book/add">添加书籍</a>
							</li>
						</ul>
					</li>
					<li class="sub-menu active conceal">
						<a href="javascript:;" class="">
							<span>借阅信息查询</span> <span class="arrow"></span>
						</a>
						<ul class="sub">
							<li class="active conceal">
								<a class="" href="/admin/return/list">归还记录</a>
							</li>
							<li class="conceal">
								<a class="" href="/admin/not/list">逾期未归</a>
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
				<h1>归还记录列表</h1>
			</section>
		</section>
		<input type="hidden" id="userId" value="${user.id }">
		<script src="/static/js/bootstrap.min.js"></script>
		<script src="/static/js/common-scripts.js"></script>
		<script type="text/javascript" src="/static/js/menu.js"></script>
	</body>
</html>
