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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/lib/bootstrap-datetimepicker/css/datetimepicker.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/lib/datatables/css/TableTools.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/elements.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/lib/font-awesome/css/font-awesome.css'/>" />
<script src="<c:url value='/resources/lib/jquery-1.8.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/jquery.validate.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/lib/validate/localization/messages_zh.js'/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap/js/bootstrap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"/>"
	type="text/javascript" charset="UTF-8"></script>
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
<script src="<c:url value='/resources/js/biz/checkpoint.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/biz/review.js'/>" type="text/javascript"></script>
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
	var page = 0;
	function loopAlarm() {
		$.ajax({
			url : Utils.ctxPath() + "/review/ajax/alarm/" + page + "/1",
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					var content = data.addition.content;
					if (content.length > 0) {
						page++;
						var review = content[0];
						var alarm_div = $("#alarm_div");
						alarm_div.find("#alarm_user").text(review.userInfo.nickName);
						alarm_div.find("#alarm_time").text(review.reviewTime);
						alarm_div.find("#alarm_id").val(review.id);
						alarm_div.find("#alarm_info").text(review.stationInfo.name);
						alarm_div.removeClass("hidden");
					} else {
						page = 0;
						alarm_div.addClass("hidden");
					}
				}
			},
			error : function() {
				console.log(arguments);
			}
		});
	}
	function showAlarm() {
		var id = $("#alarm_id").val();
		var otable = $('#alarm-review-item-list-table').dataTable({
			"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
			"sPaginationType" : "bootstrap",
			"bRetrieve" : true,
			"oTableTools" : {
				"aButtons" : []
			},
			"bFilter" : false,
			"aaData" : [],
			"aoColumnDefs" : [ {
				"aTargets" : [ 0 ],
				"mData" : "result",
				"mRender" : function(data, type, full) {
					return ("normal" == data) ? "正常" : "异常";
				}
			}, {
				"aTargets" : [ 1 ],
				"mData" : "checkpointInfo",
				"mRender" : function(data, type, full) {
					return (data) ? data.deviceClassInfo.name : "";
				}
			}, {
				"aTargets" : [ 2 ],
				"mData" : "checkpointInfo",
				"mRender" : function(data, type, full) {
					return DefectType[data.defectType];
				}
			}, {
				"aTargets" : [ 3 ],
				"mData" : "checkpointInfo",
				"mRender" : function(data, type, full) {
					return (data) ? data.defectDetail : "";
				}
			} ]
		});
		$.ajax({
			url : Utils.ctxPath() + "/review/ajax/read/" + id,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					// $("#review-form").populateJSON2Form(data.addition);
					otable.fnClearTable();
					var review = data.addition;
					if (review) {
						// console.log(data.addition.reviewItemInfos);
						$("#alarm_show_station_name").val(review.stationInfo.name);
						$("#alarm_show_station_address").val(review.stationInfo.address);
						$("#alarm_show_review_time").val(review.stationInfo.reviewTime);
						$("#alarm_show_review_user").val(review.userInfo.nickName+"-"+review.userInfo.username);
						otable.fnAddData(review.reviewItemInfos);
					}
					$("#alarm-show-dialog").modal("show").css({
						width : '75%',
						'margin-left' : function() {
							return -($(this).width() / 2);
						}
					});
				}
			},
			error : function() {
				console.log(arguments);
			}
		});

	}
	$(document).ready(function() {
		setInterval(loopAlarm, 5000);
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
	<div id="alarm-show-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="ajax-progress"></div>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			<h3 id="myModalLabel">配电设备缺陷巡检信息</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span4">
					<label>站点名称</label> <input id="alarm_show_station_name" type="text" class="input-medium" readonly="readonly">
				</div>
				<div class="span6">
					<label>站点地址</label> <input id="alarm_show_station_address" type="text" class="input-xlarge" readonly="readonly">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span4">
					<label>巡检人</label> <input id="alarm_show_review_user" type="text" class="input-medium" readonly="readonly">
				</div>
				<div class="span6">
					<label>巡检时间</label> <input id="alarm_show_review_time" type="text" class="input-xlarge" readonly="readonly">
				</div>
			</div>
			<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered"
				id="alarm-review-item-list-table">
				<thead>
					<tr>
						<th>结果</th>
						<th>设备类别</th>
						<th>缺陷类型</th>
						<th>缺陷内容</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="inc/footer.jsp"%>
</body>
</html>


