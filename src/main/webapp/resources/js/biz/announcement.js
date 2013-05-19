var announcement_biz = {
	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/announcement/page.json?ftl=announcement_list",
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
		return $('#announcement-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '发布公告',
							// "sButtonClass" : "btn btn-success",
							"fnClick" : function(nButton, oConfig, oFlash) {
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
					"sAjaxSource" : Utils.ctxPath() + "/announcement/ajax/list",
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

									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'announcement_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "title"
							}, {
								"aTargets" : [ 2 ],
								"mData" : "type",
								"mRender" : function(data, type, full) {
									return (!AnnouncementType[data]) ? "未知" : AnnouncementType[data];
								}
							}, {
								"aTargets" : [ 3 ],
								"mData" : "status",
								"mRender" : function(data, type, full) {
									return (!AnnouncementStatus[data]) ? "未知" : AnnouncementStatus[data];
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
		$("#announcement-form").submit(function() {
			$("#announcement-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#announcement-list-table').dataTable();
			$.ajax({
				url : Utils.ctxPath() + "/announcement/ajax/save",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify($("#announcement-form").serializeObject()),
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
		var oTable = $('#announcement-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/announcement/ajax/del/" + id,
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

	}

};

(function(window, $) {
	var page_initial_fns = window.page_initial_fns;
	var table_initial_fns = window.table_initial_fns;
	var form_initial_fns = window.form_initial_fns;
	var event_handler_fns = window.event_handler_fns;
	page_initial_fns["announcement_info"] = announcement_biz.page_fetch_fn;
	table_initial_fns["announcement_info"] = announcement_biz.table_initial_fn;
	form_initial_fns["announcement_info"] = announcement_biz.form_initial_fn;
	event_handler_fns["announcement_del"] = announcement_biz.del_fn;
})(window, jQuery);