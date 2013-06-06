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
var checkpoint_biz = {

	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/checkpoint/page.json?ftl=checkpoint_list",
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
		return $('#checkpoint-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : [ {
							"sExtends" : "text",
							"sButtonText" : '新增巡检内容',
							// "sButtonClass" : "btn btn-success",
							"fnClick" : function(nButton, oConfig, oFlash) {
								$("#checkpoint-form").find("input[id='id']").val("");
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
					"sAjaxSource" : Utils.ctxPath() + "/checkpoint/ajax/list",
					"fnServerData" : function(sSource, aoData, fnCallback, oSettings) {
						oSettings.jqXHR = $.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : fnCallback
						});
					},
					"aaSorting" : [ [ 5, "desc" ] ],
					"aoColumnDefs" : [
							{
								"aTargets" : [ 0 ],
								"mData" : "id",
								"mRender" : function(data, type, full) {
									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'checkpoint_del\'](' + data
											+ ')" class="btn btn-small del-row-btn">删除</button>' + '<button  data-id="' + data
											+ '" onclick="window.event_handler_fns[\'checkpoint_update\'](' + data
											+ ')" class="btn btn-small del-row-btn">修改</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "deviceClassInfo",
								"mRender" : function(data, type, full) {
									return data.name;
								}
							}, {
								"aTargets" : [ 2 ],
								"mData" : "defectType"
							}, {
								"aTargets" : [ 3 ],
								"mData" : "defectDetail",
								"mRender" : function(data, type, full) {
									return data
								}
							}, {
								"aTargets" : [ 4 ],
								"mData" : "alarm",
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
		$("#checkpoint-form").submit(function() {
			$("#checkpoint-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#checkpoint-list-table').dataTable();
			var json = $("#checkpoint-form").serializeObject();
			$.ajax({
				url : Utils.ctxPath() + "/checkpoint/ajax/save?deviceClassId=" + json.deviceClassId,
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
		var oTable = $('#checkpoint-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/checkpoint/ajax/del/" + id,
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
			url : Utils.ctxPath() + "/checkpoint/ajax/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					$("#checkpoint-form").populateJSON2Form(data.addition);
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
	page_initial_fns["checkpoint_info"] = checkpoint_biz.page_fetch_fn;
	table_initial_fns["checkpoint_info"] = checkpoint_biz.table_initial_fn;
	form_initial_fns["checkpoint_info"] = checkpoint_biz.form_initial_fn;
	event_handler_fns["checkpoint_del"] = checkpoint_biz.del_fn;
	event_handler_fns["checkpoint_update"] = checkpoint_biz.update_fn;
})(window, jQuery);