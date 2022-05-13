<%@ Page Title="消息列表" Language="C#" MasterPageFile="~/MasterSite2.Master" AutoEventWireup="true" CodeBehind="ReplyList.aspx.cs" Inherits="HRRS.ReplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav > li:nth-child(3) > a {
            color: #fff;
            background-color: #337ab7;
        }

            .nav > li:nth-child(3) > a > span {
                background-color: white;
                color: #337ab7;
            }

        .nav > li > a {
            color: #337ab7;
            background-color: transparent;
        }

        .messageList-box {
            box-shadow: 0 0 20px #ccc;
            margin-top: 50px;
            border-radius: 20px;
        }

            .messageList-box > h4 {
                padding-bottom: 5px;
                text-align: center;
                letter-spacing: 10px;
                margin-bottom: 0px
            }

        #MessageList {
            height: 600px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 15px;
            overflow: auto;
            background-color: #f7f7f7;
        }

        a:hover {
            text-decoration: none;
        }

        .message-box {
            display: flex;
            overflow: hidden;
            color: black;
            border-bottom: 1px solid #ccc;
            background-color: white;
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
                    color: #6e6d6d;
                }

                .message-box > div:nth-child(2) > .msgTime {
                    text-align: right;
                    margin-top: 11px;
                    margin-right: 8px;
                    color: #ccc
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 messageList-box">
            <h4>消息列表</h4>
            <div id="MessageList">
                <%--<a href="#">
                    <div class="message-box">
                        <div>
                            <img src="Assets/Doctor_Imgs/D_001.jpg" />
                        </div>
                        <div>
                            <h4>杨建荣</h4>
                            <p class="message">干哈将大幅哈哈解决户口方法的皇家海军的</p>
                            <p class="msgTime">2022-03-16</p>
                        </div>
                    </div>
                </a>--%>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            // 获取未读消息列表
            setInterval(function () {
                $.ajax({
                    url: "GetMessageListService.ashx",
                    data: "doctorID=" + <%= Session["doctorID"].ToString() %>,
                    type: "get",
                    async: true,  // 异步
                    dataType: "JSON",
                    success: function (data) {
                        let htmlStr = "";
                        data.forEach((data) => {
                            let imgPath = data.UserImgPath;
                            imgPath = imgPath.slice(1);
                            let messageTime = data.MessageTime;
                            messageTime = messageTime.replace(/[^0-9]/ig, "");
                            htmlStr += "<a href='ReplyUser.aspx?userID=" + data.UserID + "'><div class='message-box'><div><img src='" + imgPath + "' /></div><div><h4>" + data.UserName + "</h4><p class='message'>" + data.Message + "</p><p class='msgTime'>" + getLocalTime(messageTime) + "</p></div></div ></a >";
                            document.getElementById("Unread").innerHTML = data.Count;
                        });
                        $("#MessageList").html(htmlStr);
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
