<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="navbar">
	<div class="navbar-inner">
		<ul class="nav pull-right">
			<li style="padding-top: 7px;"><div class="alert hidden" id="alarm_div">
					<a href="#" onclick="javascript:showAlarm();" style="color: #b94a48;" title=""><i
						class=" icon-exclamation-sign"></i><strong>设备巡检高危缺陷提醒信息:</strong> <input type="hidden" id="alarm_id" /> 巡检员:<span
						id="alarm_user"></span>, 巡检时间:<span id="alarm_time"></span>, 设备站点:<span id="alarm_info"></span> </a>
				</div></li>
			<li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button"><i class="icon-wrench"></i>设置</a></li>
			<li id="fat-menu" class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
					<i class="icon-user"></i> <c:out value="${nickName}" /> <i class="icon-caret-down"></i>
			</a>

				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#">我的账号</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" class="visible-phone" href="#">账号设置</a></li>
					<li class="divider visible-phone"></li>
					<li><a tabindex="-1" href="<c:url value='/logout'/>">登出</a></li>
				</ul></li>
		</ul>
		<a class="brand" href="<c:url value='/main'/>"><span class="first"><c:out value="${department}" /></span> <span
			class="second">电力设备巡检系统</span></a>
	</div>
</div>