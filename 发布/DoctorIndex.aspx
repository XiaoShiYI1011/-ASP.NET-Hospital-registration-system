<%@ Page Title="医者仁心挂号系统医生端" Language="C#" MasterPageFile="~/MasterSite2.Master" AutoEventWireup="true" CodeBehind="DoctorIndex.aspx.cs" Inherits="HRRS.DoctorIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav > li:first-child > a {
            color: #fff;
            background-color: #337ab7;
        }

        .nav > li > a {
            color: #337ab7;
            background-color: transparent;
        }

        .col-md-8,
        .col-md-4 {
            min-height: 250px;
        }

        .img-box {
            width: 100%;
        }

            .img-box > img {
                width: 38%;
                margin-top: 32%;
                border-radius: 8px;
            }

            .img-box > a {
                padding: 5px 15px;
                margin-top: 15px;
                margin-left: 25px
            }

        .table-info {
            width: 85%;
            margin-bottom: 8px;
            border-right: 1px dashed #ccc
        }

            .table-info > tbody > tr > td:first-child {
                width: 15%;
                text-align: center;
                color: #828282;
            }

            .table-info > tbody > tr > td {
                padding: 11px;
            }

        .table-striped > tbody > tr > td {
            text-align: center;
        }

        .myTable > thead > tr > th,
        .myTable > tbody > tr > td {
            text-align: center;
        }

        .col-md-7 {
            border-right: 1px dashed #ccc;
        }

        .col-md-5 > div {
            width: 60%;
            margin: 0px auto;
            padding: 5px;
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

        #fromUpDate {
            overflow: hidden;
            padding: 20px
        }

        .DoctorUpHeadPortraitModel {
            position: fixed;
            top: 3%;
            left: 30%;
            z-index: 999999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="border-bottom: 1px solid #ccc">
        <div class="col-md-9">
            <h2 style="border-bottom: 1px dashed #ccc; width: 85%">基本信息</h2>
            <table class="table-info">
                <tr>
                    <td>账&nbsp;&nbsp;&nbsp;号</td>
                    <td>
                        <asp:Label ID="DoctorName" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>姓&nbsp;&nbsp;&nbsp;名</td>
                    <td>
                        <asp:Label ID="DoctorRealName" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>性&nbsp;&nbsp;&nbsp;别</td>
                    <td>
                        <asp:Label ID="DoctorSex" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>所属医院</td>
                    <td>
                        <asp:Label ID="HospitaName" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>所属科室</td>
                    <td>
                        <asp:Label ID="Department" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>简&nbsp;&nbsp;&nbsp;介</td>
                    <td>
                        <asp:Label ID="DoctorDescribe" runat="server" Text="光辐射大概的发射点风格计划发给甲方根据对韩国的高房价附近的共和感到十分光滑事故发生当天应该给予他就是的符合公司法关键是要让结帖人对于客人要"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>职&nbsp;&nbsp;&nbsp;位</td>
                    <td>
                        <asp:Label ID="DoctorPosition" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td colspan="2" style="text-align: right">
                        <a href="javascript:void(0)" class="btn btn-default" style="padding: 5px 15px;" id="UpdateDoctorBtn">编辑</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-3">
            <div class="img-box">
                <asp:Image ID="Image2" runat="server" /><br />
                <asp:LinkButton ID="btnUpImg" CssClass="btn btn-default" runat="server" OnClick="btnUpImg_Click">修改</asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 8px">
        <div class="col-md-8">
            <div id="workTable">
                <h2 style="border-bottom: 1px dashed #ccc">值班时间</h2>
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <td>日期</td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() %><br />
                                <%= DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(1).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(2).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(3).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(4).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(5).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(6).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                        </tr>
                        <tr>
                            <td>上午</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button1_Click" /></td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button2_Click" /></td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button3_Click" /></td>
                            <td>
                                <asp:Button ID="Button4" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button4_Click" /></td>
                            <td>
                                <asp:Button ID="Button5" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button5_Click" /></td>
                            <td>
                                <asp:Button ID="Button6" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button6_Click" /></td>
                            <td>
                                <asp:Button ID="Button7" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button7_Click" /></td>
                        </tr>
                        <tr>
                            <td>下午</td>
                            <td>
                                <asp:Button ID="Button8" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button8_Click" /></td>
                            <td>
                                <asp:Button ID="Button9" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button9_Click" /></td>
                            <td>
                                <asp:Button ID="Button10" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button10_Click" /></td>
                            <td>
                                <asp:Button ID="Button11" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button11_Click" /></td>
                            <td>
                                <asp:Button ID="Button12" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button12_Click" /></td>
                            <td>
                                <asp:Button ID="Button13" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button13_Click" /></td>
                            <td>
                                <asp:Button ID="Button14" runat="server" Text="值班" Visible="false" CssClass="btn btn-primary" OnClick="Button14_Click" /></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="8" style="text-align: center">
                                <a href="javascript:void(0)" class="btn btn-default" style="width: 20%" id="upDateWorkBtn">修改</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div id="upDateWorkTable">
                <h2 style="border-bottom: 1px dashed #ccc">修改值班时间</h2>
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <td>日期</td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() %><br />
                                <%= DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(1).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(2).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(3).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(4).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(5).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                            <td>
                                <%= DateTime.Now.Month.ToString() + "/" + DateTime.Now.AddDays(6).Day.ToString() %><br />
                                <%= DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) %>
                            </td>
                        </tr>
                        <tr>
                            <td>上午</td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox2" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox3" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox4" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox5" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox6" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox7" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>下午</td>
                            <td>
                                <asp:CheckBox ID="CheckBox8" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox9" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox10" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox11" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox12" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox13" runat="server" /></td>
                            <td>
                                <asp:CheckBox ID="CheckBox14" runat="server" /></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="8" style="text-align: center">
                                <div class="btn-group">
                                    <a href="javascript:void(0)" class="btn btn-default" id="cancelUpDateWorkBtn">取消</a>
                                    <asp:Button ID="BtnConfUpdate" runat="server" Text="确定修改" CssClass="btn btn-warning BtnConfUpdate" OnClick="BtnConfUpdate_Click" />
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <%-- 头像修改弹出框 --%>
    <asp:Panel ID="DoctorUpHeadPortraitModel" runat="server" CssClass="DoctorUpHeadPortraitModel" Visible="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Button ID="BtnClose" runat="server" Text="&times;" class="close" data-dismiss="modal" OnClick="BtnClose_Click" />
                    <h3 class="modal-title">修改头像</h3>
                </div>
                <div class="modal-body">
                    <div class="model-body-box">
                        <div id="headPortrait-box">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/Doctor_Imgs/D_001.jpg" />
                        </div>
                        <div id="btn-up-box">
                            <asp:FileUpload ID="FileUP" runat="server" CssClass="btn btn-default file-up" />
                        </div>
                    </div>
                    <div class="model-body-footer">
                        <p>图片宽度*高度至少为150*150像素，大小不超过2MB</p>
                        <asp:Button ID="BtnFileUP" runat="server" Text="上传" OnClick="BtnFileUP_Click" class="btn btn-primary btn-file-up" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="BtnClose2" runat="server" Text="取消" class="btn btn-default" data-dismiss="modal" OnClick="BtnClose2_Click" />
                    <asp:Button ID="confUpDateImg" runat="server" Text="确定修改" CssClass="btn btn-primary" data-dismiss="modal" OnClick="confUpDateImg_Click" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <%-- 信息修改弹出框 --%>
    <div class="modal fade bs-example-modal-lg" id="UpdateDoctorModel">
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
                            <label for="UpDoctorName" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDoctorName" name="UpDoctorName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDoctorRealName" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;名</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDoctorRealName" name="UpDoctorRealName" runat="server" class="form-control"></asp:TextBox>
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
                            <label for="UphospitalID" class="col-sm-2 control-label">所属医院</label>
                            <div class="col-sm-10">
                                <asp:DropDownList class="form-control" ID="Uphospitaldrop" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpdeptID" class="col-sm-2 control-label">所属科室</label>
                            <div class="col-sm-10">
                                <asp:DropDownList class="form-control" ID="Updeptdrop" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDoctorDescribe" class="col-sm-2 control-label">简&nbsp;&nbsp;&nbsp;介</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDoctorDescribe" name="UpDoctorDescribe" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDoctorPosition" class="col-sm-2 control-label">职&nbsp;&nbsp;&nbsp;位</label>
                            <div class="col-sm-10">
                                <asp:DropDownList class="form-control" ID="UpPositiondrop" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <asp:Button ID="BtnConfUpDateInfo" runat="server" Text="确认修改" OnClick="BtnConfUpDate_Click" class="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $("#workTable").show();
            $("#upDateWorkTable").hide();

            $("#upDateWorkBtn").click(function () {
                $("#workTable").hide(500);
                $("#upDateWorkTable").show(500);
            });

            $("#cancelUpDateWorkBtn").click(function () {
                $("#workTable").show(500);
                $("#upDateWorkTable").hide(500);
            });
            $("#UpdateDoctorBtn").click(function () {
                $("#UpdateDoctorModel").modal("show");
            });
        });
    </script>
</asp:Content>
