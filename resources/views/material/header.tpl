<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff4081">
	<title>{$config["appName"]}</title>

	<!-- css -->	
	<!--link href="//fonts.lug.ustc.edu.cn/icon?family=Material+Icons" rel="stylesheet"-->	
    <link href="//fonts.lug.ustc.edu.cn/css?family=Monda:300,400,700|Palanquin+Dark:500" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/theme/material/css/main.css" type="text/css" rel="stylesheet" media="screen,projection">
	<!-- js -->
    <script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	<!-- ... -->
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top" id="nav">
    <div class="container">
        <div class="navbar-header">
            <button aria-expanded="false" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Way To ShadowSock</a>
        </div>
        <div aria-expanded="false" class="navbar-collapse collapse" id="bs-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">Home</a></li>
                <li><a href="/code">邀请码</a></li>
                 {if $user->isLogin}
                 <li>
                 	<a href="/user">用户中心</a>
                 </li>
                 <li>
                 	<a href="/user/logout">退出</a>
                 </li>
                 {else}
                 <li>
                 	<a href="/auth/login">登录</a>
                 </li>
                 <li>
                 	<a href="/auth/register">注册</a>
                 </li>
                 {/if}					

             </ul>
        </div>
    </div>
</nav>
