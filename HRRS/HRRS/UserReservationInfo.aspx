<%@ Page Title="患者预约信息列表" Language="C#" MasterPageFile="~/MasterSite2.Master" AutoEventWireup="true" CodeBehind="UserReservationInfo.aspx.cs" Inherits="HRRS.UserReservationInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav > li:nth-child(2) > a {
            color: #fff;
            background-color: #337ab7;
        }

            .nav > li:nth-child(2) > a > span {
                background-color: white;
                color: #337ab7;
            }

        .nav > li > a {
            color: #337ab7;
            background-color: transparent;
        }

        .ReservationInfoList {
            box-shadow: 0 0 20px #ccc;
            margin-top: 40px;
            border-radius: 20px;
        }

            .ReservationInfoList > h3 {
                text-align: center;
                margin: 10px 0px;
                padding: 5px 0px;
            }

        #list-box {
            height: 550px;
            margin-bottom: 40px;
            border: 1px solid #ccc;
            border-radius: 20px;
            padding: 0px;
            overflow: hidden;
        }

        #list {
            height: 100%;
            overflow: auto;
        }

        .table > tbody > tr > td,
        .table > tbody > tr > th,
        .table > tfoot > tr > td,
        .table > tfoot > tr > th,
        .table > thead > tr > td,
        .table > thead > tr > th {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: middle;
            border-top: 1px solid #ddd;
        }

        th,
        td {
            text-align: center;
        }

        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-8 col-md-offset-1 ReservationInfoList">
            <h3>患者预约列表</h3>
            <div class="col-md-12" id="list-box">
                <div id="list">
                    <table class="table table-striped table-hover">
                        <tr id="header">
                            <th>预约号</th>
                            <th>姓名</th>
                            <th>预约时间</th>
                            <th>操作</th>
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr id="item">
                                    <td><%# Eval("appointmentID") %></td>
                                    <td><%# Eval("RealName") %></td>
                                    <td><%# Eval("AppointmentTime") %></td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" CommandArgument='<%# Eval("appointmentID") %>' OnCommand="LinkButton1_Command">已出诊</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
