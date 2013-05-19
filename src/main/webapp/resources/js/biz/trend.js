var trend_biz = {
	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/trend/page.json?ftl=trend_list",
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
		return $('#trend-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '新增船期',
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#trend-form").find("input[id='id']").val("");
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
					"sAjaxSource" : Utils.ctxPath() + "/trend/ajax/list",
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

									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'trend_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'trend_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">修改</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "shipInfo.shipNameCN",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 2 ],
								"mData" : "sailingScheduleInfo.shippingLine"
							}, {
								"aTargets" : [ 3 ],
								"mData" : "sailingScheduleInfo.voyage"
							}, {
								"aTargets" : [ 4 ],
								"mData" : "berth",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 5 ],
								"mData" : "sailDate",
								"mRender" : function(data, type, full) {
									return (!data) ? "" : (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
								}
							}, {
								"aTargets" : [ 6 ],
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
		$("#trend-form").submit(function() {
			$("#trend-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#trend-list-table').dataTable();
			var json = $("#trend-form").serializeObject();
			json.sailDate = (new Date(json.sailDate)).getTime();
			json.customsCutOff = (new Date(json.customsCutOff)).getTime();
			json.customsReleasingCutOff = (new Date(json.customsReleasingCutOff)).getTime();
			json.wharfCutOff = (new Date(json.wharfCutOff)).getTime();
			json.wharfSwitchOff = (new Date(json.wharfSwitchOff)).getTime();
			json.matchOrderCutOff = (new Date(json.matchOrderCutOff)).getTime();
			$.ajax({
				url : Utils.ctxPath() + "/trend/ajax/save?ssid=" + json.ssid,
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
		$('.datetimepicker').datetimepicker({
			format : 'yyyy-mm-dd hh:ii',
			autoclose : true
		});
	},
	del_fn : function(id) {
		var oTable = $('#trend-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/trend/ajax/del/" + id,
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
			url : Utils.ctxPath() + "/trend/ajax/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					var json = data.addition;
					json.sailDate = (new Date(json.sailDate)).format("yyyy-MM-dd hh:mm:ss");
					json.customsCutOff = (new Date(json.customsCutOff)).format("yyyy-MM-dd hh:mm:ss");
					json.customsReleasingCutOff = (new Date(json.customsReleasingCutOff)).format("yyyy-MM-dd hh:mm:ss");
					json.wharfCutOff = (new Date(json.wharfCutOff)).format("yyyy-MM-dd hh:mm:ss");
					json.wharfSwitchOff = (new Date(json.wharfSwitchOff)).format("yyyy-MM-dd hh:mm:ss");
					json.matchOrderCutOff = (new Date(json.matchOrderCutOff)).format("yyyy-MM-dd hh:mm:ss");
					json.ssid = json.sailingScheduleInfo.id;
					$("#trend-form").populateJSON2Form(json);
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
	page_initial_fns["trend_info"] = trend_biz.page_fetch_fn;
	table_initial_fns["trend_info"] = trend_biz.table_initial_fn;
	form_initial_fns["trend_info"] = trend_biz.form_initial_fn;
	event_handler_fns["trend_del"] = trend_biz.del_fn;
	event_handler_fns["trend_update"] = trend_biz.update_fn;
})(window, jQuery);
