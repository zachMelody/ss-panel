
{include file='user/main.tpl'}

	<section>		
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<h1>我的账户</h1>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="box">
						<p class="box-title">我的帐号</p>
							<dl class="dl-horizontal">
								<dt>用户名</dt>
								<dd>{$user->user_name}</dd>
								<dt>邮箱</dt>
								<dd>{$user->email}</dd>
							</dl>										
						</div>
					</div>
				</div>

			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="box">
							<h2>最近五分钟使用IP</h2>
							<p>请确认都为自己的IP，如有异常请及时修改连接密码。部分节点不支持记录。</p>
								<div class="card-table">
									<div class="table-responsive">
										<table class="table">
											<tr>													
											<th>IP</th>
											<th>归属地</th>
												</tr>
												{foreach $userip as $single=>$location}
													<tr>														
													<td>{$single}</td>
													<td>{$location}</td>
													</tr>
												{/foreach}
										</table>
									</div>
								</div>
					</div>
				</div>
								
				<div class="col-lg-6 col-md-6">
							<div class="box">
								<h2>最近十次登录IP</h2>
								<p>请确认都为自己的IP，如有异常请及时修改密码。</p>
								<div class="card-table" style="border:1px solid #83D7EA;color: #8094A1;">
									<div class="table-responsive">
										<table class="table">
											<tr>													
												<th>IP</th>
												<th>归属地</th>
											</tr>
											{foreach $userloginip as $single=>$location}
											<tr>														
												<td>{$single}</td>
												<td>{$location}</td>
											</tr>
											{/foreach}
										</table>
									</div>
								</div>
							</div>
				</div>
			</div>

			<div class="row">		
				<div class="col-md-12 col-md-12">						
					<div class="box">
						<h2 class="box-title">返利记录</h2>
						<div class="card-table"  style="border:1px solid #83D7EA;color: #8094A1;">
							<div class="table-responsive">
								{$paybacks->render()}
								<table class="table">
								<thead>
									<tr>
										<th>###</th>
										<th>返利用户</th>
										<th>返利金额</th>
									</tr>
								</thead>
								<tbody>
									{foreach $paybacks as $payback}
									<tr>
										<td><b>{$payback->id}</b></td>
										{if $payback->user()!=null}
										<td>{$payback->user()->user_name}</td>{else}<td>已注销</td>
										{/if}											
										<td>{$payback->ref_get} 元</td>
									</tr>
									{/foreach}
								</tbody>
								</table>
								{$paybacks->render()}
							</div>
						</div>
					</div>									
				</div>
			</div>
		</div>
						
	</section>
		
{include file='user/footer.tpl'}
