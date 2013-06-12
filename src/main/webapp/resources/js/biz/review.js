/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc.
 * 
 * Contributors: ZVIDIA Corporation - initial API and implementation
 ******************************************************************************/
var review_biz = {

	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/review/page.json?ftl=review_list",
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
	populate_query_div : function() {
		var q_div = $("#q_div");
		var q_station_name = q_div.find("#q_station_name").val();
		var q_reviever = q_div.find("#q_reviever").val();
		var q_alarm = q_div.find("#q_alarm").val();
		var q_review_time_begin = q_div.find("#q_review_time_begin").val();
		var q_review_time_end = q_div.find("#q_review_time_end").val();
		return {
			q_station_name : q_station_name,
			q_reviever : q_reviever,
			q_alarm : q_alarm,
			q_review_time_begin : q_review_time_begin,
			q_review_time_end : q_review_time_end
		}

	},
	table_initial_fn : function(alarm, handled) {
		return $('#review-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : []
					},
					"aaSorting" : [ [ 7, "desc" ] ],
					"bProcessing" : true,
					"bServerSide" : true,
					"sAjaxSource" : Utils.ctxPath() + "/review/ajax/list",
					"fnServerParams" : function(aoData) {
						var q = review_biz.populate_query_div();
						if (alarm) {
							q["q_alarm"] = "true";
						}
						if (handled == "true") {
							q["q_handled"] = "true";
						} else if (handled == "false") {
							q["q_handled"] = "false";
						}
						aoData.push({
							"name" : "q",
							"value" : JSON.stringify(q)
						});
					},
					"fnServerData" : function(sSource, aoData, fnCallback, oSettings) {
						oSettings.jqXHR = $.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : fnCallback
						});
					},
					"fnRowCallback" : function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
						if (aData["alarm"]) {
							$(nRow).css("color", "red");
						}
					},
					"aoColumnDefs" : [
							{
								"aTargets" : [ 0 ],
								"mData" : "id",
								"mRender" : function(data, type, full) {
									return '<button  data-id="' + data + '" onclick="window.event_handler_fns[\'review_show\'](' + data
											+ ')" class="btn btn-small del-row-btn">处理</button>';
								}
							}, {
								"aTargets" : [ 1 ],
								"mData" : "alarm",
								"mRender" : function(data, type, full) {
									return (data) ? "是" : "否";
								}
							}, {
								"aTargets" : [ 2 ],
								"mData" : "stationInfo",
								"mRender" : function(data, type, full) {
									if (data) {
										return data.name;
									} else {
										return "无";
									}
								}
							}, {
								"aTargets" : [ 3 ],
								"mData" : "userInfo",
								"mRender" : function(data, type, full) {
									if (data) {
										return data.nickName;
									} else {
										return "无";
									}
								}
							}, {
								"aTargets" : [ 4 ],
								"mData" : "address",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 5 ],
								"mData" : "longitude",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 6 ],
								"mData" : "latitude",
								"mRender" : function(data, type, full) {
									return data;
								}
							}, {
								"aTargets" : [ 7 ],
								"mData" : "updated",
								"mRender" : function(data, type, full) {
									return (!data) ? "" : (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
								}
							}, {
								"aTargets" : [ 8 ],
								"mData" : "handled",
								"mRender" : function(data, type, full) {
									return (data) ? "是" : "否";
								}
							} ]
				});
	},
	form_initial_fn : function() {
		$("#do_query").bind("click", function() {
			var oTable = $('#review-list-table').dataTable();
			oTable.fnDraw();
		});
		$('.datetimepicker').datetimepicker({
			format : 'yyyy-mm-dd hh:ii',
			autoclose : true
		});
		$("#review-form").submit(function() {
			$("#review-form").validate();
			$(".ajax-progress").toggle();
			var oTable = $('#review-list-table').dataTable();
			$.ajax({
				url : Utils.ctxPath() + "/review/ajax/save",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify($("#review-form").serializeObject()),
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
		$("#handle-result-form").submit(
				function() {
					$(".ajax-progress").toggle();
					var oTable = $('#review-list-table').dataTable();
					$.ajax({
						url : Utils.ctxPath() + "/review/ajax/handle/" + $("#handle-result-form").find("#reviewId").val() + "?result="
								+ $("#handle-result-form").find("#handleResult").val(),
						type : "POST",
						dataType : "json",
						contentType : "application/json",
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
		var oTable = $('#review-list-table').dataTable();
		$.ajax({
			url : Utils.ctxPath() + "/review/ajax/del/" + id,
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
			url : Utils.ctxPath() + "/review/ajax/" + id,
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus) {
				if (data.addition) {
					$("#review-form").populateJSON2Form(data.addition);
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
	},
	show_fn : function(id) {
		var otable = $('#review-item-list-table').dataTable({
			"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
			"sPaginationType" : "bootstrap",
			"bRetrieve" : true,
			"oTableTools" : {
				"aButtons" : []
			},
			"bFilter" : false,
			"aaData" : [],
			"fnRowCallback" : function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
				if (aData["alarm"]) {
					$(nRow).css("color", "red");
				}
			},
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
		$
				.ajax({
					url : Utils.ctxPath() + "/review/ajax/" + id,
					type : "POST",
					dataType : "json",
					contentType : "application/json",
					success : function(data, textStatus) {
						if (data.addition) {
							// $("#review-form").populateJSON2Form(data.addition);
							otable.fnClearTable();
							var review = data.addition;
							if (review) {
								// console.log(data.addition.reviewItemInfos);
								$("#show_review_address").val(review.address);
								$("#show_review_ll").val(review.longitude + "/" + review.latitude);
								$("#show_station_name").val(review.stationInfo.name);
								$("#show_station_address").val(review.stationInfo.address);
								$("#show_review_time").val(
										(!review.reviewTime) ? "" : (new Date(review.reviewTime)).format("yyyy-MM-dd hh:mm:ss"));
								$("#show_review_user").val(review.userInfo.nickName + "-" + review.userInfo.username);

								$("#reviewId").val(review.id);
								$("#handleResult").val(review.handleResult);
								$("#handleTime").val(
										(!review.handleTime) ? "" : (new Date(review.handleTime)).format("yyyy-MM-dd hh:mm:ss"));
								if (review.handleUserInfo) {
									$("#handleUser").val(review.handleUserInfo.nickName);
								}

								otable.fnAddData(review.reviewItemInfos);
							}
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
	page_initial_fns["review_info"] = review_biz.page_fetch_fn;
	table_initial_fns["review_info"] = review_biz.table_initial_fn;
	form_initial_fns["review_info"] = review_biz.form_initial_fn;
	event_handler_fns["review_del"] = review_biz.del_fn;
	event_handler_fns["review_update"] = review_biz.update_fn;
	event_handler_fns["review_show"] = review_biz.show_fn;
})(window, jQuery);