{include file='user/main.tpl'}
	<section>
		<div class="container">
			<div class="row">
            	<div class="col-md-12">
               	 <h1>用户中心</h1>
            	</div>
       		</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="box">
						<h2 class="box-tite">系统公告</h2>
						{if $ann != null}
						<p>{$ann->content}</p>
						{/if}
					</div>		
							
					<div class="box">
					<h2>快速配置</h2>
						<p><a href="/ssr-download/ssr-win.7z">Windows 下载 C# 版</a>，解压，运行程序，然后您有两种方式导入所有节点<br>(1)下载<a href="/user/getpcconf">这个</a>，右键小飞机 服务器 -- 从配置文件导入服务器，选择这个文件，<br>(2)点击<a class="copy-text" data-clipboard-text="{$android_add}">这里</a>，然后右键小飞机 -- 从剪贴板复制地址<br>然后选择一个合适的服务器，更新一下PAC为绕过国内IP，然后开启系统代理即可上网。</p>
						<p><a href="/ssr-download/ssr-mac.dmg">Mac OS X下载这个</a>，安装，然后下载<a href="/user/getpcconf">这个</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
						<p>iOS 强烈推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，然后在 Safari 中点击<a id="android_add" href="{$android_add}">这个</a>，然后点击确定，就可以批量添加节点。</p>										
						<STRIKE><p>iOS 下载<a href="/link/{$ios_token}">这个</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p></STRIKE>
						<p><a href="/ssr-download/ssr-android.apk">Android下载 Android 版</a>，安装，然后在手机上默认浏览器中点击<a id="android_add" href="{$android_add}">这个</a>，然后点击确定，批量添加完节点，然后路由选择绕过大陆，右上角开启就可以上网了。</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="box">
						<h2>帐号使用情况</h2>
						<dl class="dl-horizontal">
							<dt>账户余额：</dt>
							<dd><span style="font-size: 20px;">{$user->money}</span></dd>

							<dt>帐号过期时间</dt>
							<dd><code>{$user->expire_in}</code></dd>
							
						</dl>
					</div>
					<div class="box">
						<h2 class="box-title">流量使用统计</h2>			
						<div class="progress progress-striped">
						    <div class="progress-bar progress-bar-success" role="progressbar"
						         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						         style="width: {number_format($user->last_day_t/$user->transfer_enable*100,2)}%;">
						        <span class="sr-only">已用</span>
						    </div>	

						    <div class="progress-bar progress-bar-info" role="progressbar"
						         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						         style="width: {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}%;">
						        <span class="sr-only">今日</span>
						    </div>	

						</div>
						<dl class="dl-horizontal">
							<dt>已用：{$user->LastusedTraffic()}</dt>	
							<dd>今日：{$user->TodayusedTraffic()}</dd>		
							<dd>剩余：{$user->unusedTraffic()}</dd>
						</dl>
					</div>
					
					

					
				
				
					<div class="box">
						<h2>其他</h2>
						<h3 style="color: #8094a1;">自动售卖网址<br /><a href="http://t.cn/RfbTBeF">http://t.cn/RfbTBeF</a></h3>
						<p></p>
						<h3 style="color: #8094a1;">贴吧云签到:<br /><a href="https://tb.w2ss.xyz">http://tb.w2ss.xyz</a></h3>
						<p>Something new coming soon.......</p>
					</div>					
				</div>			
						
			{include file='dialog.tpl'}
						
			</div>
	
		</div>
	</section>


<script src="theme/material/js/shake.js/shake.js"></script>


<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});

{if $geetest_html == null}


window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    } 
}; 


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})
	

{else}


window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        c.show();
    } 
}; 




{/if}


</script>

{include file='user/footer.tpl'}