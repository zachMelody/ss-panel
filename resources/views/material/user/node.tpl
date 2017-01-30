
{include file='user/main.tpl'}


<script src="//cdn.bootcss.com/canvasjs/1.7.0/canvasjs.js"></script>
<script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>

<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>节点列表</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h2>注意!</h2>
                <p>请勿在任何地方公开节点地址！</p>
                <p>结算流量 = 实际使用流量 &times; 节点流量比例</p>                
            </div>
        </div>



		<div class="row">
			<div class="col-lg-12 col-sm-12">
				{$id=0}
				{foreach $node_prefix as $prefix => $nodes}
				{$id=$id+1}
				{foreach $nodes as $node}
					<div class="box">
						<h2><a href="/user/node/{$node->id}">{$prefix}</a></h2>
							<div class="row">
								<div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li>节点地址 <span class="pull-right badge">{$node->server}</span></li>
                                        <li>连接端口 <span class="pull-right badge">{$user->port}</span></li>
                                        <li>加密| <span class="pull-right badge"> {if $node->custom_method == 1}{$user->method}{else}{$node->method}{/if}</span></li>
                                        <li>协议 <span class="pull-right badge">{$user->protocol}</span></li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li>混淆 <span class="pull-right badge">{$user->obfs}</span></li>
                                        <li>在线人数 <span class="pull-right badge">{$node_alive[$prefix]}</span></li>
                                        <li>产生流量 <span class="pull-right badge">{$node_bandwidth[$prefix]}</span></li>
                                        <li>状态<span class="pull-right badge">{$node_heartbeat[$prefix]}</span></li>
                                    </ul>
                                </div>
							</div>
					</div>			 
				{/foreach}
				{/foreach}
											
			</div>
		</div>	
</section>

{include file='user/footer.tpl'}