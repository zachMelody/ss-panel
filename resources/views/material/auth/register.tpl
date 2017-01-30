

{include file='header.tpl'}

<style type="text/css">

body{
	background-image: url(//w2ss.xyz/theme/material/images/bg2.png);
}
.form-control {
  height: 42px;
  background: transparent;
  border-color: rgba(255,255,255,0.6);
  color: #fff;
  -webkit-transition: border-color 0.35s;
  -moz-transition: border-color 0.35s;
  -o-transition: border-color 0.35s;
  -ms-transition: border-color 0.35s;
  transition: border-color 0.35s;
  margin: 4px;
  text-align: center;
}
.mebtn:hover,.btn:focus{
	opacity: 1;
	-ms-filter: none;
	filter: none;
	outline: 0;
}
.mebtn{
	display: block;
	width: 100%;height: 42px;
	background: #fff;
	color: #1f8ded;
	opacity: 0.85;
	border-width: 0;
	outline: 0;
	transition: opacity 0.35s;
	border: 1px solid transparent;
    border-radius: 4px;
    margin: 20px 0;
}
.form-control::-webkit-input-placeholder {
  color: rgba(255,255,255,0.6);
}
.form-control:-moz-placeholder {
  color: rgba(255,255,255,0.6);
}
.form-control::-moz-placeholder {
  color: rgba(255,255,255,0.6);
}
.form-control:-ms-input-placeholder {
  color: rgba(255,255,255,0.6);
}
.form-control:hover,
.form-control:focus {
  border-color: #fff;
}
@-webkit-keyframes autofill {
  to {
    color: #fff;
    background: transparent;
  }
}
.form-control:-webkit-autofill {
  -webkit-animation-name: autofill;
  -webkit-animation-fill-mode: both;
}
    
</style>
<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="card">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 style="font-family: Palanquin Dark,PingFang HK,Microsoft Jhenghei UI,sans-serif;font-size: 28px;color: rgba(255,255,255,0.4);font-weight: 500;line-height: 1.1;margin: 50px 0;text-align: center;">世界那么大，我想去看看</h1>
									</div>
								</div>
								<div class="card-inner">
									
									
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">		
												<input class="form-control" id="name" type="text" placeholder="昵称">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<input class="form-control" id="email" type="text" placeholder="邮箱">
												</div>
											</div>
										</div>
										
										{if $enable_email_verify == 'true'}
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email_code">邮箱验证码</label>
													<input class="form-control" id="email_code" type="text" placeholder="邮箱验证码">
													<button id="email_verify" class="btn btn-block btn-brand-accent waves-attach waves-light">获取验证码</button>
												</div>
											</div>
										</div>
										{/if}
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													
													<input class="form-control" id="passwd" type="password" placeholder="密码">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													
													<input class="form-control" id="repasswd" type="password" placeholder="重复密码">
												</div>
											</div>
										</div>
										
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">								
													<select class="form-control" id="imtype" style="color: #68B1F1;text-align: center;">
														<option>请选择联络方式</option>
														<option value="1">微信</option>
														<option value="2">QQ</option>
														<option value="3">Google+</option>
														<option value="4">Telegram</option>
													</select>
												</div>
											</div>
										</div>
										
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													
													<input class="form-control" id="wechat" type="text" placeholder="在这输入联络方式账号">
												</div>
											</div>
										</div>
										
										
										
										{if $enable_invite_code == 'true'}
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														
														<input class="form-control" id="code" type="text" value="{$code}" placeholder="邀请码">
													</div>
												</div>
											</div>
										{/if}
										
										{if $geetest_html != null}
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<div id="embed-captcha"></div>
													</div>
												</div>
											</div>
										{/if}
										
										<div class="form-group" style="text-align: center;">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button id="tos" type="submit" class="mebtn">Register</button>
												</div>
											</div>
										</div>
										
										
									
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
	                    		<a href="/auth/login" style="color: #fff;">Login</a> or <a href="/password/reset" style="color: #fff;">Reset Password</a>
	                		</div>
						</div>
						
						
								
						{include file='dialog.tpl'}
						
						
						<div aria-hidden="true" class="modal modal-va-middle fade" id="tos_modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-heading">
										<h2 class="modal-title">注册 TOS</h2>
									</div>
									<div class="modal-inner">
										{include file='reg_tos.tpl'}
									</div>
									<div class="modal-footer">
										<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button" id="cancel">我不服</button><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" id="reg" type="button">资慈</button></p>
										
									</div>
								</div>
							</div>
						</div>
						
					</section>
				</div>
			</div>
		</div>
	</main>
	
{include file='footer.tpl'}



<script>
    $(document).ready(function(){
        function register(){
			
			document.getElementById("tos").disabled = true; 
			
            $.ajax({
                type:"POST",
                url:"/auth/register",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
					wechat: $("#wechat").val(),
					imtype: $("#imtype").val(){if $enable_invite_code == 'true'},
					code: $("#code").val(){/if}{if $enable_email_verify == 'true'},
					emailcode: $("#email_code").val(){/if}{if $geetest_html != null},
					geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode
					{/if}
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
			document.getElementById("tos").disabled = false; 
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                    }
                },
                error:function(jqXHR){
			$("#msg-error").hide(10);
			$("#msg-error").show(100);
			$("#msg-error-p").html("发生错误："+jqXHR.status);
			document.getElementById("tos").disabled = false; 
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                $("#tos_modal").modal();
            }
        });
		
		{if $geetest_html != null}
		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});
		
		
		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});
		
        
		{/if}
		
		$("#reg").click(function(){
            register();
        });
		
		$("#tos").click(function(){
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
            $("#tos_modal").modal();
        });
    })
</script>


{if $enable_email_verify == 'true'}
<script>
var wait=60;
function time(o) {
		if (wait == 0) {
			o.removeAttr("disabled");			
			o.text("获取验证码");
			wait = 60;
		} else {
			o.attr("disabled","disabled");
			o.text("重新发送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			},
			1000)
		}
	}
    $(document).ready(function () {
        $("#email_verify").click(function () {
			time($("#email_verify"));
			
            $.ajax({
                type: "POST",
                url: "send",
                dataType: "json",
                data: {
                    email: $("#email").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
			$("#msg").html(data.msg);
						
                    } else {
                        $("#result").modal();
			$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
			$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
{/if}

{if $geetest_html != null}
<script>
	var handlerEmbed = function (captchaObj) {
        // 将验证码加到id为captcha的元素里
		
		captchaObj.onSuccess(function () {
		    validate = captchaObj.getValidate();
		});
		
		captchaObj.appendTo("#embed-captcha");
		captcha = captchaObj;
		// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
	
	initGeetest({
		gt: "{$geetest_html->gt}",
		challenge: "{$geetest_html->challenge}",
		product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
		offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
	}, handlerEmbed);
</script>

{/if}

