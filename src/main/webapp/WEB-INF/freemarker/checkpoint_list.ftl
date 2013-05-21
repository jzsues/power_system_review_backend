<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="checkpoint-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>设备类别</th>
			<th>缺陷类型</th>
			<th>缺陷内容</th>
			<th>是否报警</th>
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
		<h3 id="myModalLabel">配电设备缺陷信息</h3>
	</div>
	<div class="modal-body">
		<form id="checkpoint-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="defectType">缺陷类型</label>
				<div class="controls">
					<select id="defectType" name="defectType" class="input-large" required>
						<option value="type1">Ⅰ类缺陷</option>
						<option value="type2">Ⅱ类缺陷</option>
						<option value="type3">Ⅲ类缺陷</option>
						<option value="type4">Ⅳ类缺陷</option>
						<option value="type5">外部隐患</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="deviceClassId">设备类别</label>
				<div class="controls">
					<input type="hidden" id="id" name="id"> <select id="deviceClassId" name="deviceClassId" class="input-large"
						required> <#list datas as deviceClass>
						<option value="${deviceClass.id}">${deviceClass.name}</option> </#list>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="defectDetail">缺陷内容</label>
				<div class="controls">
					<input type="text" id="defectDetail" name="defectDetail" placeholder="缺陷内容" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="alarm">是否报警</label>
				<div class="controls">
					<select id="alarm" name="alarm" class="input-small" required>
						<option value="true">是</option>
						<option value="false">否</option>
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>
