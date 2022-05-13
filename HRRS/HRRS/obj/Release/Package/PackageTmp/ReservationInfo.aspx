<%@ Page Title="预约信息" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="ReservationInfo.aspx.cs" Inherits="HRRS.ReservationInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .col-md-3 {
            box-shadow: 0px 10px 1000px #dbd9d9;
            min-height: 530px
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

        #reserveInfo {
            width: 100%;
            margin-top: 20px;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .reserveNumber {
            overflow: hidden;
        }

        .reserveInfo-box {
            width: 90%;
            margin-left: 20px;
        }

        .reserveNumber > div {
            width: 15%;
            height: 50px;
            line-height: 50px;
            margin-top: 10px;
            float: left;
        }

            .reserveNumber > div:first-child {
                margin-left: 0px;
                text-align: center;
                font-weight: bold;
            }

            .reserveNumber > div:last-child {
                font-size: 50px;
                margin-left: 20px;
            }

        .base-info > ul {
            margin-top: 10px;
        }

            .base-info > ul > li {
                margin-left: -10px;
                list-style: none;
                display: flex;
                align-items: baseline;
            }

                .base-info > ul > li > .content-show-l,
                .base-info > ul > li > .content-show-r {
                    width: 80%;
                    margin-top: 10px;
                    margin-bottom: 10px;
                    color: black;
                }

                .base-info > ul > li > .content-show-l {
                    width: 10%;
                    color: #828282;
                }

        .notice {
            border: 2px solid #fff1ac;
            margin-top: 10px;
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
                        <li><a href="UserInfo.aspx">个人信息</a></li>
                        <li class="active"><a href="ReservationInfo.aspx">预约信息</a></li>
                        <li><a href="Consults.aspx"><span class="badge pull-right" id="Unread">0</span> 问诊信息</a></li>
                    </ul>
                </div>
                <%-- 预约信息区 --%>
                <div class="col-md-9">
                    <div class="col-md-12" style="padding: 0px">
                        <h3>预约信息</h3>
                        <div id="reserveInfo">
                            <div class="reserveInfo-box">
                                <div class="reserveNumber">
                                    <div>预约号</div>
                                    <div><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
                                </div>
                                <div class="base-info">
                                    <ul>
                                        <li>
                                            <div class="content-show-l">姓&nbsp;&nbsp;&nbsp;名</div>
                                            <div class="content-show-r">&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></div>
                                        </li>
                                        <li>
                                            <div class="content-show-l">医&nbsp;&nbsp;&nbsp;院</div>
                                            <div class="content-show-r">&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></div>
                                        </li>
                                        <li>
                                            <div class="content-show-l">科&nbsp;&nbsp;&nbsp;室</div>
                                            <div class="content-show-r">&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></div>
                                        </li>
                                        <li>
                                            <div class="content-show-l">医&nbsp;&nbsp;&nbsp;生</div>
                                            <div class="content-show-r">&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></div>
                                        </li>
                                        <li>
                                            <div class="content-show-l">时&nbsp;&nbsp;&nbsp;间</div>
                                            <div class="content-show-r">&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></div>
                                            <asp:Button ID="Button1" runat="server" Text="取消预约" CssClass="btn btn-warning" OnClick="Button1_Click1" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 notice">
                            <h4 class="bg-warning">请仔细核对挂号信息</h4>
                            <p class="bg-warning">
                                2.请务必仔细核对<font color="red">医院院区、预约时间、科室名称、医生姓名</font>、一旦预约成功<font color="red">不可修改</font>。<br />
                                3.因医院工作的特殊性，可能会出现医生<font color="red">临时紧急停诊</font>。如遇此种情况，预约患者会收到通知，患者无需处理。<br />
                                4.如因特殊情况不能来院就诊，可在就诊前一日<font color="red">在线取消预约</font>。<br />
                                5.如逾期未就诊，按照<font color="red">爽约处理</font>，预约号作废。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $("#Unread").text(<%= Count %>);
        });
    </script>
</asp:Content>
