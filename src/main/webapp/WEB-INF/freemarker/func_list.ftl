<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="func-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>功能名称</th>
			<th>URL</th>
			<th>排序</th>
			<th>最后更新时间</th>
		</tr>
	</thead>
</table>

<!-- Modal -->
<div id="show-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">功能信息</h3>
	</div>
	<div class="modal-body">
		<form id="func-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="funcName">名称</label>
				<div class="controls">
					<input type="hidden" id="id" name="id"> 
					<input type="text" id="funcName" name="funcName" placeholder="名称" required class="input-large">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funcUrl">URL</label>
				<div class="controls">
					<input type="text" id="funcUrl" name="funcUrl" placeholder="URL" required class="input-large">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funcIndex">排序</label>
				<div class="controls">
					<input type="text" id="funcIndex" name="funcIndex" placeholder="排序" required class="number" class="input-small">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>