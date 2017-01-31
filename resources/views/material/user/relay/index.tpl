


{include file='user/main.tpl'}







	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<h1>中转规则管理</h1>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">	
					<div class="box">
						<p>系统中您所有的中转规则。</p>							
					</div>
					
					<div class="box">
						<div class="table-responsive">
						{$rules->render()}
						<table class="table table-striped">
						    <tr>
								<th>操作</th>
								<th>ID</th>
								<th>起源节点</th>
								<th>目标节点</th>
								<th>端口</th>
								<th>优先级</th>							
							</tr>
							{foreach $rules as $rule}
								<tr>
								<td>
									<a class="btn btn-info" href="/user/relay/{$rule->id}/edit">编辑</a>
									<a class="btn btn-danger" id="delete" value="{$rule->id}" href="javascript:void(0);" onClick="delete_modal_show('{$rule->id}')">删除</a>
								</td>
								<td>#{$rule->id}</td>
								{if $rule->source_node_id == 0}
									<td>所有节点</td>
								{else}
									<td>{$rule->Source_Node()->name}</td>
								{/if}
								<td>{$rule->Dist_Node()->name}</td>
								<td>{$rule->port}</td>
								<td>{$rule->priority}</td>
						        </tr>
						    {/foreach}
						</table>
						{$rules->render()}
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4 col-lg-4">
							<a class="btn btn-info" href="/user/relay/create">自定义中转节点</a>
						</div>
					</div>	
							
						
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">确认要删除？</h2>
								</div>
								<div class="modal-inner">
									<p>请您确认。</p>
								</div>
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button">取消</button><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="delete_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}							
			</div>
		</div>
		</div>
	</section>






{include file='user/footer.tpl'}




<script>
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}


$(document).ready(function(){
	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/relay",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}else{
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error:function(jqXHR){
				$("#result").modal();
				$("#msg").html(data.msg+"  发生错误了。");
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})
	
</script>







