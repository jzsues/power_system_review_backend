<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>电力设备巡检系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/bootstrap/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/lib/font-awesome/css/font-awesome.css'/>" />
<script src="<c:url value='/resources/lib/jquery-1.8.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/jquery.validate.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/localization/messages_zh.js'/>" type="text/javascript"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"/>
    <![endif]-->
<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png" />
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body>
	<!--<![endif]-->

	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<ul class="nav pull-right">

				</ul>
				<a class="brand" href='<c:url value="/"/>'><span class="first"></span> <span class="second">电力设备巡检系统</span></a>
			</div>
		</div>
	</div>


	<div class="container-fluid">
		<div class="row-fluid">
			<div class="dialog span4">
				<div class="block">
					<div class="block-heading">请登陆</div>
					<div class="block-body">
						<form action="<c:url value='/j_spring_security_check'/>" method="post">
							<label>用户名</label> <input id="username" name="username" type="text" class="span12" required> <label>密码</label>
							<input id="password" name="password" type="password" class="span12" required>
							<button type="submit" class="btn btn-primary pull-right">登陆</button>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${param.error == 'true' && sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message!=null}">
			<div class="row-fluid">
				<div class="span4"></div>
				<div class="alert alert-error span4 ">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<span>${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }</span>
				</div>
				<div class="span4"></div>
			</div>
		</c:if>
	</div>
</body>
</html>