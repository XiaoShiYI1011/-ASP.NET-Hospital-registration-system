<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorLogin.aspx.cs" Inherits="HRRS.DoctorLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>医生登录</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script src="Script/jQuery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="Script/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <style>
        #bg {
            width: 100%;
            height: 100%;
            overflow: hidden;
            position: absolute;
            top: 0px;
        }

            #bg > img {
                width: 100%;
            }

        .col-md-5 {
            box-shadow: 0 0 20px #ccc;
            border-radius: 20px;
            padding: 50px 15px;
            margin-left: 28.7%;
            background-color: rgb(255 255 255 / 0.85);
        }

        .btn-login {
            width: 100%
        }
    </style>
</head>
<body>
    <div id="bg">
        <img src="Assets/Login_bg.jpg" />
    </div>
    <div class="container-fluid" id="root">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <h1 style="text-align: center; letter-spacing: 20px; line-height: 150px">医生登录</h1>
                    <div class="col-md-5 col-md-offset-3">
                        <div class="col-md-8 col-md-offset-2">
                            <%-- 请求方式：POST --%>
                            <form class="form-horizontal" role="form" method="post" id="form1" runat="server">
                                <div class="form-group">
                                    <label for="doctorName" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号</label>
                                    <div class="col-sm-10">
                                        <%-- 账号输入框，ID：doctorName ，name：doctorName --%>
                                        <asp:TextBox ID="doctorName" name="doctorName" runat="server" class="form-control" placeholder="DoctorName"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="doctorPassWord" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                                    <div class="col-sm-10">
                                        <%-- 密码输入框，ID：doctorPassWord ，name：doctorPassWord --%>
                                        <asp:TextBox ID="doctorPassWord" name="doctorPassWord" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <%-- 自动登录复选框，ID：DoctorAutoLogin --%>
                                                <asp:CheckBox ID="DoctorAutoLogin" runat="server" />自动登录
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <%-- 登录按钮 --%>
                                        <asp:Button ID="btn_login" runat="server" Text="登录" class="btn btn-primary btn-login" OnClick="btn_login_Click" />
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
