{include file='header.tpl'}
<section>
	<div class="container">
		<div class="row">			
			<div class="col-lg-12 col-md-12">
				<h1>邀请码</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="box">
					<p>{$config["appName"]} 的邀请码，没了的话就烧纸吧。</p>
				</div>
				<div class="box">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr style="color: #0f9aee;">
									<th>###</th>
									<th>邀请码 (点击邀请码进入注册页面)</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
							{foreach $codes as $code}
								<tr>
									<td>{$code->id}</td>
									<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
									<td>可用</td>
								</tr>
							{/foreach}
							</tbody>
						</table>
					</div>
				</div>	
			</div>
		</div>
	</div>
</section>
{include file='footer.tpl'}