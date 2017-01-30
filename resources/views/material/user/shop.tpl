
{include file='user/main.tpl'}

<section>
	<div class="container">
		<div class="row"> 
			<div class="col-md-12">
				<h2>购买时长</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="box">
					<h3 class="box-title">商品列表</h3>
					<p>系统中所有商品的列表。您购买等级类的商品时有效期会从当前时间开始计算。</p>
					<p>当前余额：<code>{$user->money} </code>元</p>
					<br />
					<div class="table-responsive">
						{$shops->render()}
						<table style="border:1px solid #83D7EA;color: #8094A1;" class="table ">
                            <tr>
								<th>操作</th>
                                <th>名称</th>
								<th>价格</th>
								<th>内容</th>                               
                            </tr>
                            {foreach $shops as $shop}
                            <tr>
								<td>
                                    <a class="btn btn-info" href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew},{$shop->auto_reset_bandwidth})">购买</a>
                                </td>
                                <td>{$shop->name}</td>
								<td>{$shop->price} 元</td>
                                <td>{$shop->content()}</td>
                                
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
									<p class="text-right"><button class="btn btn-primary" data-dismiss="modal" id="coupon_input" type="button">确定</button></p>
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
									<p class="text-right"><button class="btn btn-primary" data-dismiss="modal" id="order_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}

				</div>
			</div>

			<div class="col-md-4">
				<div class="box">
					<div class="form-group form-group-label">
						<h2>充值码</h2>
						<input class="form-control" id="code" type="text">
						<br />
						<button class="btn btn-primary" id="code-update" >充值</button>
					</div>
				</div>
				<div class="box">
					<div class="form-group form-group-label">
						<h2>购买充值码</h2>
						<p>自10元起季付9.5折，半年9折，年付8折</p>
						<br />
						<button class="btn btn-primary" id="melodyCode" onclick="location.href='http://t.cn/RfbTBeF'">充值</button>

						</script>
					</div>
				</div>
			</div>

		</div>

	</div>

</section>




{include file='user/footer.tpl'}


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
<script>
    $(document).ready(function () {
        $("#code-update").click(function () {
            $.ajax({
                type: "POST",
                url: "code",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    }
                },
                error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
	
	timestamp = {time()}; 
		
		
	function f(){
		$.ajax({
			type: "GET",
			url: "code_check",
			dataType: "json",
			data: {
				time: timestamp
			},
			success: function (data) {
				if (data.ret) {
					clearTimeout(tid);
					$("#result").modal();
					$("#msg").html("充值成功！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>