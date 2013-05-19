var schedule_biz = {
	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/schedule/page.json?ftl=schedule_list",
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
		return $('#schedule-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '新增船期',
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#schedule-form").find("input[id='id']").val("");
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
					"sAjaxSource" : Utils.ctxPath() + "/schedule/ajax/list",
					"aaSorting" : [ [ 0, "desc" ] ],
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

									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'schedule_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'schedule_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">修改</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "shippingLine"
							}, {
								"aTargets" : [ 2 ],
								"mData" : "voyage",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 3 ],
								"mData" : "shipInfo.shipNameCN",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 4 ],
								"mData" : "updated",
								"mRender" : function(data, type, full) {
									return (!data) ? "" : (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
								}
							} ],
					"fnInitComplete" : function(oSettings, json) {

					}
				});
	},
	form_initial_fn : function() {
		$("#schedule-form").submit(function() {
			$("#schedule-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#schedule-list-table').dataTable();
			var json = $("#schedule-form").serializeObject();
			$.ajax({
				url : Utils.ctxPath() + "/schedule/ajax/save?shipId=" + json.shipId,
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
		var oTable = $('#schedule-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/schedule/ajax/del/" + id,
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

		$.ajax({
			url : Utils.ctxPath() + "/schedule/ajax/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					var json = data.addition;
					json.shipId = json.shipInfo.id;
					$("#schedule-form").populateJSON2Form(json);
					$("#show-dialog").modal("show").css({
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
};
(function(window, $) {
	var page_initial_fns = window.page_initial_fns;
	var table_initial_fns = window.table_initial_fns;
	var form_initial_fns = window.form_initial_fns;
	var event_handler_fns = window.event_handler_fns;
	page_initial_fns["schedule_info"] = schedule_biz.page_fetch_fn;
	table_initial_fns["schedule_info"] = schedule_biz.table_initial_fn;
	form_initial_fns["schedule_info"] = schedule_biz.form_initial_fn;
	event_handler_fns["schedule_del"] = schedule_biz.del_fn;
	event_handler_fns["schedule_update"] = schedule_biz.update_fn;
})(window, jQuery);
