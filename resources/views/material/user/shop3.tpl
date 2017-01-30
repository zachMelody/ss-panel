<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>{$config["appName"]}</title>

	
	
	<!-- css -->
	<link href="/theme/material/css/base.min.css" rel="stylesheet">
	<link href="/theme/material/css/project.min.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	

	
	<!-- favicon -->
	<!-- ... -->
	<style>
		.pagination {
			display:inline-block;
			padding-left:0;
			margin:20px 0;
			border-radius:4px
		}
		.pagination>li {
			display:inline
		}
		.pagination>li>a,.pagination>li>span {
			position:relative;
			float:left;
			padding:6px 12px;
			margin-left:-1px;
			line-height:1.42857143;
			color:#337ab7;
			text-decoration:none;
			background-color:#fff;
			border:1px solid #ddd
		}
		.pagination>li:first-child>a,.pagination>li:first-child>span {
			margin-left:0;
			border-top-left-radius:4px;
			border-bottom-left-radius:4px
		}
		.pagination>li:last-child>a,.pagination>li:last-child>span {
			border-top-right-radius:4px;
			border-bottom-right-radius:4px
		}
		.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover {
			color:#23527c;
			background-color:#eee;
			border-color:#ddd
		}
		.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover {
			z-index:2;
			color:#fff;
			cursor:default;
			background-color:#337ab7;
			border-color:#337ab7
		}
		.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover {
			color:#777;
			cursor:not-allowed;
			background-color:#fff;
			border-color:#ddd
		}
		.pagination-lg>li>a,.pagination-lg>li>span {
			padding:10px 16px;
			font-size:18px
		}
		.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span {
			border-top-left-radius:6px;
			border-bottom-left-radius:6px
		}
		.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span {
			border-top-right-radius:6px;
			border-bottom-right-radius:6px
		}
		.pagination-sm>li>a,.pagination-sm>li>span {
			padding:5px 10px;
			font-size:12px
		}
		.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span {
			border-top-left-radius:3px;
			border-bottom-left-radius:3px
		}
		.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span {
			border-top-right-radius:3px;
			border-bottom-right-radius:3px
		}
		.pager {
			padding-left:0;
			margin:20px 0;
			text-align:center;
			list-style:none
		}
		.pager li {
			display:inline
		}
		.pager li>a,.pager li>span {
			display:inline-block;
			padding:5px 14px;
			background-color:#fff;
			border:1px solid #ddd;
			border-radius:15px
		}
		.pager li>a:focus,.pager li>a:hover {
			text-decoration:none;
			background-color:#eee
		}
		.pager .next>a,.pager .next>span {
			float:right
		}
		.pager .previous>a,.pager .previous>span {
			float:left
		}
		.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span {
			color:#777;
			cursor:not-allowed;
			background-color:#fff
		}
		
		
		
		
		.pagination>li>a,
		.pagination>li>span {
		  border: 1px solid white;
		}
		.pagination>li.active>a {
		  background: #f50057;
		  color: #fff;
		}
		
		.pagination>li>a {
		  background: white;
		  color: #000;
		}
		
		
		.pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
			color: #fff;
			background-color: #000;
			border-color: #000;
		}
		.pagination>.active>span {
		  background-color: #f50057;
		  color: #fff;
		  border-color: #fff;
		}
		
		
		
		.pagination > .disabled > span {
		  border-color: #fff;
		}
		
		
		pre {
			white-space: pre-wrap;
			word-wrap: break-word;
		}
		
		.progress-green .progress-bar {
			background-color: #f0231b;
		}
		
		.progress-green {
			background-color: #000;
		}
		
		.progress-green .progress-bar {
			background-color: #ff0a00;
		}
		
		.page-orange .ui-content-header {
			background-image: url(/theme/material/css/images/bg/amber.jpg);
		}
		
		.content-heading {
			font-weight: 300;
			color: #fff;
		}
				
	</style>
	
	
	
