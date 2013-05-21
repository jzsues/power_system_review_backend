<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="qrcode-list-table">
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
		<h3 id="myModalLabel">生成二维码配置</h3>
	</div>
	<div class="modal-body">
		<form id="qrcode-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="name">是否强制刷新</label> 
				<div class="controls">
					<input type="hidden" id="id" name="id">
					<select id="force" name="force" class="input-small" required>
						<option value="true">是</option>
						<option value="false">否</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="width">图像宽度</label>
				<div class="controls">
					<input type="text" id="width" name="width" placeholder="宽度" class="input-small" value="600">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="height">高度</label>
				<div class="controls">
					<input type="text" id="height" name="height" placeholder="高度" class="input-small" value="600">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">执行</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>