/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
var func_biz = {

	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/func/page.json?ftl=func_list",
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
		return $('#func-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '新增功能',
							// "sButtonClass" : "btn btn-success",
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#func-form").find("input[id='id']").val("");
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
					"sAjaxSource" : Utils.ctxPath() + "/func/ajax/list",
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
									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'func_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'func_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">修改</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "funcName"
							}, {
								"aTargets" : [ 2 ],
								"mData" : "funcUrl"
							}, {
								"aTargets" : [ 3 ],
								"mData" : "funcIndex",
								"mRender" : function(data, type, full) {
									return data;
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
		$("#func-form").submit(function() {
			$("#func-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#func-list-table').dataTable();
			$.ajax({
				url : Utils.ctxPath() + "/func/ajax/save",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify($("#func-form").serializeObject()),
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
		var oTable = $('#func-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/func/ajax/del/" + id,
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
			url : Utils.ctxPath() + "/func/ajax/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					$("#func-form").populateJSON2Form(data.addition);
					$("#show-dialog").modal("show");
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
	page_initial_fns["func_info"] = func_biz.page_fetch_fn;
	table_initial_fns["func_info"] = func_biz.table_initial_fn;
	form_initial_fns["func_info"] = func_biz.form_initial_fn;
	event_handler_fns["func_del"] = func_biz.del_fn;
	event_handler_fns["func_update"] = func_biz.update_fn;
})(window, jQuery);