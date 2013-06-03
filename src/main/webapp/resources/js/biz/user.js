var user_biz = {

	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/user/page.json?ftl=user_list",
			contentType : "application/json",
			dataType : "json",
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				error(XMLHttpRequest);
			},
			success : function(data) {
				success(data);
			}
		});

	},
	table_initial_fn : function() {
		return $('#user-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '新增用户',
							// "sButtonClass" : "btn btn-success",
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#user-form").find("input[id='id']").val("");
								$("#show-dialog").modal("show").css({
									width : '75%',
									'margin-left' : function() {
										return -($(this).width() / 2);
									}
								});
							}
						} ]
					},
					"bProcessing" : true,
					"bServerSide" : true,
					"sAjaxSource" : Utils.ctxPath() + "/user/ajax/list",
					"fnServerData" : function(sSource, aoData, fnCallback, oSettings) {
						oSettings.jqXHR = $.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : fnCallback
						});
					},
					"aoColumnDefs" : [
							{
								"aTargets" : [ 0 ],
								"mData" : "id",
								"mRender" : function(data, type, full) {
									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'user_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'user_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">修改</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "username"
							}, {
								"aTargets" : [ 2 ],
								"mData" : "nickName"
							}, {
								"aTargets" : [ 3 ],
								"mData" : "department",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 4 ],
								"mData" : "enabled",
								"mRender" : function(data, type, full) {
									return (data) ? "是" : "否";
								}
							}, {
								"aTargets" : [ 5 ],
								"mData" : "updated",
								"mRender" : function(data, type, full) {
									return (!data) ? "" : (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
								}
							} ]
				});
	},
	form_initial_fn : function() {
		$("#user-form").submit(function() {
			$("#user-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#user-list-table').dataTable();
			var json = $("#user-form").serializeObject();
			var roleId = json.roleId;
			$.ajax({
				url : Utils.ctxPath() + "/user/ajax/save?roleId=" + roleId,
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(json),
				success : function(data, textStatus) {
					$(".ajax-progress").toggle();
					$("#show-dialog").modal("hide");
					oTable.fnDraw();
				},
				error : function() {
					$(".ajax-progress").toggle();
				}
			});
			return false;
		});

	},
	del_fn : function(id) {
		var oTable = $('#user-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/user/ajax/del/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				oTable.fnDraw();
			},
			error : function() {
				oTable.fnDraw();
			}
		});
	},
	update_fn : function(id) {
		$
				.ajax({
					url : Utils.ctxPath() + "/user/ajax/" + id,
					type : "POST",
					dataType : "json",
					contentType : "application/json",
					success : function(data, textStatus) {
						if (data.addition) {
							$("#user-form").populateJSON2Form(data.addition);
							var roleId = (data.addition.authorities && data.addition.authorities.length > 0) ? data.addition.authorities[0].id
									: "";
							$("#user-form").find("#roleId").val(roleId);
							$("#show-dialog").modal("show").css({
								width : '75%',
								'margin-left' : function() {
									return -($(this).width() / 2);
								}
							});;
						}
					},
					error : function() {
						console.log(arguments);
					}
				});

	}
};

(function(window, $) {
	var page_initial_fns = window.page_initial_fns;
	var table_initial_fns = window.table_initial_fns;
	var form_initial_fns = window.form_initial_fns;
	var event_handler_fns = window.event_handler_fns;
	page_initial_fns["user_info"] = user_biz.page_fetch_fn;
	table_initial_fns["user_info"] = user_biz.table_initial_fn;
	form_initial_fns["user_info"] = user_biz.form_initial_fn;
	event_handler_fns["user_del"] = user_biz.del_fn;
	event_handler_fns["user_update"] = user_biz.update_fn;
})(window, jQuery);