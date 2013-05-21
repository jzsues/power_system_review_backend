<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="role-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>编码</th>
			<th>描述</th>
			<th>最后更新时间</th>
		</tr>
	</thead>
</table>

<!-- Modal -->
<div id="show-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="ajax-progress"></div>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">功能信息</h3>
	</div>
	<div class="modal-body">
		<form id="role-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="authority">编码</label>
				<div class="controls">
					<input type="hidden" id="id" name="id"> <input type="text" id="authority" name="authority" placeholder="编码"
						required class="input-large">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="roleDesc">描述</label>
				<div class="controls">
					<input type="text" id="roleDesc" name="roleDesc" placeholder="描述" required class="input-large">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>