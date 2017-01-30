{include file='header.tpl'}


<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="box">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading">登录到用户中心</h1>
									</div>
								</div>
								<div class="card-inner">
									<form action="javascript:void(0);"  method="POST">
										<p class="text-center">
											<span class="avatar avatar-inline avatar-lg">
												<img alt="Login" src="/favicon.ico">
											</span>
										</p>
									
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email">邮箱</label>
													<input class="form-control" id="email" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="passwd">密码</label>
													<input class="form-control" id="passwd" type="password">
												</div>
											</div>
										</div>
								
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button id="login" type="submit" class="btn btn-info">登录</button>
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<div class="checkbox checkbox-adv">
														<label for="remember_me">
															<input class="access-hide" value="week" id="remember_me" name="remember_me" type="checkbox">记住我
															<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-info" href="/password/reset">忘记密码</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-info" href="/auth/register">注册个帐号</a></p>
						</div>
						
						
						{include file='dialog.tpl'}
								
						
						
						
						
					</section>
				</div>
			</div>
		</div>
	</main>
	
{include file='footer.tpl'}

<script>
    $(document).ready(function(){
        function login(){
			{if $geetest_html != null}
			if(typeof validate == 'undefined')
			{
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。");
				return;
			}
			
			if (!validate) {
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。");
				return;
			}
			
			{/if}
			
			document.getElementById("login").disabled = true; 
			
            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
					code: $("#code").val(),
                    remember_me: $("#remember_me:checked").val(){if $geetest_html != null},
					geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode{/if}
                },
                success:function(data){
                    if(data.ret == 1){
						$("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
                    }else{
			$("#result").modal();
                        $("#msg").html(data.msg);
			document.getElementById("login").disabled = false;
			{if $geetest_html != null}
			captcha.refresh();
			{/if} 
                    }
                },
                error:function(jqXHR){
			$("#msg-error").hide(10);
			$("#msg-error").show(100);
			$("#msg-error-p").html("发生错误："+jqXHR.status);
					document.getElementById("login").disabled = false; 
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#login").click(function(){
            login();
        });
		
		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});
		
		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});
    })
</script>










	
