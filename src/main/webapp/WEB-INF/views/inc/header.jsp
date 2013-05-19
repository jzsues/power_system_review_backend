<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="navbar">
	<div class="navbar-inner">
		<ul class="nav pull-right">

			<li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
			<li id="fat-menu" class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> 测试用户 <i
					class="icon-caret-down"></i>
			</a>

				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#">我的账号</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" class="visible-phone" href="#">账号设置</a></li>
					<li class="divider visible-phone"></li>
					<li><a tabindex="-1" href="<c:url value='/'/>">登出</a></li>
				</ul></li>
		</ul>
		<a class="brand" href="<c:url value='/main'/>"><span class="first">电力巡检系统</span> <span class="second"></span></a>
	</div>
</div>