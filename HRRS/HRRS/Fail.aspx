<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fail.aspx.cs" Inherits="HRRS.Fail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>患者登录</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script src="Script/jQuery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="Script/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <style>
        #Btn_goLogin,
        #Btn_goLogin2 {
            margin-top: 30px;
            width: 100%;
        }
    </style>
</head>
<body>
    <%-- 执行失败公共页面，需要再加载事件中传入失败信息 --%>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <%-- 弹出框 --%>
                <div class="modal fade" id="mymodal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:Button ID="close_icon" runat="server" Text="&times;"  class="close"  OnClick="Btn_out_Click"/>
                                <h3 class="modal-title">
                                    <%-- 错误信息标题 --%>
                                    <asp:Label ID="Title" runat="server" Text="Mes"></asp:Label>
                                </h3>
                            </div>
                            <div class="modal-body">
                                <%-- 错误信息内容 --%>
                                <asp:Label ID="Content" runat="server" Text="Mes"></asp:Label>
                                <asp:Button ID="Btn_goLogin" runat="server" Text="去登录" class="btn btn-primary" OnClick="Btn_goLogin_Click" />
                                <asp:Button ID="Btn_goLogin2" runat="server" Text="去登录" class="btn btn-primary" OnClick="Btn_goLogin2_Click"/>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Btn_out" runat="server" Text="关闭" class="btn btn-default"  OnClick="Btn_out_Click" />
                                <asp:Button ID="Btn_know" runat="server" Text="知道了" class="btn btn-primary"  OnClick="Btn_out_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        var checkLogin = true;
        $(function () {
            if (checkLogin) {
                $("#mymodal").modal("show");
                console.log(checkLogin);
            }
        });
    </script>
</body>
</html>
