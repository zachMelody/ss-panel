<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
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
    <style type="text/css">
		.modal {
		  -webkit-backface-visibility: hidden;
		          backface-visibility: hidden;
		  display: none;
		  overflow: hidden;
		  outline: 0;
		  position: fixed;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		  z-index: 40;
		  -webkit-overflow-scrolling: touch;
		  -ms-overflow-style: -ms-autohiding-scrollbar;
		}
		.modal-open .modal {
		  overflow-x: hidden;
		  overflow-y: auto;
		}

		.modal-backdrop {
		  -webkit-backface-visibility: hidden;
		          backface-visibility: hidden;
		  background-color: #000000;
		  opacity: 0;
		  position: fixed;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		  -webkit-transition: opacity 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		  transition: opacity 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		  z-index: 39;
		}
		.modal-backdrop.fade.in {
		  opacity: 0.54;
		}
		.menu ~ .modal-backdrop {
		  z-index: 30;
		}
		.menu ~ .modal-backdrop.in {
		  opacity: 0.54;
		}

		.modal-close {
		  color: #727272;
		  cursor: pointer;
		  display: block;
		  float: right;
		  font-size: 20px;
		  line-height: 28px;
		  margin-right: -8px;
		  padding-right: 8px;
		  padding-left: 8px;
		}
		.modal-close:focus, .modal-close:hover {
		  color: #ff4081;
		  text-decoration: none;
		}

		.modal-content {
		  background-clip: padding-box;
		  background-color: #ffffff;
		  border: 1px solid transparent;
		  border-radius: 4px;
		  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.5);
		  outline: 0;
		  position: relative;
		}

		.modal-dialog {
		  margin: 48px 16px;
		  position: relative;
		}
		.modal-dialog.modal-full {
		  height: 100%;
		  height: calc(100% - 96px);
		}
		.modal-dialog.modal-full .modal-content {
		  height: 100%;
		}
		.modal.fade .modal-dialog {
		  -webkit-transform: scale(0, 0);
		          transform: scale(0, 0);
		  -webkit-transition: -webkit-transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		  transition: -webkit-transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1), -webkit-transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		}
		.modal.fade.in .modal-dialog {
		  -webkit-transform: scale(1, 1);
		          transform: scale(1, 1);
		}
		@media only screen and (min-width: 480px) {
		  .modal-dialog.modal-xs {
		    margin-right: auto;
		    margin-left: auto;
		    width: 448px;
		  }
		}
		@media only screen and (min-width: 992px) {
		  .modal-dialog {
		    margin-right: auto;
		    margin-left: auto;
		    width: 960px;
		  }
		}
		@media only screen and (min-width: 1440px) {
		  .modal-dialog {
		    width: 1408px;
		  }
		}

		.modal-footer {
		  padding-right: 24px;
		  padding-left: 24px;
		}
		.modal-footer .btn + .btn {
		  margin-right: 16px;
		}
		.modal-footer .text-right .btn + .btn {
		  margin-right: auto;
		  margin-left: 16px;
		}

		.modal-heading {
		  margin-top: 24px;
		  margin-bottom: 24px;
		  padding-right: 24px;
		  padding-left: 24px;
		  position: relative;
		}

		.modal-inner {
		  margin-top: 24px;
		  margin-bottom: 24px;
		  padding-right: 24px;
		  padding-left: 24px;
		}

		.modal-open {
		  overflow: hidden;
		}

		.modal-title {
		  font-size: 20px;
		  line-height: 28px;
		  margin-top: 0;
		  margin-right: 28px;
		  margin-bottom: 24px;
		}

		.modal-va-middle {
		  -webkit-box-align: center;
		  -webkit-align-items: center;
		      -ms-flex-align: center;
		              -ms-grid-row-align: center;
		          align-items: center;
		}
		.modal-va-middle .modal-dialog {
		  -webkit-box-flex: 1;
		  -webkit-flex-grow: 1;
		      -ms-flex-positive: 1;
		          flex-grow: 1;
		}
		@media only screen and (min-width: 480px) {
		  .modal-va-middle .modal-dialog.modal-xs {
		    -webkit-box-flex: 0;
		    -webkit-flex-grow: 0;
		        -ms-flex-positive: 0;
		            flex-grow: 0;
		  }
		}
		@media only screen and (min-width: 992px) {
		  .modal-va-middle .modal-dialog {
		    -webkit-box-flex: 0;
		    -webkit-flex-grow: 0;
		        -ms-flex-positive: 0;
		            flex-grow: 0;
		  }
		}

		.modal-va-middle-show {
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		}
		.modal-scrollbar-measure {
		  height: 50px;
		  overflow: scroll;
		  position: absolute;
		  top: -99999px;
		  width: 50px;
		}
		.text-left {
		  text-align: left;
		}

		.text-right {
		  text-align: right;
		}
		.text-black-hint {
		  color: #9a9a9a;
		}
		
    </style>

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
	            <a class="navbar-brand" href="/user">Way To ShadowSock</a>
	        </div>
	        <div aria-expanded="false" class="navbar-collapse collapse" id="bs-navbar-collapse">
	            <ul class="nav navbar-nav">
	                <li><a href="/user">概览</a></li>
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/user/edit">个人设置</a></li>	
	                        {if $user->isAdmin()}
							<li>
								<a href="/admin">管理面板</a>
							</li>
							<li>
								<a href="http://113.20.157.11/phpmyadmin/">MYSQL</a>
							</li>
						{/if}
                        
	                    </ul>
	                
	                
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">节点 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/user/node">节点列表</a></li>
	                        <li><a href="/user/relay">中转设置</a></li>
	                    </ul>
	                </li>
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">交易 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="http://t.cn/RfbTBeF">购买充值码</a></li>
	                        <li><a href="/user/shop">购买时长</a></li>
	                    </ul>
	                </li>
	                <li><a href="/user/invite">邀请</a></li>
	            </ul>

	            <ul class="nav navbar-nav navbar-right">
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">zach <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/user/profile">账号信息</a></li>
	                        <li><a href="/user/logout">退出登录</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
