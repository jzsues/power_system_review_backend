<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>电力巡检系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/datatables/css/DT_bootstrap.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/bootstrap-datetimepicker/css/datetimepicker.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/datatables/css/TableTools.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/elements.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/lib/font-awesome/css/font-awesome.css'/>" />
<script src="<c:url value='/resources/lib/jquery-1.8.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/jquery.validate.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/localization/messages_zh.js'/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap/js/bootstrap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"/>" type="text/javascript" charset="UTF-8"></script>
<script src="<c:url value="/resources/lib/datatables/js/jquery.dataTables.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/datatables/js/DT_bootstrap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/datatables/js/ZeroClipboard.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/datatables/js/TableTools.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/biz_meta.js"/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/form.js'/>" type="text/javascript"></script>
<!-- biz js  -->
<script src="<c:url value="/resources/js/menu-processor-holder.js"/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/user.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/func.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/role.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/station.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/qrcode.js'/>" type="text/javascript"></script>
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
</style>
<script type="text/javascript">
	/* Table initialisation */
	function toggleActive(active_id) {
		$(".sidebar-menu").each(function(index, menu) {
			var $menu = $(menu);
			var $li = $menu.parent();

			if ($li) {
				$li.removeClass("active");
			}
		});
		$("#" + active_id).parent().toggleClass("active");
	}
	$(document).ready(function() {
		var page_initial_fns = window.page_initial_fns;
		var table_initial_fns = window.table_initial_fns;
		var form_initial_fns = window.form_initial_fns;
		$(".sidebar-menu").each(function(index, menu) {
			var $menu = $(menu);
			$menu.live("click", {
				"target_id" : $menu.attr("id")
			}, function(event) {
				var target_id = event.data.target_id;
				var fetcher = page_initial_fns[target_id];
				if (fetcher) {
					fetcher(function(data) {
						if (data) {
							var addition = data.addition;
							var content_div = $("#main-content");
							content_div.empty();
							content_div.append(addition);
							table_initial_fns[target_id]();
							form_initial_fns[target_id]();
							toggleActive(target_id);
						}
					});
				}
			});
		});

	});
</script>

</head>

<!--[if lt IE 7 ]>
<body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]>
<body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]>
<body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
	<!--<![endif]-->

	<%@include file="inc/header.jsp"%>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<%@include file="inc/sidebar.jsp"%>
			</div>
			<div id="main-content" class="span9"></div>
		</div>
	</div>
	<%@include file="inc/footer.jsp"%>
</body>
</html>


