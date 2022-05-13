<%@ Page Title="医院详情" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="HospitalDetails.aspx.cs" Inherits="HRRS.HospitalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .my-row {
            box-shadow: 0 0 25px #ccc;
            border-radius: 20px;
            margin-bottom: 10px
        }

        .img-box > img {
            width: 100%;
            border-radius: 4px
        }

        #hosputalInfo > p {
            border-bottom: 1px dashed #ccc;
            border-top: 1px dashed #ccc;
            padding: 5px 0px
        }

        .title {
            border-bottom: 1px solid aqua;
            padding: 5px 8px;
        }

            .title > i > svg {
                padding-top: 2px
            }

        #Department {
            border: 1px solid #ccc;
            height: 150px;
            overflow: auto;
            border-radius: 6px;
            padding: 10px;
        }

            #Department > .dept-item {
                float: left;
                width: fit-content;
                width: -webkit-fit-content;
                width: -moz-fit-content;
                height: fit-content;
                height: -webkit-fit-content;
                height: -moz-fit-content;
                padding: 10px;
                margin: 8px 8px;
                border-radius: 10px;
                transition: all 0.3s
            }

            #Department > .dept-item {
                font-size: 16px;
                color: #333333;
            }

                #Department > .dept-item:hover {
                    box-shadow: 0 0 20px #ccc;
                    transform: translateY(-5px)
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
            width: 210px;
            text-align: center;
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
    <div class="row clearfix my-row">
        <div class="col-md-12">
            <div class="col-md-5" style="padding-right: 0px; margin-top: 15px;">
                <div class="img-box">
                    <img src='<%= Convert.ToString(hospital.Tables[0].Rows[0][@"HospitalImg"]).Substring(1) %>' />
                </div>
            </div>
            <div class="col-md-7" id="hosputalInfo">
                <h1><%= Convert.ToString(hospital.Tables[0].Rows[0][@"HospitaName"]) %></h1>
                <h4>级别：<%= Convert.ToString(hospital.Tables[0].Rows[0][@"Grade"]) %></h4>
                <h4>地址：<%= Convert.ToString(hospital.Tables[0].Rows[0][@"HospitaRegion"]) %></h4>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= Convert.ToString(hospital.Tables[0].Rows[0][@"HospitaDescribe"]) %></p>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 15px">
            <h2 class="title">
                <i>
                    <svg t="1647324674356" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2989" width="26" height="26">
                        <path d="M676.227072 593.792q0 51.2-42.112 51.2H524.803072v113.152a48 48 0 0 1-12.8 38.4 56.192 56.192 0 0 1-38.4 11.52 56.064 56.064 0 0 1-38.4-11.904 49.664 49.664 0 0 1-12.8-38.4v-112.768h-102.4a48 48 0 0 1-38.4-12.8 56.192 56.192 0 0 1-11.52-38.4 56.064 56.064 0 0 1 11.904-38.4 49.28 49.28 0 0 1 38.4-12.8H422.403072v-115.2A37.248 37.248 0 0 1 435.203072 396.8a58.624 58.624 0 0 1 38.4-11.136c34.176 0 51.2 13.952 51.2 42.112v113.92h110.08a36.608 36.608 0 0 1 30.72 13.696 60.672 60.672 0 0 1 10.624 38.4z" p-id="2990"></path>
                        <path d="M1003.139072 546.944q-28.672-62.208-57.088-124.544-42.752-92.672-85.504-185.728a25.6 25.6 0 0 0-22.016-12.8h-89.6l-1.792-1.28-160.512-87.04-97.28-52.736-3.968-2.304a38.4 38.4 0 0 0-73.6-2.688c-5.76 3.712-11.136 7.424-15.744 9.856L297.219072 140.8l-152.32 82.688H25.603072a26.624 26.624 0 0 0-25.6 26.752v695.552A26.624 26.624 0 0 0 25.603072 972.8h811.008a20.608 20.608 0 0 0 23.936-12.8q42.752-92.928 85.504-185.728L1001.347072 652.8c6.912-14.464 22.656-37.12 22.656-54.784s-14.464-37.12-20.864-51.072zM837.763072 277.12c-1.792 4.48-4.224 3.712-6.656 1.28 3.84-0.256 6.4-0.64 6.656-1.28zM436.355072 125.824A38.4 38.4 0 0 0 448.003072 128a35.328 35.328 0 0 0 10.496-1.664l179.2 97.536H256.003072z m379.264 786.176H61.315072v-627.2h717.824c2.176 0 22.528 1.28 36.992 1.28 0.768 1.28 18.688 40.32 26.368 57.216l117.504 256z" p-id="2991"></path>
                    </svg>
                </i>
                科室列表
            </h2>
            <div class="col-md-12">
                <div id="Department">
                    <% 
                        for (int i = 0; i < doctor.Tables[0].Rows.Count; i++)
                        {
                            Response.Write("<div class='dept-item'>");
                            Response.Write(Convert.ToString(doctor.Tables[0].Rows[i][@"Department"]));
                            Response.Write("</div>");
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 15px">
            <h2 class="title">
                <i>
                    <svg t="1647345771021" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4178" width="26" height="26">
                        <path d="M1024.244053 733.013333c0 46.933333-20.906667 55.701333-97.92 56.064-20.693333-182.037333-118.4-271.765333-222.933333-314.496a244.565333 244.565333 0 0 0 6.186667-299.029333 149.226667 149.226667 0 0 1 97.92 280.874667A281.344 281.344 0 0 1 1024.244053 733.013333zM603.124053 489.28C727.924053 513.557333 874.91072 596.181333 874.91072 832c0 64-85.12 64-362.666667 64-278.613333 0-362.666667 0.661333-362.666666-64 0-235.242667 146.56-318.293333 271.786666-342.72a192 192 0 1 1 181.76 0zM320.457387 473.6C216.564053 517.354667 119.07072 609.322667 98.377387 789.333333 20.937387 789.162667 0.244053 780.650667 0.244053 733.12a271.722667 271.722667 0 0 1 215.466667-277.333333A149.141333 149.141333 0 0 1 314.91072 175.573333a244.288 244.288 0 0 0 5.546667 298.026667z" p-id="4179"></path>
                    </svg>
                </i>
                医生列表
            </h2>
            <div class="row" style="margin-bottom: 40px">
                <div class="col-md-6 col-md-offset-1" id="order">
                    <div class="form-group form-group-box">
                        <div>
                            <label for="DropDownList1" class="form-group-label">科室:</label>
                        </div>
                        <div>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control form-select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group form-group-box">
                        <div>
                            <label for="DropDownList2" class="form-group-label">职称:</label>
                        </div>
                        <div>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control form-select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <% 
                        for (int i = 0; i < doctor.Tables[0].Rows.Count; i++)
                        {
                            Response.Write("<div class='col-md-2'>");
                            Response.Write("<div class='thumbnail'>");
                            Response.Write("<img src='" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorImg"]).Substring(1) + "' />");
                            Response.Write("<div class='caption' style='text-align: center'");
                            Response.Write("<h3 style='margin-top: 0px'>" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorRealName"]) + "</h3>");
                            Response.Write("<h5>" + "级别：" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorPosition"]) + "</h5>");
                            Response.Write("<h5>" + "科室：" + Convert.ToString(doctor.Tables[0].Rows[i][@"Department"]) + "</h5>");
                            Response.Write("<div>");
                            Response.Write("<a class='btn btn-primary' href='DoctorDetails.aspx?doctorID=" + Convert.ToString(doctor.Tables[0].Rows[i][@"doctorID"]) + "'>查看详情</a>");
                            Response.Write("</div>");
                            Response.Write("</div>");
                            Response.Write("</div>");
                            Response.Write("</div>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <script>
        function rancolr() {
            let r = parseInt(Math.random() * 256);
            let g = parseInt(Math.random() * 256);
            let b = parseInt(Math.random() * 256);
            let rgb = "rgba(" + r + " " + g + " " + b + " / 0.20)";
            return rgb;
        }

        const deptItem = document.querySelectorAll("#Department > .dept-item");
        deptItem.forEach((deptItem) => {
            deptItem.style.backgroundColor = rancolr();
        });
    </script>
</asp:Content>
