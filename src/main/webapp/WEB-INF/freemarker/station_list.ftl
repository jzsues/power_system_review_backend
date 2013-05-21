<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="station-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>名称</th>
			<th>地址</th>
			<th>二维码</th>
			<th>最后更新时间</th>
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
		<h3 id="myModalLabel">配电设备站点信息</h3>
	</div>
	<div class="modal-body">
		<form id="station-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="name">名称</label>
				<div class="controls">
					<input type="hidden" id="id" name="id"> 
					<input type="text" id="name" name="name" placeholder="名称" class="input-large">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address">地址</label>
				<div class="controls">
					<input type="text" id="address" name="address" placeholder="地址" class="input-xxlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="remark">备注</label>
				<div class="controls">
					<input type="text" id="remark" name="remark" placeholder="备注" class="">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>
