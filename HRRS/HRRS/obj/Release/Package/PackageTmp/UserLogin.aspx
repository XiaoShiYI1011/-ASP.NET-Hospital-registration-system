<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="HRRS.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>患者登录</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script src="Script/jQuery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="Script/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <style>
        #login-box {
            border-radius: 25px;
            box-shadow: 0 0 25px #ccc;
            background-color: rgb(255 255 255 / 1.00);
            overflow: hidden;
        }

        .col-md-4,
        .col-md-8 {
            min-height: 420px
        }

        .form-control,
        .btn-login,
        .btn-register,
        .btn-change {
            width: 85%
        }

        .col-md-offset-3 {
            margin-top: 8%;
        }

        #login-box-left {
            overflow: hidden;
            box-shadow: 0px 10px 1000px #dbd9d9;
        }

            #login-box-left > h3 {
                text-align: center;
                color: #7e7d7d;
                line-height: 175px;
            }

            #login-box-left > img {
                width: 100%;
            }

        form {
            padding: 10px
        }

        .btn-change {
            width: 92.5%;
        }

        label {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <%-- 请求方式：POST --%>
    <form class="form-horizontal" role="form" method="post" id="form1" runat="server">
        <div class="container-fluid" id="root">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-box">
                                <div id="login-box-left" class="col-md-4">
                                    <h3>医者仁心挂号系统</h3>
                                    <img src="Assets/男医生.png" class="img" />
                                </div>
                                <div id="login-box-right" class="col-md-8">
                                    <h3 style="text-align: center">欢迎使用本系统</h3>
                                    <div class="form-group">
                                        <label for="userName" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号</label>
                                        <div class="col-sm-10">
                                            <%-- 账号输入框，ID：userName ，name：userName --%>
                                            <asp:TextBox ID="userName" name="userName" runat="server" class="form-control" placeholder="UserName"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="passWord" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                                        <div class="col-sm-10">
                                            <%-- 密码输入框，ID：passWord ，name：passWord --%>
                                            <asp:TextBox ID="passWord" name="passWord" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <%-- 自动登录复选框，ID：autoLogin --%>
                                                    <asp:CheckBox ID="autoLogin" runat="server" />自动登录
                                                </label>
                                                <a href="javascript:void(0)" style="margin-left: 47%" id="Forget-Password-Btn">忘记密码</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <%-- 登录按钮 --%>
                                            <asp:Button ID="btn_login" runat="server" Text="登录" class="btn btn-primary btn-login" OnClick="btn_login_Click" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <%-- 注册按钮 --%>
                                            <a href="UserRegister.aspx" class="btn btn-info btn-register">注册</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="btn-group btn-change">
                                                <button type="button" class="btn btn-default btn-change dropdown-toggle" data-toggle="dropdown">
                                                    切换身份 <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu" style="width: 92%; text-align: center">
                                                    <li><a href="DoctorLogin.aspx">医生登录</a></li>
                                                </ul>
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
        <%-- 弹出框 --%>
        <div class="modal fade" id="Forget-Password-Modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                        <h3 class="modal-title">修改密码</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="UpDateUserName" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDateUserName" name="UpDateUserName" runat="server" class="form-control" placeholder="UpDateUserName"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="UpDateUserName" runat="server" ErrorMessage="请输入账号" ForeColor="red"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="iDCard" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="iDCard" name="iDCard" runat="server" class="form-control" placeholder="iDCard"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="iDCard" runat="server" ErrorMessage="请输入身份证号" ForeColor="red"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="UpDatePassWord" class="col-sm-2 control-label">&nbsp;新&nbsp;密&nbsp;码</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="UpDatePassWord" name="UpDatePassWord" runat="server" class="form-control" TextMode="Password" placeholder="UpDatePassWord"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confUpDatePassWord" class="col-sm-2 control-label">确认新密码</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="confUpDatePassWord" name="confUpDatePassWord" runat="server" class="form-control" TextMode="Password" placeholder="confUpDatePassWord"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" ForeColor="red" ControlToCompare="UpDatePassWord" ControlToValidate="confUpDatePassWord"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="btn_qx_Click" >取消</button>
                        <asp:Button ID="Btn_know" runat="server" Text="确定修改" class="btn btn-primary" OnClick="btn_know_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(function () {
            $("#Forget-Password-Btn").click(function () {
                $("#Forget-Password-Modal").modal("show");
            });
        });
    </script>
    <script>
        window.onload = function () {
            //定义body的margin由默认值8px->0px
            document.body.style.margin = "0";
            document.body.style.background = "#fff";
            //创建canvas画布
            document.body.appendChild(document.createElement('canvas'));
            var canvas = document.querySelector('canvas'),
                ctx = canvas.getContext('2d') //ctx返回一个在canvas上画图的api/dom
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            canvas.style.position = 'fixed';
            canvas.style.top = "0";
            canvas.style.zIndex = "-99999999999999999999999999999999999999999999999";
            ctx.lineWidth = .3;
            ctx.strokeStyle = (new Color(150)).style;
            //定义鼠标覆盖范围
            var mousePosition = {
                x: 30 * canvas.width / 100,
                y: 30 * canvas.height / 100
            };
            var dots = {
                nb: 1000,//Dot的总数
                distance: 50,
                d_radius: 100,
                array: []
            };
            //创建颜色类，Color类返回字符串型rgba（*,*,*,.8）
            function mixComponents(comp1, weight1, comp2, weight2) {
                return (comp1 * weight1 + comp2 * weight2) / (weight1 + weight2);
            }
            function averageColorStyles(dot1, dot2) {
                var color1 = dot1.color,
                    color2 = dot2.color;

                var r = mixComponents(color1.r, dot1.radius, color2.r, dot2.radius),
                    g = mixComponents(color1.g, dot1.radius, color2.g, dot2.radius),
                    b = mixComponents(color1.b, dot1.radius, color2.b, dot2.radius);
                return createColorStyle(Math.floor(r), Math.floor(g), Math.floor(b));
            }
            function colorValue(min) {
                return Math.floor(Math.random() * 255 + min);
            }
            function createColorStyle(r, g, b) {
                return 'rgba(' + r + ',' + g + ',' + b + ', 0.8)';
            }
            function Color(min) {
                min = min || 0;
                this.r = colorValue(min);
                this.g = colorValue(min);
                this.b = colorValue(min);
                this.style = createColorStyle(this.r, this.g, this.b);
            }
            //创建Dot类以及一系列方法
            function Dot() {
                this.x = Math.random() * canvas.width;
                this.y = Math.random() * canvas.height;

                this.vx = -.5 + Math.random();
                this.vy = -.5 + Math.random();

                this.radius = Math.random() * 2;

                this.color = new Color();
            }

            Dot.prototype = {
                draw: function () {
                    ctx.beginPath();
                    ctx.fillStyle = this.color.style;
                    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
                    ctx.fill();
                }
            };
            function moveDots() {//Dot对象的移动
                for (i = 0; i < dots.nb; i++) {

                    var dot = dots.array[i];

                    if (dot.y < 0 || dot.y > canvas.height) {
                        dot.vx = dot.vx;
                        dot.vy = - dot.vy;
                    }
                    else if (dot.x < 0 || dot.x > canvas.width) {
                        dot.vx = - dot.vx;
                        dot.vy = dot.vy;
                    }
                    dot.x += dot.vx;
                    dot.y += dot.vy;
                }
            }
            function connectDots() {//DOt对象的连接
                for (i = 0; i < dots.nb; i++) {
                    for (j = i; j < dots.nb; j++) {
                        i_dot = dots.array[i];
                        j_dot = dots.array[j];

                        if ((i_dot.x - j_dot.x) < dots.distance && (i_dot.y - j_dot.y) < dots.distance && (i_dot.x - j_dot.x) > - dots.distance && (i_dot.y - j_dot.y) > - dots.distance) {
                            if ((i_dot.x - mousePosition.x) < dots.d_radius && (i_dot.y - mousePosition.y) < dots.d_radius && (i_dot.x - mousePosition.x) > - dots.d_radius && (i_dot.y - mousePosition.y) > - dots.d_radius) {
                                ctx.beginPath();
                                ctx.strokeStyle = averageColorStyles(i_dot, j_dot);
                                ctx.moveTo(i_dot.x, i_dot.y);
                                ctx.lineTo(j_dot.x, j_dot.y);
                                ctx.stroke();//绘制定义的路线
                                ctx.closePath();//创建从当前点回到起始点的路径
                            }
                        }
                    }
                }
            }
            function createDots() {//创建nb个Dot对象
                for (i = 0; i < dots.nb; i++) {
                    dots.array.push(new Dot());
                }
            }
            function drawDots() {//引用Dot原型链，使用draw方法，在canvas上画出Dot对象
                for (i = 0; i < dots.nb; i++) {
                    var dot = dots.array[i];
                    dot.draw();
                }
            }
            function animateDots() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);//清除画布，否则线条会连在一起
                moveDots();
                connectDots();
                drawDots();
                requestAnimationFrame(animateDots);
            }
            createDots();//使用创建Dot类函数
            requestAnimationFrame(animateDots);//使用canvas独有的60Hz刷新屏幕画布的方法

            document.querySelector('canvas').addEventListener('mousemove', function (e) {
                mousePosition.x = e.pageX;
                mousePosition.y = e.pageY;
            })

            document.querySelector('canvas').addEventListener('mouseleave', function (e) {//鼠标离开时，连接自动返回到画布中心
                mousePosition.x = canvas.width / 2;
                mousePosition.y = canvas.height / 2;
            })

        }
    </script>
</body>
</html>
