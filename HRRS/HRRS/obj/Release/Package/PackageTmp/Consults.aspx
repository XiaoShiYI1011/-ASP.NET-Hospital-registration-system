<%@ Page Title="问诊信息" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Consults.aspx.cs" Inherits="HRRS.Consults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .col-md-3 {
            box-shadow: 0px 10px 1000px #dbd9d9;
            min-height: 500px
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

        .message-box {
            display: flex;
            overflow: hidden;
            color: black;
            border-bottom: 1px solid #ccc
        }

            .message-box > div:first-child {
                width: 90px;
                height: 80px;
                margin: 5px;
                border-radius: 8px;
                overflow: hidden;
            }

                .message-box > div:first-child > img {
                    width: 100%;
                }

            .message-box > div:nth-child(2) {
                width: 100%;
            }

                .message-box > div:nth-child(2) > h4 {
                    width: 99%;
                    padding: 0px 10px;
                    margin: 0px;
                    margin-top: 12px;
                    margin-bottom: 5px
                }

                .message-box > div:nth-child(2) > .message,
                .message-box > div:nth-child(2) > .msgTime {
                    padding: 0px 10px;
                    margin: 0px
                }

                .message-box > div:nth-child(2) > .message {
                    color: #4f4f4f
                }

                .message-box > div:nth-child(2) > .msgTime {
                    text-align: right;
                    margin-top: 11px;
                    margin-right: 8px;
                    color: #ccc
                }

        a:hover {
            text-decoration: none;
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
                        <li><a href="ReservationInfo.aspx">预约信息</a></li>
                        <li class="active"><a href="Consults.aspx"><span class="badge pull-right" id="Unread" runat="server">0</span> 问诊信息</a></li>
                    </ul>
                </div>
                <%-- 问诊信息区 --%>
                <div class="col-md-9" style="padding: 0px;">
                    <div style="overflow: auto; height: 500px" id="messageList">
                        <%--<a href='DoctorDetails.aspx?doctorID='>
                            <div class="message-box">
                                <div>
                                    <img src="Assets/Doctor_Imgs/D_001.jpg" />
                                </div>
                                <div>
                                    <h4>杨建荣</h4>
                                    <p class="message">表达祝福空间滤波恐惧不能靠近少女空间的看法包括道具卡军事对抗肌肤你不看是空军空军······</p>
                                    <p class="msgTime">2022-03-16</p>
                                </div>
                            </div>
                        </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            // 获取未读消息列表
            setInterval(function () {
                $.ajax({
                    url: "UserGetMessageListService.ashx",
                    data: "userID=" + <%= Session["userID"].ToString() %>,
                    type: "get",
                    async: true,  // 异步
                    dataType: "JSON",
                    success: function (data) {
                        let htmlStr = "";
                        data.forEach((data) => {
                            let imgPath = data.DoctorImg;
                            imgPath = imgPath.slice(1);
                            let messageTime = data.MessageTime;
                            messageTime = messageTime.replace(/[^0-9]/ig, "");
                            htmlStr += "<a href='DoctorDetails.aspx?doctorID=" + data.DoctorID + "'><div class='message-box'><div><img src='" + imgPath + "' /></div><div><h4>" + data.DoctorRealName + "</h4><p class='message'>" + data.Message + "</p><p class='msgTime'>" + getLocalTime(messageTime) + "</p></div></div></a>";
                        });
                        $("#messageList").html(htmlStr);
                        htmlStr.html = null;
                    },
                    error: function () {
                        alert("ERROR:请求回调错误");
                    }
                });
            }, 1000);
        });

        // 时间格式化
        function getLocalTime(timeStamp) {
            return new Date(parseInt(timeStamp) * 1).toLocaleString().replace(/:\d{1,2}$/, ' ');
        }
    </script>
</asp:Content>
