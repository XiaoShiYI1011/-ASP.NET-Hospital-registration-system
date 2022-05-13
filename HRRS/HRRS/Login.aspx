<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HRRS.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>患者登录</title>
	<link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
	<script src="Script/jQuery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="Script/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div id="login-box">
						<div id="login-box-left">

						</div>
						<div id="login-box-right">
							<form class="form-horizontal" role="form" id="form1" runat="server">
								<div class="form-group">
									<label for="userName" class="col-sm-2 control-label">账号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="userName" placeholder="UserName">
									</div>
								</div>
								<div class="form-group">
									<label for="Password" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="Password" placeholder="Password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="checkbox">
											<label>
												<input type="checkbox">自动登录
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-default">登录</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>