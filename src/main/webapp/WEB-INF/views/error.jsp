<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>中海集运厦门移动APP后台管理系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/bootstrap/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/lib/font-awesome/css/font-awesome.css'/>" />
<script src="<c:url value='/resources/lib/jquery-1.8.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap/js/bootstrap.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$("[rel=tooltip]").tooltip();
	$(function() {
		$('.demo-cancel-click').click(function() {
			return false;
		});
	});
</script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
<!-- Demo page code -->
<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
</head>

<!--[if lt IE 7 ]>
<body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<body class="ie ie7 http-error"> <![endif]-->
<!--[if IE 8 ]>
<body class="ie ie8 http-error"> <![endif]-->
<!--[if IE 9 ]>
<body class="ie ie9 http-error"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="http-error">
	<!--<![endif]-->
	<div class="row-fluid">
		<div class="http-error">
			<h1>Oops!</h1>

			<p class="info">
				Error code
				<c:out value="${statusCode}" />
				-
				<c:out value="${statusCodeDesc}" />
			</p>
			<p class="info">
				<c:out value="${message}" />
			</p>

			<p>
				<i class="icon-home"></i>
			</p>

			<p>
				<a href="<c:url value='/'/>">返回登录界面</a>
			</p>
		</div>
	</div>
</body>
</html>

