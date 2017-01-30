
{include file='user/main.tpl'}
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>邀请</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="box">
                    <h2>注意！</h2>
                    <p>邀请码请给认识的需要的人。</p>
                    <p>邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</p>
                    <p>用户注册48小时后，才可以生成邀请码。</p>
                    <p>邀请码暂时无法购买，请珍惜。</p>
                    <p>公共页面不定期发放邀请码，如果用完邀请码可以关注公共邀请。</p>
                </div>

                <div class="box">
                    <h2>生成邀请码</h2>
                    <p>您当前可以生成 <code>{$user->invite_num}</code> 个邀请码。</p>
                        <div class="form-group">
                            <div class="input-group">
                                <input class="form-control" id="num" type="number" placeholder="数量">
                                <div class="input-group-btn">
                                    <button id="invite" class="btn btn-info">生成</button>
                                </div>
                            </div>
                        </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h2>我的邀请码</h2>
					{$codes->render()}
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>														
							<tr>
								<th>###</th>
								<th>邀请码(点右键复制链接)</th>
								<th>状态</th>
							</tr>
							</thead>
							<tbody>
							{foreach $codes as $code}
								<tr>
									<td><b>{$code->id}</b></td>
									<td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a></td>
									<td>可用</td>
								</tr>
							{/foreach}
							</tbody>
						</table>
						{$codes->render()}
					</div>			
				</div>
			{include file='dialog.tpl'}
			</div>	
	</section>
{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

