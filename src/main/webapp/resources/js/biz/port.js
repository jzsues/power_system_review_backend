var port_biz = {
	page_fetch_fn : function(success, error) {
		$.ajax({
			url : Utils.ctxPath() + "/port/page.json?ftl=port_list",
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
		return $('#port-list-table').dataTable({
			"sDom" : "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
			"sPaginationType" : "bootstrap",
			"oTableTools" : {
				"aButtons" : []
			},
			"bProcessing" : true,
			"bServerSide" : true,
			"sAjaxSource" : Utils.ctxPath() + "/port/ajax/list",
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
			"aoColumnDefs" : [ {
				"aTargets" : [ 0 ],
				"mData" : "id",
				"mRender" : function(data, type, full) {
					return data;
				}
			}, {
				"aTargets" : [ 1 ],
				"mData" : "portCode"
			}, {
				"aTargets" : [ 2 ],
				"mData" : "cname",
				"mRender" : function(data, type, full) {
					return data;
				}
			}, {
				"aTargets" : [ 3 ],
				"mData" : "ename",
				"mRender" : function(data, type, full) {
					return data;
				}
			}, {
				"aTargets" : [ 3 ],
				"mData" : "countryCode",
				"mRender" : function(data, type, full) {
					return data;
				}
			}],
			"fnInitComplete" : function(oSettings, json) {

			}
		});
	},
	form_initial_fn : function() {

	},
	del_fn : function(id) {

	},
	update_fn : function(id) {

	}
};
(function(window, $) {
	var page_initial_fns = window.page_initial_fns;
	var table_initial_fns = window.table_initial_fns;
	var form_initial_fns = window.form_initial_fns;
	var event_handler_fns = window.event_handler_fns;
	page_initial_fns["port_info"] = port_biz.page_fetch_fn;
	table_initial_fns["port_info"] = port_biz.table_initial_fn;
	form_initial_fns["port_info"] = port_biz.form_initial_fn;
	event_handler_fns["port_del"] = port_biz.del_fn;
	event_handler_fns["port_update"] = port_biz.update_fn;
})(window, jQuery);
