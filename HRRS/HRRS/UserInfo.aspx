<%@ Page Title="个人中心" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="HRRS.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .col-md-3 {
            box-shadow: 0px 10px 1000px #dbd9d9;
            min-height: 500px;
        }

        #info-box {
            border-radius: 25px;
            box-shadow: 0 0 25px #ccc;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .nav-stacked {
            margin: 20px 0px
        }

        #header {
            width: 100%;
            height: 130px;
            border-bottom: 1px solid #ccc;
            position: relative;
            top: 0px;
        }

        #headPortrait {
            width: 15%;
            height: 84%;
            margin-left: 40px;
            margin-top: 2%;
            border-radius: 100%;
            overflow: hidden;
        }

            #headPortrait > img {
                width: 100%;
            }

        #headerName {
            position: absolute;
            top: 0%;
            left: 25%;
        }

        .btn-up {
            width: 100%;
            margin-top: 15px;
        }

        #content {
            width: 100%;
        }

            #content > #title {
                border-bottom: 1px solid #ccc;
            }

                #content > #title > h2 {
                    margin-left: 15px;
                }

        #info > table {
            margin-top: 15px;
            width: 80%;
        }

        .table-item {
            margin-bottom: 15px;
        }

            .table-item > td:first-child {
                width: 85px;
                text-align: right;
                color: #828282;
            }

            .table-item > td {
                border-bottom: 0px solid #fff;
            }

            .table-item > th,
            .table-item > td {
                padding: 10px;
            }

        #btnUpdate-box {
            text-align: right;
        }

        .btn-warning {
            width: 100px;
            margin-top: 15px;
            margin-right: 10px
        }

        #fromUpDate {
            overflow: hidden;
            padding: 20px
        }

        .upImg-box {
            text-align: center;
        }

            .upImg-box > img {
                width: 45%;
                margin-bottom: 20px;
                border-radius: 100%;
                text-align: center;
            }

        .model-body-box {
            width: 100%;
            display: flex;
        }

        #headPortrait-box {
            width: 50%;
            text-align: center;
        }

            #headPortrait-box > img {
                width: 250px;
            }

        #btn-up-box {
            width: 50%;
        }

        .file-up {
            width: 100%;
            margin-top: 100px;
            color: rgb(74 74 74)
        }

        .model-body-footer {
            width: 100%;
            text-align: center;
            margin-top: 20px;
            color: rgb(74 74 74);
        }

        .btn-file-up {
            width: 40%
        }

        .UpHeadPortraitModel {
            position: fixed;
            top: 3%;
            left: 30%;
            z-index: 999999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-md-10 col-md-offset-1">
            <div id="info-box">
                <%-- 个人中心导航区 --%>
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#" onclick="window.history.go(-1)">返回</a></li>
                        <li class="active"><a href="UserInfo.aspx">个人信息</a></li>
                        <li><a href="ReservationInfo.aspx">预约信息</a></li>
                        <li><a href="Consults.aspx"><span class="badge pull-right" id="Unread">0</span> 问诊信息</a></li>
                    </ul>
                </div>
                <%-- 基本信息区 --%>
                <div class="col-md-9">
                    <div id="header">
                        <div id="headPortrait">
                            <asp:Image ID="Image2" runat="server" />
                        </div>
                        <h4 id="headerName">
                            <asp:Label ID="headerName_label" runat="server" Text="Label" Font-Size="35px"></asp:Label>
                            <asp:LinkButton ID="btnUpHeadPortrait" CssClass="btn btn-default btn-up" runat="server" OnClick="btnUpHeadPortrait_Click1">修改头像</asp:LinkButton>
                        </h4>
                    </div>
                    <div id="content">
                        <div id="title">
                            <h2>基本信息</h2>
                        </div>
                        <div id="info">
                            <table>
                                <tr class="table-item">
                                    <td>昵&nbsp;&nbsp;&nbsp;称</td>
                                    <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="userName" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td>姓&nbsp;&nbsp;&nbsp;名</td>
                                    <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="realName" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td>性&nbsp;&nbsp;&nbsp;别</td>
                                    <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="userSex" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td>手机号</td>
                                    <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="userPhone" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td>身份证号</td>
                                    <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="iDCard" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div id="btnUpdate-box">
                                <%-- href="javascript:void(0)"：伪协议，仅适用于此标签后台无相关代码的情况下使用（ASP.MET 真的是我用过的最垃圾的框架） --%>
                                <a href="javascript:void(0)" class="btn btn-warning" id="btnUpdate">修改</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- 个人信息修改弹出框 --%>
    <div class="modal fade bs-example-modal-lg" id="UpdateModel">
        <div class="modal-dialog model-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h3 class="modal-title">修改个人信息</h3>
                </div>
                <div class="modal-body">
                    <div id="fromUpDate">
                        <div class="form-group">
                            <label for="UpDateUserName" class="col-sm-2 control-label">昵&nbsp;&nbsp;&nbsp;称</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDateUserName" name="UpDateUserName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDateRealName" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;名</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDateRealName" name="RealName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <label class="control-label">性&nbsp;&nbsp;&nbsp;别</label>
                                <div class="checkbox" style="display: inline">
                                    <label>
                                        <asp:RadioButton ID="UpDateSex" GroupName="sex" runat="server" />
                                        男
                                    </label>
                                    <label>
                                        <asp:RadioButton ID="RadioButton1" GroupName="sex" runat="server" />
                                        女
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDateUserPhone" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDateUserPhone" name="UpDateUserPhone" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDateIDCard" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDateIDCard" name="UpDateIDCard" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <asp:Button ID="BtnConfUpDate" runat="server" Text="确认修改" class="btn btn-primary" OnClick="BtnConfUpDate_Click" />
                </div>
            </div>
        </div>
    </div>
    <%-- 头像修改弹出框 --%>
    <asp:Panel ID="UpHeadPortraitModel" CssClass="UpHeadPortraitModel" runat="server" Visible="false">
        <div class="modal-dialog">
            <div class="modal-content" style="box-shadow: 0 5px 20px rgb(0 0 0 / 50%);">
                <div class="modal-header">
                    <asp:Button ID="close_icon" runat="server" Text="&times;" class="close" data-dismiss="modal" OnClick="close_icon_Click1"/>
                    <h3 class="modal-title">修改头像</h3>
                </div>
                <div class="modal-body">
                    <div class="model-body-box">
                        <div id="headPortrait-box">
                            <asp:Image ID="Image1" runat="server" />
                        </div>
                        <div id="btn-up-box">
                            <asp:FileUpload ID="FileUP" runat="server" CssClass="btn btn-default file-up" />
                        </div>
                    </div>
                    <div class="model-body-footer">
                        <p>图片宽度*高度至少为150*150像素，大小不超过2MB</p>
                        <asp:Button ID="BtnFileUP" runat="server" Text="上传" OnClick="BtnFileUP_Click" class="btn btn-primary btn-file-up"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Btn_out" runat="server" Text="取消" class="btn btn-default" data-dismiss="modal" OnClick="Btn_out_Click1" />
                    <asp:Button ID="confUpDateImg" runat="server" Text="确定修改" CssClass="btn btn-primary" data-dismiss="modal" OnClick="confUpDateImg_Click" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <script>
        $(function () {
            $("#Unread").text(<%= Count %>);
            $("#btnUpdate").click(function () {
                $("#UpdateModel").modal("show");
            });
        });
    </script>
</asp:Content>
