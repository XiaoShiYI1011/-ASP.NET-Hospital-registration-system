<%@ Page Title="医生详情" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="HRRS.DoctorDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--           佛祖保佑      永无BUG      永不修改
     \\ \\ \\ \\ \\ \\ \\ \\ || || || || || || // // // // // // // //
     \\ \\ \\ \\ \\ \\ \\        _ooOoo_          // // // // // // //
     \\ \\ \\ \\ \\ \\          o8888888o            // // // // // //
     \\ \\ \\ \\ \\             88" . "88               // // // // //
     \\ \\ \\ \\                (| -_- |)                  // // // //
     \\ \\ \\                   O\  =  /O                     // // //
     \\ \\                   ____/`---'\____                     // //
     \\                    .'  \\|     |//  `.                      //
     ==                   /  \\|||  :  |||//  \                     ==
     ==                  /  _||||| -:- |||||-  \                    ==
     ==                  |   | \\\  -  /// |   |                    ==
     ==                  | \_|  ''\---/''  |   |                    ==
     ==                  \  .-\__  `-`  ___/-. /                    ==
     ==                ___`. .'  /--.--\  `. . ___                  ==
     ==              ."" '<  `.___\_<|>_/___.'  >'"".               ==
     ==            | | :  `- \`.;`\ _ /`;.`/ - ` : | |              \\
     //            \  \ `-.   \_ __\ /__ _/   .-` /  /              \\
     //      ========`-.____`-.___\_____/___.-`____.-'========      \\
     //                           `=---='                           \\
     // //   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  \\ \\
     // // //      佛祖保佑      永无BUG      永不修改        \\ \\ \\
     // // // // // // || || || || || || || || || || \\ \\ \\ \\ \\ \\
    --%>
    <style>
        .my-row {
            box-shadow: 0 0 25px #ccc;
            border-radius: 20px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .info-box {
            margin-top: 15px;
        }

        .img-box > img {
            width: 100%;
        }

        .info > h3 {
            margin-top: 10px;
        }

        .info > p > span {
            margin-right: 20px;
        }

            .info > p > span > span {
                padding: 1px 10px;
                border-bottom: 1px solid #ccc
            }

        .info > p:last-child {
            padding: 10px 0px;
            border-top: 1px dashed #ccc;
            text-indent: 30px;
        }

        .notice {
            border: 2px solid #fff1ac;
            margin-top: 20px;
        }

        .table-striped {
            margin-top: 22px;
            margin-bottom: 85px;
            border-bottom: 1px solid #ccc;
        }

            .table-striped > tbody > tr > td {
                text-align: center
            }

        #message-box {
            height: 520px;
            padding: 0px;
            border-bottom: 1px solid #ddd;
            position: relative;
        }

        #message {
            padding: 0px;
            border-bottom: 1px solid #ddd;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            height: 520px;
            margin-bottom: 15px;
            border-radius: 0px 0px 20px 20px;
            overflow: hidden;
        }

        #send-box {
            width: 100%;
            position: absolute;
            bottom: 0px;
            overflow: hidden;
            background-color: #fafafa;
        }

        #form-send {
            margin-bottom: 0px;
        }

            #form-send > .form-control {
                width: 68.5%;
                display: inline;
                margin: 10px 0px;
                margin-top: 5px;
            }

            #form-send > .btn {
                width: 15%;
                margin: 10px 0px;
            }

        #messageList {
            height: 89.5%;
            background-color: #f4f4f4;
            overflow: auto;
        }

        .messageItem {
            margin-top: 5px;
            overflow: hidden;
        }

            .messageItem > .messageTime {
                padding-top: 10px;
                width: 100%;
                text-align: center;
            }

                .messageItem > .messageTime > span {
                    padding: 2px 10px;
                    color: #c8c8c8;
                    border-radius: 15px;
                }

        .doctorMsg > div {
            float: left
        }

        .messageItem > .userImg {
            width: 60px;
            height: 60px;
            margin: 5px;
            margin-left: 10px;
            border-radius: 8px;
            overflow: hidden;
        }

            .messageItem > .userImg > img {
                width: 100%;
            }

        .messageItem > .msg {
            max-width: 60%;
            margin-left: 5px;
            padding: 5px;
            border-radius: 8px;
        }

            .messageItem > .msg > p {
                width: fit-content;
                width: -webkit-fit-content;
                width: -moz-fit-content;
                margin: 0px;
                background-color: white;
                padding: 10px;
                border-radius: 8px;
            }

                .messageItem > .msg > p > img {
                    width: 200px;
                }

        .userMsg > div {
            float: right;
        }

        .userMsg > .msg > p {
            background-color: #95ec69;
        }

        .userMsg > .userImg {
            margin-right: 10px;
        }

        .btnImg {
            width: 50px;
            height: 33px;
        }

        .fileinput {
            width: 100%;
            height: 100%;
            opacity: 0;
            padding: 0;
            margin: 0;
        }

        .filefont {
            margin-top: -24.5px;
            height: 24px;
            display: block;
            line-height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-md-10 col-md-offset-1 my-row">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 info-box">
                    <div class="col-md-4 img-box">
                        <img src='<%= Convert.ToString(doctor.Tables[0].Rows[0][@"DoctorImg"]).Substring(1) %>' />
                    </div>
                    <div class="col-md-8 info">
                        <h3><%= Convert.ToString(doctor.Tables[0].Rows[0][@"DoctorRealName"]) %></h3>
                        <p>
                            <span>职称：<span><%= Convert.ToString(doctor.Tables[0].Rows[0][@"DoctorPosition"]) %></span></span>
                            <span>科室：<span><%= Convert.ToString(doctor.Tables[0].Rows[0][@"Department"]) %></span></span>
                        </p>
                        <p>
                            <span>医院：<span><%= Convert.ToString(doctor.Tables[0].Rows[0][@"HospitaName"]) %></span></span>
                        </p>
                        <p>
                            <%= Convert.ToString(doctor.Tables[0].Rows[0][@"DoctorDescribe"]) %>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <br />
                    <div class="tabbable" id="tabs-241783" style="border-top: 1px solid #ddd">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-120192" data-toggle="tab">预约</a>
                            </li>
                            <li>
                                <a href="#panel-795456" data-toggle="tab" id="onlie">在线咨询</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="panel-120192">
                                <div class="col-md-10 col-md-offset-1 notice">
                                    <h4 class="bg-warning">预约挂号须知</h4>
                                    <p class="bg-warning">
                                        1.预约挂号要求：就诊人信息必须填写<font color="red">本人姓名以及有效身份证号</font>，同时需提高正确的联系方式，以便于特殊情况及时通知。<br />
                                        2.预约时请务必仔细核对<font color="red">医院院区、预约时间、科室名称、医生姓名</font>、一旦预约成功<font color="red">不可修改</font>。预约成功后，会有预约成功消息提示。<br />
                                        3.因医院工作的特殊性，可能会出现医生<font color="red">临时紧急停诊</font>。如遇此种情况，预约患者会收到通知，患者无需处理。<br />
                                        4.如因特殊情况不能来院就诊，可在就诊前一日<font color="red">在线取消预约</font>。<br />
                                        5.如逾期未就诊，按照<font color="red">爽约处理</font>，预约号作废。
                                    </p>
                                </div>
                                <div class="col-md-10 col-md-offset-1">
                                    <table class="table table-striped table-hover">
                                        <tbody>
                                            <tr>
                                                <th colspan="8">
                                                    <h3 style="text-align: center">可预约时间表</h3>
                                                </th>
                                            </tr>
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
                                                    <asp:Button ID="Button1" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button1_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button2" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button2_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button3" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button3_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button4" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button4_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button5" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button5_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button6" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button6_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button7" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button7_Click" /></td>
                                            </tr>
                                            <tr>
                                                <td>下午</td>
                                                <td>
                                                    <asp:Button ID="Button8" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button8_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button9" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button9_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button10" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button10_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button11" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button11_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button12" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button12_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button13" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button13_Click" /></td>
                                                <td>
                                                    <asp:Button ID="Button14" runat="server" Text="预约" Visible="false" CssClass="btn btn-primary" OnClick="Button14_Click" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="panel-795456">
                                <div class="col-md-12" id="message">
                                    <div id="message-box">
                                        <div id="messageList">
                                            <%--<div class="messageItem doctorMsg">
                                                <p class="messageTime"><span>2022-03-22 23:39</span></p>
                                                <div class="userImg">
                                                    <img src="Assets/Doctor_Imgs/D_001.jpg" />
                                                </div>
                                                <div class="msg">
                                                    <p>大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的划v空间的大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的</p>
                                                </div>
                                            </div>
                                            <div class="messageItem userMsg">
                                                <p class="messageTime"><span>2022-03-22 23:39</span></p>
                                                <div class="userImg">
                                                    <img src="Assets/User_Imgs/U_001.jpg" />
                                                </div>
                                                <div class="msg">
                                                    <p>大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的划v空间的大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计划v空间的</p>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div id="send-box" style="border-top: 1px solid #ddd">
                                            <div class="col-md-8 col-md-offset-2">
                                                <div class="form-group" id="form-send">
                                                    <span class="btn btn-default btnImg">
                                                        <input type="file" id="file" class="fileinput" onchange="imgUp(event)" accept=".gif,.jpg,.jpeg,.png" />
                                                        <span class="filefont">
                                                            <i>
                                                                <svg t="1648639394859" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3044" width="24" height="24">
                                                                    <path d="M512 958.016611c-119.648434 0-232.1288-46.367961-316.736783-130.559656-84.640667-84.255342-131.263217-196.255772-131.263217-315.455235 0-119.168499 46.624271-231.199892 131.232254-315.424271 84.607983-84.191695 197.088348-130.559656 316.736783-130.559656s232.1288 46.367961 316.704099 130.559656c84.67163 84.224378 131.263217 196.255772 131.263217 315.391587 0.032684 119.199462-46.591587 231.232576-131.263217 315.455235C744.1288 911.615966 631.648434 958.016611 512 958.016611zM512 129.983389c-102.623626 0-199.071738 39.743475-271.583282 111.936783-72.480581 72.12794-112.416718 168.063432-112.416718 270.079828s39.903454 197.951888 112.384034 270.047144c72.511544 72.191587 168.959656 111.936783 271.583282 111.936783 102.592662 0 199.071738-39.743475 271.583282-111.936783 72.480581-72.160624 112.416718-168.063432 112.384034-270.079828 0-102.016396-39.903454-197.919204-112.384034-270.016181C711.071738 169.759548 614.592662 129.983389 512 129.983389z" p-id="3045" fill="#707070"></path>
                                                                    <path d="M736.00086 480.00086 544.00086 480.00086 544.00086 288.00086c0-17.664722-14.336138-32.00086-32.00086-32.00086s-32.00086 14.336138-32.00086 32.00086l0 192L288.00086 480.00086c-17.664722 0-32.00086 14.336138-32.00086 32.00086s14.336138 32.00086 32.00086 32.00086l192 0 0 192c0 17.695686 14.336138 32.00086 32.00086 32.00086s32.00086-14.303454 32.00086-32.00086L544.00258 544.00086l192 0c17.695686 0 32.00086-14.336138 32.00086-32.00086S753.696546 480.00086 736.00086 480.00086z" p-id="3046" fill="#707070"></path>
                                                                </svg>
                                                            </i>
                                                        </span>
                                                    </span>
                                                    <input type="text" class="form-control" id="msgInput" />
                                                    <a href="javascript:void(0)" class="btn btn-primary" id="sendBtn">发送</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        let base64;
        var div = document.getElementById("messageList");
        $(function () {
            $("#onlie").click(function () {
                setInterval(function () {
                    $.ajax({
                        url: "MessageService.ashx",
                        type: "get",
                        data: 'doctorID=' + <%= Request["doctorID"].ToString() %> + '&userID=' + <%= Session["userID"].ToString() %>,
                        async: true,  // 异步
                        dataType: "JSON",
                        success: function (data) {
                            let htmlStr = "";
                            data.forEach((data) => {
                                if (data.UserType == "0") {
                                    let messageTime = data.MessageTime;
                                    messageTime = messageTime.replace(/[^0-9]/ig, "");
                                    htmlStr += "<div class='messageItem doctorMsg'><p class='messageTime'><span>" + getLocalTime(messageTime) + "</span></p><div class='userImg'><img src='" + data.DoctorImgPath.slice(1) + "' /></div><div class='msg'><p>" + data.MessageInfo + "<img src='" + data.MeaasgeImg.slice(1) + "' /></p></div></div>";
                                } else if (data.UserType == "1") {
                                    let messageTime = data.MessageTime;
                                    messageTime = messageTime.replace(/[^0-9]/ig, "");
                                    htmlStr += "<div class='messageItem userMsg'><p class='messageTime'><span>" + getLocalTime(messageTime) + "</span></p><div class='userImg'><img src='" + data.UserImgPath.slice(1) + "' /></div><div class='msg'><p>" + data.MessageInfo + "<img src='" + data.MeaasgeImg.slice(1) + "' /></p></div></div>";
                                }
                            });
                            $("#messageList").html(htmlStr);
                            htmlStr.html = "";
                        },
                        error: function () {
                            alert("ERROR:请求回调错误");
                        }
                    });
                }, 500);
                div.scrollTop = div.scrollHeight;
            });

            $("#sendBtn").click(function () {
                let msg = $.trim($("#msgInput").val());
                if (msg != "") {
                    let imgStr = msg.split("：");
                    if (imgStr[0] != "已选择图片") {
                        $.ajax({
                            url: "SendMessageService.ashx",
                            data: 'doctorID=' + <%= Request["doctorID"].ToString() %> + '&userID=' + <%= Session["userID"].ToString() %>  + '&msg=' + msg,
                            type: "post",
                            dataType: "JSON",
                            success: function (data) {
                                if (data[0].result == "true") {
                                    $("#msgInput").val("");
                                } else {
                                    alert("发送失败，请重试");
                                }
                            },
                            error: function () {
                                alert("发送失败，请重试");
                            }
                        });
                    } else {
                        $.ajax({
                            url: "UserSendImgService.ashx",
                            type: "post",
                            data: "base64=" + base64 + "&doctorID=" + <%= Request["doctorID"].ToString() %> + "&userID=" + <%= Session["userID"].ToString() %>,
                            dataType: "json",
                            success: function (data) {
                                if (data[0].result == "true") {
                                    $("#msgInput").val("");
                                } else {
                                    alert("发送失败，请重试");
                                }
                            },
                            error: function () {
                                alert("发送失败，请重试");
                            }
                        });
                    }
                }
                div.scrollTop = div.scrollHeight;
            });
        });

        function imgUp(e) {
            const reader = new FileReader();
            reader.onload = ((file) => {
                return function () {
                    base64 = this.result;
                    document.querySelector("#msgInput").value = "已选择图片：" + file.name;
                };
            })(e.target.files[0]);
            reader.readAsDataURL(e.target.files[0]);
        }

        function getLocalTime(timeStamp) {
            return new Date(parseInt(timeStamp) * 1).toLocaleString().replace(/:\d{1,2}$/, ' ');
        }
    </script>
</asp:Content>
