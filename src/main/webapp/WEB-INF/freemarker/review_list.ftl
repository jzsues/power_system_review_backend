<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="review-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>是否报警</th>
			<th>设备站点</th>
			<th>巡检人</th>
			<th>巡检时间</th>
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
			<div class="span4">
				<label>站点名称</label> <input id="show_station_name" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span6">
				<label>站点地址</label> <input id="show_station_address" type="text" class="input-xlarge" readonly="readonly">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span4">
				<label>巡检人</label> <input id="show_review_user" type="text" class="input-medium" readonly="readonly">
			</div>
			<div class="span6">
				<label>巡检时间</label> <input id="show_review_time" type="text" class="input-xlarge" readonly="readonly">
			</div>
		</div>
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
