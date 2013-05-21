var qrcode_biz = {

	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/qrcode/page.json?ftl=qrcode_list",
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
		return $('#qrcode-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '批量生成',
							// "sButtonClass" : "btn btn-success",
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#qrcode-form").find("input[id='id']").val("-1");
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
					"sAjaxSource" : Utils.ctxPath() + "/qrcode/ajax/list",
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
									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'qrcode_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">清除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'qrcode_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">刷新</button>';
								}
							},
							{
								"aTargets" : [ 1 ],
								"mData" : "name"
							},
							{
								"aTargets" : [ 2 ],
								"mData" : "address"
							},
							{
								"aTargets" : [ 3 ],
								"mData" : "qrCodeInfo",
								"mRender" : function(data, type, full) {
									if (data) {
										return "<a target='_blank' href='" + data.url + "'><img width='100' height='100' src='" + data.url
												+ "'></a>";
									} else {
										return "无";
									}
								}
							}, {
								"aTargets" : [ 4 ],
								"mData" : "updated",
								"mRender" : function(data, type, full) {
									return (!data) ? "" : (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
								}
							} ]
				});
	},
	form_initial_fn : function() {
		$("#qrcode-form").submit(function() {
			$("#qrcode-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#qrcode-list-table').dataTable();
			var json = $("#qrcode-form").serializeObject();
			$.ajax({
				url : Utils.ctxPath() + "/qrcode/generate/" + json.id,
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
		var oTable = $('#qrcode-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/qrcode/clean/" + id,
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
		$("#qrcode-form").find("input[id='id']").val(id);
		$("#show-dialog").modal("show").css({
			width : '75%',
			'margin-left' : function() {
				return -($(this).width() / 2);
			}
		});
	}
};

(function(window, $) {
	var page_initial_fns = window.page_initial_fns;
	var table_initial_fns = window.table_initial_fns;
	var form_initial_fns = window.form_initial_fns;
	var event_handler_fns = window.event_handler_fns;
	page_initial_fns["qrcode_info"] = qrcode_biz.page_fetch_fn;
	table_initial_fns["qrcode_info"] = qrcode_biz.table_initial_fn;
	form_initial_fns["qrcode_info"] = qrcode_biz.form_initial_fn;
	event_handler_fns["qrcode_del"] = qrcode_biz.del_fn;
	event_handler_fns["qrcode_update"] = qrcode_biz.update_fn;
})(window, jQuery);