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
	table_initial_fn : function() {
		return $('#review-list-table').dataTable(
				{
					"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oTableTools" : {
						"aButtons" : []
					},
					"aaSorting" : [ [ 7, "desc" ] ],
					"bProcessing" : true,
					"bServerSide" : true,
					"sAjaxSource" : Utils.ctxPath() + "/review/ajax/list",
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
											+ ')" class="btn btn-small del-row-btn">查看</button>';
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
								if(review.handleUserInfo){
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