## 医院挂号系统

#### 介绍

1. 使用三层架构和DBHelp类，进行数据处理和数据持久化，采用 Bootstrap 响应式框架搭建页面
2. 该项目主要模拟各大医院和患者，网站分为用户端和医生端，医生可以处理预约患者和患者问诊消息，用户可以预约挂号、在线咨询
3. 源码和发布的代码都有，服务器到期，无法在线演示
4. 练手项目，代码还有优化的空间，三层均有注释

#### 测试账号

1. 账号
	- test
2. 密码
	- 000（注册新账号时请勿使用常用密码，密码没有进行加密）

#### 软件架构

1. 软件架构说明
	- B/S

#### 开发环境

1. VS 2019、SQL Server 2019

#### 开发技术

1. ASP.NET、Bootstrap、AJAX、HTML5、CSS3

#### 安装教程

1.  先找到 DAL 层中的 SQL 目录，里面有 sql 脚本，全选执行（部分数据来自网络，无恶意）
2.  在 DAL 层中改 DBHelper 类中的连接字符串
3.  然后运行

#### 备注

1.  在线咨询模块，其实使用 SignalR 技术比较好，但我使用的是 Ajax 实时获取数据，会比较浪费服务器资源
2.  图片发送也使用 Ajax 技术发送，先在前台转成 base64 字符串，再发送到一般处理程序，进行存储