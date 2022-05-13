<%@ Page Title="回复" Language="C#" MasterPageFile="~/MasterSite2.Master" AutoEventWireup="true" CodeBehind="ReplyUser.aspx.cs" Inherits="HRRS.ReplyUser" %>

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
            margin-top: 40px;
            border-radius: 20px;
        }

        #Message {
            height: 600px;
            border: 1px solid #ccc;
            border-radius: 20px;
            overflow: hidden;
            margin-top: 15px;
            margin-bottom: 15px;
            background-color: #f4f4f4;
            position: relative;
        }

        #name {
            background-color: white;
            margin: 0px;
            padding: 2px;
            display: flex;
            border-bottom: 1px solid #ccc;
        }

            #name > i > a > svg {
                margin-top: 6px;
                margin-bottom: 3px;
                margin-left: 10px
            }

            #name > h3 {
                text-align: center;
                margin-top: 7px;
                margin-bottom: 0px;
                margin-left: 43.5%
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
                margin: 10px 0px
            }

            #form-send > .btn {
                width: 15%;
                margin: 10px 0px;
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
    <div class="row">
        <div class="col-md-10 col-md-offset-1 messageList-box">
            <div id="Message">
                <div id="name">
                    <i>
                        <a href="ReplyList.aspx">
                            <svg t="1648537167074" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4804" width="28" height="28">
                                <path d="M624.788992 204.047974 585.205965 164.464026 219.560038 530.185011 585.205965 895.864013 624.788992 856.280986 298.663014 530.16105Z" p-id="4805"></path>
                            </svg>
                        </a>
                    </i>&nbsp;
                    <h3>测试</h3>
                </div>
                <div id="messageItem-box" style="overflow: auto; height: 495px">
                    <%--<div class="messageItem userMsg">
                        <p class="messageTime"><span>2022-03-22 23:39</span></p>
                        <div class="userImg">
                            <img src="Assets/Doctor_Imgs/D_001.jpg" />
                        </div>
                        <div class="msg">
                            <p>大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计大厦就会返回</p>
                        </div>
                    </div>
                    <div class="messageItem doctorMsg">
                        <p class="messageTime"><span>2022-03-22 23:39</span></p>
                        <div class="userImg">
                            <img src="Assets/User_Imgs/U_001.jpg" />
                        </div>
                        <div class="msg">
                            <p>大厦就会返回给对方机会给对方恨不得计划2东方科技环保v的付款计大厦就会返回</p>
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
    <script>
        let base64;
        var div = document.getElementById("messageItem-box");
        $(function () {
            setInterval(function () {
                $.ajax({
                    url: "MessageService.ashx",
                    type: "get",
                    data: 'doctorID=' + <%= Session["doctorID"].ToString() %> + '&userID=' + <%= Request["userID"].ToString() %>,
                    async: true,  // 异步
                    dataType: "JSON",
                    success: function (data) {
                        let htmlStr = "";
                        data.forEach((data) => {
                            if (data.UserType == "0") {
                                let messageTime = data.MessageTime;
                                messageTime = messageTime.replace(/[^0-9]/ig, "");
                                let imgPath = data.DoctorImgPath;
                                imgPath = imgPath.slice(1);
                                htmlStr += "<div class='messageItem userMsg'><p class='messageTime'><span>" + getLocalTime(messageTime) + "</span></p><div class='userImg'><img src='" + imgPath + "' /></div><div class='msg'><p>" + data.MessageInfo + "<img src='" + data.MeaasgeImg.slice(1) + "' /></p></div></div>";
                            } else if (data.UserType == "1") {
                                let messageTime = data.MessageTime;
                                messageTime = messageTime.replace(/[^0-9]/ig, "");
                                let imgPath = data.UserImgPath;
                                imgPath = imgPath.slice(1);
                                htmlStr += "<div class='messageItem doctorMsg'><p class='messageTime'><span>" + getLocalTime(messageTime) + "</span></p><div class='userImg'><img src='" + imgPath + "' /></div><div class='msg'><p>" + data.MessageInfo + "<img src='" + data.MeaasgeImg.slice(1) + "' /></p></div></div>";
                            }
                        });
                        $("#messageItem-box").html(htmlStr);
                        htmlStr.html = "";
                    },
                    error: function () {
                        alert("ERROR:请求回调错误");
                    }
                });
            }, 500);
            div.scrollTop = div.scrollHeight;

            $("#sendBtn").click(function () {
                let msg = $.trim($("#msgInput").val());
                if (msg != "") {
                    let imgStr = msg.split("：");
                    if (imgStr[0] != "已选择图片") {
                        $.ajax({
                            url: "DoctorSendMessageService.ashx",
                            data: 'doctorID=' + <%= Session["doctorID"].ToString() %> + '&userID=' + <%= Request["userID"].ToString() %>  + '&msg=' + msg,
                            type: "post",
                            async: true,  // 异步
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
                            url: "DoctorSendImgService.ashx",
                            type: "post",
                            data: "base64=" + base64 + "&doctorID=" + <%= Session["doctorID"].ToString() %> + "&userID=" + <%= Request["userID"].ToString() %>,
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
                    console.log(file);
                };
            })(e.target.files[0]);
            reader.readAsDataURL(e.target.files[0]);
        }

        function getLocalTime(timeStamp) {
            return new Date(parseInt(timeStamp) * 1).toLocaleString().replace(/:\d{1,2}$/, ' ');
        }
    </script>
</asp:Content>
