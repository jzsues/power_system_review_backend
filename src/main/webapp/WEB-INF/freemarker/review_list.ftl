<div id="q_div" class="row-fluid">
	<!-- 	<div class="span10">
		<div class="row-fluid alert alert-info"> -->
	<div class="span2">
		<label><b>站点名称</b></label> <input id="q_station_name" type="text" class="input-small">
	</div>
	<div class="span2">
		<label><b>巡检人</b></label> <input id="q_reviever" type="text" class="input-small">
	</div>
	<div class="span2">
		<label><b>是否报警</b></label> <select id="q_alarm" class="input-small">
			<option value="">请选择</option>
			<option value="true">是</option>
			<option value="false">否</option>
		</select>
	</div>
	<div class="span4">
		<label><b>巡检时间段</b></label> 开始：<input id="q_review_time_begin" type="text" class="input-medium datetimepicker"><br>结束：<input
			id="q_review_time_end" type="text" class="input-medium  datetimepicker">
	</div>
	<div class="span2">
		<label>&nbsp;</label>
		<button id="do_query" class="btn btn-block">查询</button>
	</div>
	<!-- 		</div>
	</div> -->
</div>

<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="review-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>是否报警</th>
			<th>设备站点</th>
			<th>巡检人</th>
			<th>巡检地点</th>
			<th>经度</th>
			<th>纬度</th>
			<th>巡检时间</th>
			<th>是否处理</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<div id="show-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="ajax-progress"></div>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">配电设备缺陷巡检信息</h3>
	</div>
	<div class="modal-body">
		<div class="row-fluid">
			<div class="span3">
				<label>站点名称</label> <input id="show_station_name" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span3">
				<label>经度/纬度</label> <input id="show_review_ll" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span6">
				<label>本次巡检地点</label> <input id="show_review_address" type="text" class="input-xlarge" readonly="readonly">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3">
				<label>巡检人</label> <input id="show_review_user" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span3">
				<label>巡检时间</label> <input id="show_review_time" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span6">
				<label>站点地址</label> <input id="show_station_address" type="text" class="input-xlarge" readonly="readonly">
			</div>
		</div>
		<form id="handle-result-form" action="">
			<div class="row-fluid">
				<div class="span8">
					<input type="hidden" id="reviewId" /> <label>处理结果</label>
					<textarea id="handleResult" rows="4" class="input-xxlarge"></textarea>
				</div>
				<div class="span4">
					<label>处理时间</label> <input id="handleTime" type="text" class="input-medium" readonly="readonly"> <label>处理人</label>
					<input id="handleUser" type="text" class="input-medium" readonly="readonly">
				</div>
			</div>
			<div class="span4">
				<button type="submit" class="btn btn-warning" style="position: absolute; top: 50px; right: 50px;">提交处理结果</button>
			</div>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="review-item-list-table">
			<thead>
				<tr>
					<th>结果</th>
					<th>设备类别</th>
					<th>缺陷类型</th>
					<th>缺陷内容</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
