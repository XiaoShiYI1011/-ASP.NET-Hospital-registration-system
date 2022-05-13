<%@ Page Title="医院" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="HospitalList.aspx.cs" Inherits="HRRS.HospitalList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav > .li-item:nth-child(2) {
            background-color: #E7E7E7;
        }

        .nav > .li-item {
            background-color: #f8f8f8;
        }

        .hospital-list {
            box-shadow: 0 0 20px #ccc;
            border-radius: 20px;
            margin-bottom: 20px
        }

        .title {
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
            padding: 8px 5px;
        }

            .title > i {
                position: relative;
                top: 4px
            }

        .thumbnail-img-box {
            width: 100%;
            height: 250px;
            overflow: hidden;
            position: relative;
        }

            .thumbnail-img-box > img {
                width: 100%;
                position: absolute;
                top: -150%
            }

        .btnGroup {
            text-align: right;
        }

        .title {
            margin-bottom: 10px
        }

        #order-box {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            border-radius: 4px
        }

        #order {
            display: flex;
            justify-content: space-around;
        }

            #order > .form-group-box {
                display: flex;
                margin-top: 10px
            }

        .form-group-label {
            margin-top: 7px;
            margin-right: 5px
        }

        .form-group {
            margin-bottom: 10px
        }

        .form-select {
            width: 150px;
            text-align: center
        }

        .thumbnail {
            transition: all 0.3s
        }

            .thumbnail:hover {
                box-shadow: 0 0 20px #ccc;
                transform: translateY(-6px)
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-md-10 col-md-offset-1 hospital-list">
            <h3 class="title">
                <i>
                    <svg t="1646136827568" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1830" width="25" height="25">
                        <path d="M512.796029 970.586145c-44.734264 0-86.786326-17.419924-118.419681-49.050083l-289.760894-289.760894c-65.296744-65.296744-65.296744-171.542618 0-236.836165L394.376348 105.178109c31.630158-31.633355 73.685417-49.050083 118.419681-49.050083s86.789523 17.419924 118.419681 49.050083l289.760894 289.760894c65.296744 65.296744 65.296744 171.542618 0 236.836165l-289.760894 289.760894c-31.630158 31.626961-73.685417 49.050083-118.419681 49.050083z m0-869.704674c-32.777846 0-63.592794 12.765234-86.770341 35.942781l-289.760895 289.760894c-47.84485 47.84485-47.84485 125.695832 0 173.543879l289.760895 289.760894c23.177547 23.177547 53.992495 35.94278 86.770341 35.942781s63.595991-12.765234 86.773538-35.942781l289.760894-289.760894c47.84485-47.84485 47.84485-125.695832 0-173.543879l-289.760894-289.760894c-23.177547-23.177547-53.995692-35.94278-86.773538-35.942781z" fill="#ff0000" p-id="1831"></path>
                        <path d="M590.752509 778.231688h-151.654685a22.378321 22.378321 0 0 1-22.378321-22.378321v-137.898411H278.821092a22.378321 22.378321 0 0 1-22.378321-22.378321V443.921951a22.378321 22.378321 0 0 1 22.378321-22.378321h137.901608V283.645219a22.378321 22.378321 0 0 1 22.378321-22.378321h151.654684a22.378321 22.378321 0 0 1 22.378321 22.378321v137.898411h137.901608a22.378321 22.378321 0 0 1 22.378321 22.378321v151.654684a22.378321 22.378321 0 0 1-22.378321 22.378321H613.134026v137.898411a22.381518 22.381518 0 0 1-22.381517 22.378321z m-129.273167-44.756642h106.898042v-137.898411a22.378321 22.378321 0 0 1 22.378321-22.378321h137.901608V466.300272H590.755705a22.378321 22.378321 0 0 1-22.378321-22.378321V306.02354h-106.898042v137.898411a22.378321 22.378321 0 0 1-22.378321 22.378321H301.199413v106.898042h137.901608a22.378321 22.378321 0 0 1 22.378321 22.378321v137.898411z" fill="#ff0000" p-id="1832"></path>
                    </svg>
                </i>
                医院列表
            </h3>
            <div class="col-md-12">
                <div class="col-md-12" id="order-box">
                    <div class="col-md-6 col-md-offset-3" id="order">
                        <div class="form-group form-group-box">
                            <div>
                                <label for="selectGrade" class="form-group-label">级别:</label>
                            </div>
                            <div>
                                <asp:DropDownList CssClass="form-control form-select" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group form-group-box">
                            <div>
                                <label for="selectRegion" class="form-group-label">地区:</label>
                            </div>
                            <div>
                                <asp:DropDownList CssClass="form-control form-select" ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                for (int i = 0; i < hospital.Tables[0].Rows.Count; i++)
                {
                    Response.Write("<div class='col-md-12 column'>");
                    Response.Write("<div class='thumbnail'>");
                    Response.Write("<div class='thumbnail-img-box'>");
                    Response.Write("<img src='" + Convert.ToString(hospital.Tables[0].Rows[i][@"HospitalImg"]).Substring(1) + "' />");
                    Response.Write("</div>");
                    Response.Write("<div class='caption'>");
                    Response.Write("<h3>" + Convert.ToString(hospital.Tables[0].Rows[i][@"HospitaName"]) + "</h3>");
                    Response.Write("<h4>" + Convert.ToString(hospital.Tables[0].Rows[i][@"Grade"]) + "</h4>");
                    Response.Write("<p>" + Convert.ToString(hospital.Tables[0].Rows[i][@"HospitaDescribe"]).Substring(0, 100) + "···</p>");
                    Response.Write("<p class='btnGroup'>");
                    Response.Write("<a class='btn btn-primary' role='button' href='HospitalDetails.aspx?hospitalID=" + Convert.ToString(hospital.Tables[0].Rows[i][@"hospitalID"]) + "'>查看详情</a>&nbsp;&nbsp;");
                    Response.Write("</p>");
                    Response.Write("</div>");
                    Response.Write("</div>");
                    Response.Write("</div>");
                }
            %>
        </div>
    </div>
</asp:Content>
