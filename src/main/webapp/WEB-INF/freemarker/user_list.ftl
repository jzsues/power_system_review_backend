<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-bordered" id="user-list-table">
	<thead>
		<tr>
			<th>操作</th>
			<th>用戶名</th>
			<th>Email</th>
			<th>是否有效</th>
			<th>最后更新时间</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- Modal -->
<div id="show-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">用户信息</h3>
	</div>
	<div class="modal-body">
		<form id="user-form" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="username">用户名</label>
				<div class="controls">
					<input type="hidden" id="id" name="id"> <input type="text" id="username" name="username" placeholder="用户名">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">密码</label>
				<div class="controls">
					<input type="password" id="password" name="password" placeholder="密码">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" id="email" name="email" placeholder="Email" class="">
				</div>
			</div>
			<div class="control-group">
				<!-- Text input-->
				<label class="control-label" for="roleId">角色</label>
				<div class="controls">
					<select id="shipId" name="shipId" class="input-xlarge" required>
						<#list datas as role>
							<option value="${role.id}">${role.authority}</option>
						</#list>
					</select>
					<p class="help-block"></p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</form>
	</div>
</div>