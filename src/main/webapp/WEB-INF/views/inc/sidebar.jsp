<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="sidebar-nav">
	<a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>功能模块</a>
	<ul id="dashboard-menu" class="nav nav-list collapse in">
		<li><a class="sidebar-menu" id="w_info" href="#">巡检历史<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="station_info" href="#">巡检站点配置<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="checkpoint_info" href="#">巡检内容配置<i class="icon-chevron-right"></i></a></li>
	</ul>

	<a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>系统管理</a>
	<ul id="accounts-menu" class="nav nav-list collapse in">
		<li><a class="sidebar-menu" id="qrcode_info" href="#">二维码管理<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="user_info" href="#">用户管理<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="role_info" href="#">角色管理<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="func_info" href="#">权限管理<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="setting_info" href="#">系统参数<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="qrcode_info" href="#">二维码生成<i class="icon-chevron-right"></i></a></li>
	</ul>

	<a href="#help-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>帮助</a>
	<ul id="help-menu" class="nav nav-list collapse in">
		<li><a class="sidebar-menu" id="introduce_info" href="#">用户指南<i class="icon-chevron-right"></i></a></li>
		<li><a class="sidebar-menu" id="version_info" href="#">版本信息<i class="icon-chevron-right"></i></a></li>
	</ul>
</div>