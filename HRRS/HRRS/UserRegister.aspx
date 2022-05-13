<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="HRRS.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>患者注册</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script src="Script/jQuery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="Script/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <style>
        #login-box {
            border-radius: 25px;
            box-shadow: 0 0 25px #ccc;
            background-color: rgb(255 255 255 / 0.90);
            overflow: hidden;
        }

        .form-control,
        .btn-login,
        .btn-register,
        .btn-change {
            width: 85%
        }

        .col-md-offset-2 {
            margin-top: 1.8%;
        }

        #login-box-left {
            overflow: hidden;
            box-shadow: 0px 10px 1000px #dbd9d9;
        }

            #login-box-left > h3 {
                text-align: center;
                color: #7e7d7d;
                line-height: 335px;
            }

            #login-box-left > img {
                width: 100%;
            }

        form {
            padding: 10px
        }

        .btn-change {
            width: 92.5%
        }

        label {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <div class="container-fluid" id="root">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div id="login-box">
                            <div id="login-box-left" class="col-md-4">
                                <h3>医者仁心挂号系统</h3>
                                <img src="Assets/女医生.png" class="img" />
                            </div>
                            <div id="login-box-right" class="col-md-8">
                                <h3 style="text-align: center">欢迎使用本系统</h3>
                                <%-- 请求方式：POST --%>
                                <form class="form-horizontal" role="form" id="form1" method="post" runat="server">
                                    <div class="form-group">
                                        <label for="userName" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号</label>
                                        <div class="col-sm-10">
                                            <%-- 账号输入框，ID：userName --%>
                                            <asp:TextBox ID="userName" name="userName" runat="server" class="form-control" placeholder="UserName"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="userName" runat="server" ErrorMessage="请输入账号" ForeColor="red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="passWord" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                                        <div class="col-sm-10">
                                            <%-- 密码输入框，ID：passWord --%>
                                            <asp:TextBox ID="passWord" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="confPassWord" class="col-sm-2 control-label">确认密码</label>
                                        <div class="col-sm-10">
                                            <%-- 确认密码输入框，ID：confPassWord --%>
                                            <asp:TextBox ID="confPassWord" name="confPassWord" runat="server" TextMode="Password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" ForeColor="red" ControlToCompare="passWord" ControlToValidate="confPassWord"></asp:CompareValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="realName" class="col-sm-2 control-label">真实姓名</label>
                                        <div class="col-sm-10">
                                            <%-- 真实名字，ID：realName --%>
                                            <asp:TextBox ID="realName" name="realName" runat="server" class="form-control" placeholder="Real Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="iDCard" class="col-sm-2 control-label">身份证号</label>
                                        <div class="col-sm-10">
                                            <%-- 身份证号，ID：iDCard --%>
                                            <asp:TextBox ID="iDCard" name="iDCard" runat="server" class="form-control" placeholder="ID Number"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="身份证格式错误" ForeColor="red" ControlToValidate="iDCard" ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <label class="control-label">性&nbsp;&nbsp;&nbsp;别</label>
                                            <div class="checkbox" style="display: inline">
                                                <%-- 性别单选框，name：sex --%>
                                                <label>
                                                    <asp:RadioButton ID="RadioButton1" GroupName="sex" runat="server" Text="男" />
                                                </label>
                                                <label>
                                                    <asp:RadioButton ID="RadioButton2" GroupName="sex" runat="server" Text="女" />
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="iDCard" class="col-sm-2 control-label">手机号</label>
                                        <div class="col-sm-10">
                                            <%-- 手机号，ID：userPhone --%>
                                            <asp:TextBox ID="userPhone" name="userPhone" runat="server" class="form-control" placeholder="Cell-phone Number"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="手机号格式错误" ForeColor="red" ControlToValidate="userPhone" ValidationExpression="^1([3578][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:Button ID="Register_Btn" runat="server" Text="注册" CssClass="btn btn-primary btn-login" OnClick="Register_Btn_Click" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