</head>
<body class="page-orange">
	<header class="header header-orange header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg text-white">menu</span>
				</a>
			</div>
		</ul>
		
		<ul class="nav nav-list pull-right">
			<div class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				{if $user->isLogin}
					<span class="access-hide">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="{$user->gravatar}"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/user/"><span class="icon icon-lg margin-right">account_box</span>用户中心</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>登出</a>
						</li>
					</ul>
				{else}
					<span class="access-hide">未登录</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="/theme/material/images/users/avatar-001.jpg"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">account_box</span>登录</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">pregnant_woman</span>注册</a>
						</li>
					</ul>
				{/if}
					
			</div>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="/"><i class="icon icon-lg">person_pin_circle</i>&nbsp;用户面板</a>
				<ul class="nav">
					<li>
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">我的</a>
						<ul class="menu-collapse collapse in" id="ui_menu_me">
							<li>
								<a href="/user">
									<i class="icon icon-lg">recent_actors</i>&nbsp;首页
								</a>
							</li>
							
							<li>
								<a href="/user/profile">
									<i class="icon icon-lg">info</i>&nbsp;账户信息
								</a>
							</li>
							
							<li>
								<a href="/user/edit">
									<i class="icon icon-lg">sync_problem</i>&nbsp;资料编辑
								</a>
							</li>
							
							<li>
								<a href="/user/invite">
									<i class="icon icon-lg">loyalty</i>&nbsp;邀请码
								</a>
							</li>
							
							<li>
								<a href="/user/announcement">
									<i class="icon icon-lg">announcement</i>&nbsp;查看公告
								</a>
							</li>
							
							
							{if $config['enable_donate']=='true'}
							<li>
								<a href="/user/donate">
									<i class="icon icon-lg">attach_money</i>&nbsp;捐赠公示
								</a>
							</li>
							{/if}
							
							
						</ul>
						
						
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_use">使用</a>
						<ul class="menu-collapse collapse in" id="ui_menu_use">
							<li>
								<a href="/user/node">
									<i class="icon icon-lg">router</i>&nbsp;节点列表
								</a>
							</li>
							
							<li>
								<a href="/user/relay">
									<i class="icon icon-lg">compare_arrows</i>&nbsp;中转规则
								</a>
							</li>
							
							<li>
								<a href="/user/trafficlog">
									<i class="icon icon-lg">traffic</i>&nbsp;流量记录
								</a>
							</li>
							
							<li>
								<a href="/user/lookingglass">
									<i class="icon icon-lg">youtube_searched_for</i>&nbsp;观察窗
								</a>
							</li>
						</ul>

						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_detect">审计</a>
						<ul class="menu-collapse collapse in" id="ui_menu_detect">
							<li><a href="/user/detect"><i class="icon icon-lg">account_balance</i>&nbsp;审计规则</a></li>
							<li><a href="/user/detect/log"><i class="icon icon-lg">assignment_late</i>&nbsp;审计记录</a></li>
						</ul>
						
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_trade">帮助</a>
						<ul class="menu-collapse collapse in" id="ui_menu_trade">
							{if $config['enable_wecenter']=='true'}
							<li>
								<a href="{$config["wecenter_url"]}" target="_blank">
									<i class="icon icon-lg">help</i>&nbsp;问答系统
								</a>
							</li>
							{/if}
							
							<li>
								<a href="/user/ticket">
									<i class="icon icon-lg">question_answer</i>&nbsp;工单系统
								</a>
							</li>
						</ul>

						
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_help">交易</a>
						<ul class="menu-collapse collapse in" id="ui_menu_help">
						
						
							<li>
								<a href="/user/shop">
									<i class="icon icon-lg">shop</i>&nbsp;商店
								</a>
							</li>
							
							<li><a href="/user/bought"><i class="icon icon-lg">shopping_cart</i>&nbsp;购买记录</a></li>
							
							


							<li>
								<a href="/user/code">
									<i class="icon icon-lg">code</i>&nbsp;充值
								</a>
							</li>
						</ul>
						
						{if $user->isAdmin()}
							<li>
								<a href="/admin">
									<i class="icon icon-lg">person_pin</i>&nbsp;管理面板
								</a>
							</li>
						{/if}


						

						
					</li>
				</ul>
			</div>
		</div>
	</nav>







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">商品列表</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>系统中所有商品的列表。您购买等级类的商品时有效期会从当前时间开始计算。</p>
								<p>当前余额：{$user->money} 元</p>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						{$shops->render()}
						<table class="table ">
                            <tr>
								<th>操作</th>
                                <th>ID</th>
                                <th>名称</th>
								<th>价格</th>
								<th>内容</th>
                                <th>自动续费天数</th>
								<th>续费时重置流量</th>
                                
                            </tr>
                            {foreach $shops as $shop}
                            <tr>
								<td>
                                    <a class="btn btn-brand-accent" href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew},{$shop->auto_reset_bandwidth})">购买</a>
                                </td>
                                <td>#{$shop->id}</td>
                                <td>{$shop->name}</td>
								<td>{$shop->price} 元</td>
                                <td>{$shop->content()}</td>
								{if $shop->auto_renew==0}
                                <td>不能自动续费</td>
								{else}
								<td>可选 在 {$shop->auto_renew} 天后自动续费</td>
								{/if}
								
								{if $shop->auto_reset_bandwidth==0}
                                <td>不自动重置</td>
								{else}
								<td>自动重置</td>
								{/if}
                                
                            </tr>
                            {/foreach}
                        </table>
						{$shops->render()}
					</div>
					
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="coupon_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">您有优惠码吗？</h2>
								</div>
								<div class="modal-inner">
									<div class="form-group form-group-label">
										<label class="floating-label" for="coupon">有的话，请在这里输入。没有的话，直接确定吧</label>
										<input class="form-control" id="coupon" type="text">
									</div>
								</div>
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="coupon_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="order_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">订单确认</h2>
								</div>
								<div class="modal-inner">
									<p id="name">商品名称：</p>
									<p id="credit">优惠额度：</p>
									<p id="total">总金额：</p>
									<p id="auto_reset">在到期时自动续费</p>
									
									<div class="checkbox switch" id="autor">
										<label for="autorenew">
											<input checked class="access-hide" id="autorenew" type="checkbox"><span class="switch-toggle"></span>自动续费
										</label>
									</div>
									
								</div>
								
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="order_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
	
			</div>
			
			
			
		</div>
	</main>






	<footer class="ui-footer">
		<div class="container">
			&copy; {$config["appName"]}  <a href="/staff">STAFF</a> {if $config["enable_analytics_code"] == 'true'}{include file='analytics.tpl'}{/if}
		</div>
	</footer>

	<!-- js -->
	<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>
	<script src="//cdn.staticfile.org/jquery-validate/1.15.0/jquery.validate.min.js"></script>
	<script src="//static.geetest.com/static/tools/gt.js"></script>
	
	<script src="/theme/material/js/base.min.js"></script>
	<script src="/theme/material/js/project.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.16/clipboard.min.js"></script>
	
</body>
</html>


<script>
function buy(id,auto,auto_reset) {
	auto_renew=auto;
	if(auto==0)
	{
		document.getElementById('autor').style.display="none";
	}
	else
	{
		document.getElementById('autor').style.display="";
	}
	
	if(auto_reset==0)
	{
		document.getElementById('auto_reset').style.display="none";
	}
	else
	{
		document.getElementById('auto_reset').style.display="";
	}
	
	shop=id;
	$("#coupon_modal").modal();
}


$("#coupon_input").click(function () {
		$.ajax({
			type: "POST",
			url: "coupon_check",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop
			},
			success: function (data) {
				if (data.ret) {
					$("#name").html("商品名称："+data.name);
					$("#credit").html("优惠额度："+data.credit);
					$("#total").html("总金额："+data.total);
					$("#order_modal").modal();
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});
	
$("#order_input").click(function () {

		if(document.getElementById('autorenew').checked)
		{
			var autorenew=1;
		}
		else
		{
			var autorenew=0;
		}
			
		$.ajax({
			type: "POST",
			url: "buy",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop,
				autorenew: autorenew
			},
			success: function (data) {
				if (data.ret) {
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});

</script>