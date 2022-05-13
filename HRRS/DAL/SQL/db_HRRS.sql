--CREATE DATABASE db_HRRS 
--ON PRIMARY ( 
--	NAME = 'db_HRRS', 
--	filename = 'D:\卓越项目\大二卓越项目\HRRS\HRRS\DAL\SQL\db_HRRS.mdf',  -- 路径记得换
--	size = 5MB, 
--	maxsize = 10MB, 
--	filegrowth = 10% 
--) 
--LOG ON ( 
--	NAME = 'db_HRRS_log', 
--	filename = 'D:\卓越项目\大二卓越项目\HRRS\HRRS\DAL\SQL\db_HRRS_log.ldf',  -- 路径记得换
--	size = 5MB, 
--	maxsize = 10MB, 
--	filegrowth = 10% 
--)
--GO

CREATE DATABASE db_HRRS 
GO

USE db_HRRS 
GO

-- 如果表存在，则删除
IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_onlineInquiry')
DROP TABLE t_onlineInquiry
GO

IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_appointment')
DROP TABLE t_appointment
GO

IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_doctorInfo')
DROP  TABLE t_doctorInfo
GO

IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_hospitalinfo')
DROP TABLE t_hospitalinfo
GO

IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_dept')
DROP TABLE t_dept
GO

IF EXISTS(SELECT 1 FROM Sysobjects WHERE NAME='t_userInfo')
DROP TABLE t_userInfo
GO

-- 用户信息表
CREATE TABLE t_userInfo(
	userID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 用户ID
	UserName VARCHAR ( 30 ) UNIQUE NOT NULL,  -- 用户账户
	UserPwd VARCHAR ( 255 ) NOT NULL,  -- 用户密码
	RealName VARCHAR ( 12 ),  -- 用户真实名字
	UserSex VARCHAR ( 2 ) CHECK ( UserSex = '男' OR UserSex = '女' ),  --用户性别 
	IDCard VARCHAR ( 36 ),  -- 用户身份证号
	UserPhone FLOAT UNIQUE,  -- 用户手机号
	UserImg VARCHAR(200) DEFAULT('~/Assets/头像.svg'),  -- 用户头像路径
)
		
-- 医院科室表
CREATE TABLE t_dept( 
	deptID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 科室ID
	Department VARCHAR ( 30 ) UNIQUE NOT NULL,  -- 医院科室
) 
	
-- 医院信息表
CREATE TABLE t_hospitalinfo(
	hospitalID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 医院ID
	HospitaName VARCHAR ( 50 ) NOT NULL,  -- 医院名字
	HospitaDescribe NVARCHAR ( MAX ),  -- 医院简介
	Grade VARCHAR ( 20 ),  -- 医院等级
	HospitaRegion VARCHAR( 50 ),  -- 医院地区
	HospitalAddress VARCHAR ( 100 ),  -- 医院地址	
	HospitalImg VARCHAR(255),  -- 医院图片路径
) 
	
-- 医生信息表
CREATE TABLE t_doctorInfo(
	doctorID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 医生ID
	DoctorName VARCHAR ( 30 ) UNIQUE NOT NULL,  -- 医生账户
	DoctorPwd VARCHAR ( 255 ) NOT NULL,  -- 医生密码
	DoctorRealName VARCHAR ( 12 ),  -- 医生真实名字
	DoctorSex VARCHAR ( 2 ) CHECK ( DoctorSex = '男' OR DoctorSex = '女' ),  -- 医生性别
	DoctorDescribe NVARCHAR ( MAX ),  -- 医生简介
	DoctorImg VARCHAR( 255 ),  -- 医生头像路径
	hospitalID INT FOREIGN KEY ( hospitalID ) REFERENCES t_hospitalinfo ( hospitalID ),  -- 医生所属医院ID（外键）
	deptID INT FOREIGN KEY ( deptID ) REFERENCES t_dept ( deptID ),  -- 医生所属科室表ID（外键）
	DoctorPosition VARCHAR ( 20 ),  -- 医生职位
	WorkDay VARCHAR ( 200 ),  -- 排班日期
)
	
-- 预约就诊表
CREATE TABLE t_appointment(
	appointmentID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 预约ID
	userID INT FOREIGN KEY ( userID ) REFERENCES t_userInfo ( userID ),  -- 预约的患者ID（外键）
	hospitalID INT FOREIGN KEY ( hospitalID ) REFERENCES t_hospitalinfo ( hospitalID ),  -- 预约的医院ID（外键）
	deptID INT FOREIGN KEY ( deptID ) REFERENCES t_dept ( deptID ),  -- 预约的科室ID（外键）
	doctorID INT FOREIGN KEY ( doctorID ) REFERENCES t_doctorInfo ( doctorID ),  -- 预约的医生ID（外键）
	AppointmentTime VARCHAR ( 255 ) NOT NULL,  -- 预约时间
)

-- 在线问诊表
CREATE TABLE t_onlineInquiry(
	inquiryID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- 问诊ID
	userID INT FOREIGN KEY ( userID ) REFERENCES t_userInfo ( userID ),  -- 预约的患者ID（外键） 
	doctorID INT FOREIGN KEY ( doctorID ) REFERENCES t_doctorInfo ( doctorID ),  -- 预约的医生ID（外键）
	[Message] nvarchar( MAX ) DEFAULT( NULL ),  -- 消息
	MessageTime DATETIME DEFAULT( GETDATE() ),  -- 消息时间
	MessageImg VARCHAR( 255 ) DEFAULT( NULL ),  -- 消息图片
	UserType INT NOT NULL,  -- 用户类型（1 为用户，0 为医生）
	UserRead INT DEFAULT( 0 ),  -- 用户是否已读消息（1 为已读， 0 为未读）
	DoctorRead INT DEFAULT( 0 ),  -- 医生是否已读消息（1 为已读， 0 为未读）
)

SET IDENTITY_INSERT [dbo].[t_userInfo] ON 
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (1, N'test', N'000', N'测试', N'男', N'452131200110110000', 17377009991, N'~/Assets/User_Imgs/3eb3616dd0973ad7.jpg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (2, N'xsy', N'xsy', N'十一', N'男', N'452131200110110000', 17377008888, N'~/Assets/User_Imgs/U_001.jpg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (3, N'yhy', N'yhy', N'叶厚元', N'男', N'452131200110110886', 13877198140, N'~/Assets/头像.svg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (4, N'asd', N'asd', N'张三', N'男', N'452131200110110886', 18672908647, N'~/Assets/User_Imgs/201612230416198566.JPG')
GO
SET IDENTITY_INSERT [dbo].[t_userInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_dept] ON 
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (41, N'病理科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (20, N'产科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (21, N'超声科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (22, N'创伤外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (23, N'儿科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (24, N'放射科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (18, N'妇科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (2, N'肝胆外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (25, N'肝胆胰外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (43, N'感染内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (13, N'骨科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (26, N'关节外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (44, N'过敏反映科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (6, N'呼吸内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (9, N'急诊科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (27, N'脊柱外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (28, N'检验科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (29, N'精神科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (30, N'康复科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (31, N'口腔科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (32, N'麻醉科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (12, N'泌尿外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (7, N'内分泌代谢科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (33, N'皮肤科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (42, N'普通内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (16, N'普外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (34, N'烧伤整形外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (5, N'神经内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (15, N'神经外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (4, N'肾内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (17, N'疼痛科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (35, N'胃肠外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (11, N'胃肠外周血管外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (3, N'消化内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (36, N'心胸外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (1, N'心血管内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (14, N'心血管外科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (8, N'血液内科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (37, N'眼科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (38, N'中医骨伤科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (39, N'中医科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (40, N'肿瘤科')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (10, N'重症医学科')
GO
SET IDENTITY_INSERT [dbo].[t_dept] OFF
GO
SET IDENTITY_INSERT [dbo].[t_hospitalinfo] ON 
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (1, N'广西医科大学第一附属医院', N'坐落在青山脚下、邕江河畔、南湖之滨的广西医科大学第一附属医院创建于1934年，是广西首家三级甲等综合医院、全国百佳医院、全国百姓放心示范医院、全国爱婴医院、全国综合医院中医药工作示范单位；是广西医疗、医学教育、医学研究及医疗保健的中心。医院现有东、西两个院区，有临床科室46个，病区91个，医技科室17个，开放床位3491张。年门诊量330万余人次，住院病人10万余人次，年手术5万余台次。医院现有职工5631人。其中，具有正高职称322人、副高职称440人。享受国务院特殊津贴专家32人，广西突出贡献科技人员10人，广西优秀专家13人，广西“十百千人才工程”第二层次人选8人，第一批广西医学高层次骨干人才培养“139”计划培养人选10人，中华医学会全国委员45人，广西医学会各专业委员会主任委员48人、副主任委员50人。200多人留学美国、英国、日本等30多个国家。医院坚持“医疗质量是医院工作的核心，优质高效是医院发展的生命”的原则，加强医院内涵建设，提高医院诊疗技术水平，很多诊疗项目填补了广西乃至全国的空白，绝大部分临床医疗、医技专科技术水平处于广西领先、国内先进地位。', N'三级甲等', N'广西', N'广西南宁市双拥路', N'~/Assets/Hospital_Imgs/H_001.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (2, N'复旦大学附属中山医院', N'复旦大学附属中山医院是国家卫生和计划生育委员会预算管理单位，是复旦大学的附属综合性教学医院。医院开业于1937年，是当时中国人管理的第一所大型综合性医院，隶属于国立上海医学院，为纪念中国民主革命的先驱孙中山先生而命名为孙中山纪念医院，后更名为中山医院。解放后曾称上海第一医学院附属中山医院和上海医科大学附属中山医院，2001年用现名。1991年12月经卫生部批准，成为上海市第一批三级甲等医院。经过76年的发展，中山医院本部目前占地面积95892.1㎡，总建筑面积356206.5㎡，核定床位1700张。2013年门急诊就诊量311万人次，出院病人8.4万人次，住院手术病人5.5万人次。全院职工3433人，有中国科学院院士1人，中国工程院院士2人，高级职称437人，医师1219人（含住院医师规范化培训基地355人），护士1340人，医技人员401人。', N'三级', N'上海', N'上海市枫林路180号/斜土路1609号 ', N'~/Assets/Hospital_Imgs/H_002.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (3, N'北京协和医院', N'北京协和医院是综合实力非常出众的三级甲等医院，在百姓心目中可谓是中国医院第一家。北京协和医院与原北京邮电医院合并后分为东西二院：北京协和医院东院、北京协和医院西院。目前开放住院床位2000余张，最高单日门诊量突破15000人次，年出院病人8万人次，住院手术3.2万例，平均住院日9.5天以下，年接诊外宾6万人次。共有临床、医技科室54个，国家级重点学科20个、北京市重点学科5个，在职正式职工4000余人，两院院士6人、正副教授682人，中华医学会、北京医学会及其它学会前任主委、现任主任、副主任委员及侯任主任60名，中文核心杂志正副总编及名誉主编60余人', N'三级甲等', N'北京', N'北京市东城区帅府园1号', N'~/Assets/Hospital_Imgs/H_003.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (4, N'中国人民解放军中部战区总医院', N'中国人民解放军中部战区总医院是一所具有光荣历史和革命传统的医院。1946年6月，诞生于黑龙江省勃利县，其前身为东北民主联军第八后方医院。医院曾7次迁址，13次易名，10次改变隶属关系。2016年9月5日，转隶郑州联勤保障中心。医院始终坚持姓军为兵方向，坚持科学发展道路，以对党、祖国、人民和使命的忠诚之心凝聚大爱，用对诊疗、服务、科研和管理的精诚之作成就大医，创造了武总的辉煌。目前，医院已发展成为一所集医疗、教学、科研、预防、保健、急救为一体的大型综合性军队医院，是全国三级甲等医院、全国百佳医院、爱婴医院、全军数字化医院建设示范单位、全军先进医院、全国抗震救灾英雄集体、全军后勤训练先进单位。是湖北省（武汉市）城镇职工（居民）基本医疗保险定点医院、湖北省（武汉市）新型农村合作医疗定点医院、湖北省省直（武汉市市直）公费医疗定点医院、湖北省价格诚信医院、湖北省最佳文明单位', N'三级甲等', N'湖北', N'武汉市武昌区武珞路627号', N'~/Assets/Hospital_Imgs/H_004.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (5, N'广西壮族自治区人民医院', N'广西壮族自治区人民医院位于广西壮族自治区南宁市青秀区桃源路6号，始建于1941年，设有两个门诊部、一个分院，建筑面积22.45万平方米，占地面积64585.96平方米，是一所集医疗、科研、教学和预防保健为一体的三级综合医院。医院设有心血管内科、消化内科、肾内科、神经内科、呼吸内科、内分泌代谢科、血液内科，重症医学科、胃肠外周血管外科、肝胆腺体外科、泌尿外科、骨科、心血管外科、神经外科、普外科、疼痛科、妇科、产科、儿科、眼科、中医科、中医骨伤科、康复科、检验科、放射科、超声科等临床和医技科室。其中消化内科、眼科、中医骨伤科、临床护理为国家临床重点专科，儿科、肾内科、急诊科、重症医学科、神经内科、神经外科为自治区临床重点专科，心脏血管病科和消化内科为自治区重点学科和广西脑卒中中心、眼科、广西微创手术中心、骨科为自治区重点建设学科。医院（含分院）开放病床1881张，配有医用直线加速器、瑞典全数字影像导航放射治疗系统、飞利浦128排多层螺旋CT、西门子3.0T核磁共振、GE和飞利浦血管造影系统等医疗设备。', N'三级', N'广西', N'南宁市青秀区桃源路6号', N'~/Assets/Hospital_Imgs/H_005.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (6, N'南宁市第二人民医院', N'南宁市第二人民医院（广西医科大学第三附属医院、广西医科大学第三临床医学院）位于广西壮族自治区南宁市淡村路13号，始建于1952年，占地面积3万多平方米，建筑面积7万多平方米，是一所集医疗、急救、教学、科研、预防、保健、康复为一体的三级综合医院，是南宁市医保定点医院。医院设有呼吸内科、消化内科、神经内科、肿瘤科、肾内科、内分泌科、心血管内科、中医科、胃肠外科、心胸外科、泌尿外科、肝胆胰外科、神经外科、烧伤整形外科、关节外科、脊柱外科、创伤外科、妇科、康复科、眼科、放射科、心电图诊断科、急诊科等46个医疗专业科室，4个医疗中心（广西南宁生殖医疗中心、广西肢体延长中心、南宁市病案质量控制中心、南宁市药学质量控制中心），3个自治区重点学科（儿科、神经外科、麻醉科），2个研究所（南宁市颅脑创伤研究所、南宁市骨科疾病研究所），3个南宁市重点学科（生殖医疗中心、肿瘤科、骨科），15个临床教研室（组），2个社区卫生服务中心（南宁市江南区福建园街道福建园社区卫生服务中心、南宁市良庆区大沙田街道前进社区卫生服务中心）。另外，还设有五象医院和江南区人民医院（正在建设）。', N'三级', N'广西', N'广西壮族自治区南宁市淡村路13号', N'~/Assets/Hospital_Imgs/H_006.jpg')
GO
SET IDENTITY_INSERT [dbo].[t_hospitalinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_doctorInfo] ON 
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (1, N'zz', N'zz', N'周政', N'男', N'周政，神经内科主任，大专未毕业。临床工作20年，擅长应对各种脑瘫患者，最常见的手法有：装疯卖傻，学患者说话，等等。2002年1月11日出生于湖北仙桃周帮，父亲是当地有名的地头蛇，老来得子，非常器重这位儿子，并给他取名为政，寓意是未来是和皇帝一个级别的人物，非常帅气。', N'~/Assets/Doctor_Imgs/D_000.jpg', 3, 5, N'主任医师', N'星期一上午，')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (2, N'wyx', N'wyx', N'吴隐雄', N'男', N'吴隐雄，中共党员，心血管内科主任医师，医院副院长、心血管内科副主任，在自治区人民医院从事心血管疾病的诊断和治疗近30年，特别是在冠心病、高血压病、风湿性心脏病、心肌病、心律失常诊断与治疗、经皮冠脉成形术与支架置入术、心脏起搏器置入术等方面具有娴熟的技术及丰富的经验。', N'~/Assets/Doctor_Imgs/D_002.jpg', 5, 1, N'主任医师', N'星期五上午，星期四上午，星期一下午，星期三下午，')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (3, N'csq', N'csq', N'
蔡双启
', N'男', N' 
蔡双启
，医学博士 副主任医师 从事呼吸系统疾病诊疗工作10余年，积累了丰富的临床经验。1983年曾在美国约翰霍浦金斯医学院和俄立冈医学科学中心任访问学者 

擅长呼吸内科常见病的诊治。 ', N'~/Assets/Doctor_Imgs/D_003.jpg', 1, 6, N'副主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (4, N'lyh', N'lyh', N'廖蕴华', N'女', N'廖蕴华，主任医师，教授，肾内科主任，肾内科专家，硕士研究生导师，医学硕士，中华医学会肾脏病学分会全国委员，中国医师协会肾脏内科医师分会常务委员，广西医学会肾脏病学分会主任委员。《中华肾脏病杂志》、《广西医学》等杂志编委。先后发表论文100余篇。培养硕士研究生70人，擅长肾病综合征、膜性肾病、IgA肾病、急进性肾炎、痛风肾病、糖尿病肾病、高血压肾病、重症狼疮性肾炎、血管炎。慢性肾脏病妊娠管理 。 ', N'~/Assets/Doctor_Imgs/D_004.jpg', 1, 4, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (5, N'zc', N'zc', N'张驰', N'男', N'张驰， 1982年毕业于中山大学，1987年获得北京化工大学获高分子材料工学硕士，2003年获新西兰奥克兰大学高分子化学理学博士，中华人民共和国科技进步二等奖获得者。专注于“魔芋葡甘露聚糖的结构表征及应用基础研究”项目。2002年-2004年在广州南方医院急诊科，2004年至今在广西医科大学第一附属医院重症医学科 ', N'~/Assets/Doctor_Imgs/D_005.jpg', 1, 10, N'副主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (6, N'fjb', N'fjb', N'樊继波', N'男', N' 樊继波，主治医师（中医骨伤科学），中西医结合临床硕士，资深物理治疗师，曾为三峡大学康复医学与理疗学教师，三峡大学康复医学住培导师。师承广西医科大学第一附属医院陈永斌教授，秉承“活血化瘀”的学术思想。曾在四川大学华西医院康复医学中心进修。中国骨质疏松委员会会员，中华医学会疼痛学分会会员，康复物理医学会委员，中医络病学会委员。UPTA会员认证，美国DMS国际认证，AMS技术创始人。擅长综合应用传统中医药与现代松解术技术处理内科，外科，妇科，儿科，骨伤科及神经科等疾病。 ', N'~/Assets/Doctor_Imgs/D_006.jpg', 1, 39, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (7, N'cg', N'cg', N'陈岗', N'男', N'陈岗， 医院职务  病理科副主任，胸科病理主任
 
学术任职  
 
亚洲肺科学会（Asian Pulmonary Pathology Society,APPS）中国理事
 
国际胸腺肿瘤协会（International Thymic Malignancy Interest GroupITMIG）委员
 
国际肺癌研究协会（International Association for the Study of Lung Cancer,IASLC）会员
 
国际癌症报告合作组织（International Collaboration on Cancer Reporting，ICCR)专家
 
中华预防医学会职业与环境病理学组委员
 
中国医药生物技术协会组织生物样本库分会委员
 
中华医学会病理分会胸科病理组委员
 
中华医学会上海分会第9届病理专科分会委员
 
研究方向  肿瘤病理学
 
教学工作  带教博士、硕士研究生，病理专科医师培训
 
出国深造
 
2000年，德国WuerzburgUniversity, 香港大学
 
2011年，美国Memorial Sloan Kettering Cancer Center
 
所获奖项
 
《恶性淋巴瘤细胞学、组织病理学和分子生物学研究》（第六完成人）
 
1996年度上海市科技进步二等奖
《胸腺瘤良恶性鉴别和预后指标的研究》（第一完成人）
 
2003年度上海市科技进步三等奖
 
首届上海市医学科技奖三等奖', N'~/Assets/Doctor_Imgs/D_007.jpg', 2, 41, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (8, N'tys', N'tys', N'谭云山 ', N'男', N'谭云山 ， 专长：机体各器官非肿瘤性疾病的病理诊断：擅长肺及胸部疾病、消化管道炎症性肠病及肝脏和脾脏疾病；肿瘤性疾病的病理诊断：擅长肝胆肿瘤、消化管道肿瘤、肺及胸部肿瘤、骨及淋巴组织源性肿瘤、骨髓活检组织病理诊断、生殖细胞和色素细胞肿瘤的病理诊断等。
 
医院职务：1990-1至2013-9病理科主任、2010-9至2014-12临床病理住院医师培训基地主任。
 
研究方向：肿瘤病理学', N'~/Assets/Doctor_Imgs/D_008.jpg', 2, 41, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (9, N'dj', N'dj', N'董健', N'男', N'董健，现任复旦大学附属中山医院骨科主任、脊柱外科主任、脊柱肿瘤综合诊治中心主任、复旦大学医学科普研究所所长。董健教授是国家卫计委有突出贡献中青年专家、上海市科技精英、上海领军人才、上海市优秀学科带头人、上海医学发展杰出贡献奖和上海市大众科学奖获得者。从事骨科工作30年，完成脊柱手术八千余例，擅长脊柱肿瘤、脊柱退行性疾病、脊柱结核、脊柱骨折和脊柱侧弯的诊治，长期致力于脊柱肿瘤、脊柱退行性疾病的防治、骨修复重建及骨诱导的临床与基础研究。以第一完成人获得国家科技进步二等奖（2014年）、上海市科技进步一等奖（2011年），上海市科技进步二等奖（2013年）等奖励。还获得国家卫健委颁发的“中国好医生”，中华医学会、中国医师协会等联合颁发的“国之名医”，生命时报“专科精英奖·骨科”等多个荣誉称号。担任中华医学会骨科分会脊柱学组委员、中华医学会结核病学分会骨科专委会副主任委员、中华医学会科普分会副主任委员、中国研究型医院学会脊柱外科专委会副主任委员、中国医师协会骨科医师分会委员、上海医师协会骨科分会副会长、中国中西医结合学会骨伤科专委会副主任委员、上海市中西医结合学会骨伤科专委会主任委员、中国康复医学会骨与关节康复专业委员会副主任委员等学术任职；多本中华系列杂志及10余本SCI杂志编委、通讯编委和审稿人。主持28项国家及省部级基金，经费达2000万元；以第一和年通讯作者发表论文189篇，SCI收录98篇，被引1600余次；副主编参编国家教材5部；招收博士研究生和博士后研究人员，目前已培养博士43名，博士后3名。', N'~/Assets/Doctor_Imgs/D_009.jpg', 2, 13, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (11, N'zxb', N'zxb', N'张晓彪', N'男', N'张晓彪博士，江苏扬州人。复旦大学附属中山医院神经外科主任，博士生导师，复旦大学基础医学院双聘教授。任中国医师协会内镜医师分会常委、副总干事，中国医师协会神经内镜专委会副主任委员，欧美同学会神经内镜专委会副主任委员，上海抗癌协会神经肿瘤分会副主任委员。在国内率先报道采用EEEA鞍上三脑室颅咽管瘤、Meckel’s 囊肿瘤、颞下窝肿瘤和齿状突切除技术，内镜SCITA切除松果体区、丘脑肿瘤和岩斜区脑膜瘤等。国际上，率先报道运用3D-FIESTA MR技术评估颅底中线病变，率先采用对侧后纵裂经大脑镰楔前叶入路切除侧脑室三角区脑膜瘤，联合内镜经鼻入路齿状突切除加后路减压复位固定治疗颅底凹陷症，内镜经鼻终板入路切除三脑室内颅咽管瘤。进行全系列内镜幕下小脑上入路（SCITA）的研发和推广运用，丰富了神经内镜技术运用领域，特别有利于松果体区肿瘤和岩斜区脑膜瘤的手术切除。2013年以来运用假包膜外分离技术切除垂体腺瘤，显著提高了肿瘤的全切率，报道GH腺瘤内分泌缓解率达国际最高水平。提出全内镜神经外科的概念，积极倡导、推广和实践神经内镜技术在神经外科手术全领域的运用。2019年11月发起创立了长三角神经内镜创新联盟，促进区域内神经内镜技术的推广和创新工作。主编《内镜导航微创神经外科手术学》和《松果体区肿瘤内镜微创手术学》，受邀参编美国Walter C. Jean主编的《Skull Base Surgery：Strategies》等专著。', N'~/Assets/Doctor_Imgs/D_010.jpg', 2, 15, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (12, N'lwc', N'lwc', N'罗慰慈
', N'男', N' 罗慰慈，呼吸内科学教授，男，1924年生，福建福州人。1948年毕业于福建协和大学生物系，1953年毕业于北京中国协和医学院医本科。1955～1956年任北京协和医院内科总住院医师，1957年任主治医师，1979年任主任医师，1983年任北京协和医院内科副主任，1985～1986年任北京协和医院内科主任、教授，博士研究生导师。1959～1960年曾在北京中医学院和南京中医学院学习中医两年。1983年曾在美国约翰霍浦金斯医学院和俄立冈医学科学中心任访问学者。 ', N'~/Assets/Doctor_Imgs/D_011.jpg', 3, 6, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (13, N'zxj', N'zxj', N'曾学军', N'女', N'曾学军，主任医师，内科学教授，博士生导师。1981-1986年于湘雅医学院获医学本科学位，1989-1993于北京协和医院获风湿免疫学博士学位。北京协和医院全科医学科（普通内科）主任，北京协和医学院全科医学系主任。现担任卫生部国家公共卫生服务项目-社区老年健康管理规范制定专家组组长，国际痛风研究小组中国代表，中华医学会全科医学分会副主任委员，中华医学会内科学分会常委，中国社区卫生协会常务理事，中国医师协会老年医学分会常务委员。国家基层卫生健康标准专业委员会的副主任委员。中国社区卫生协会家庭医生联合工作委员会主席。北京医学会内科学分会副主任委员，北京医学会全科学分会副主任委员。《中华全科医师杂志》副主编，《基础医学与临床》、《中华免疫和变态反应杂志》、《中国全科医学》、《北京医学》等杂志编委。', N'~/Assets/Doctor_Imgs/D_012.jpg', 3, 42, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (14, N'lts', N'lts', N'李太生', N'男', N'李太生，主任医师，教授，博士研究生导师，感染内科主任。卫生部艾滋病专家咨询委员会临床组组长，中华医学会感染性疾病分会副主任委员兼艾滋病学组组长、曾任中华医学会热带病和寄生虫分会主任委员。共发表学术论文200余篇，其中在SCI收录的杂志上发表论文50余篇，被他人引用超过2500次，曾多次获得国家和省部级科技进步成果奖。此外，还获得全国留学回国人员先进个人代表、第八届全国青年科技奖和全国“五一”劳动奖，入选“新世纪百千万人材工程”国家级人选，享受国务院特殊津贴。', N'~/Assets/Doctor_Imgs/D_013.jpg', 3, 43, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (15, N'yj', N'yj', N'尹佳', N'女', N'尹佳， 现任北京协和医院变态（过敏）反应科教授、博士生导师。



擅长各种过敏性疾病疑难病症的诊治。尤其擅长过敏性哮喘、过敏性休克、食物过敏、花粉症合并食物过敏、药物过敏和荨麻诊的病因学诊治。


现任过敏性疾病精准诊疗北京市重点实验室主任；中国医师协会变态反应医师分会会长、中华医学会变态反应分会前任主任；中国医师协会理事、北京医师协会常务理事、国家食药监局药品注册审评专家咨询委员会委员、国家免疫规划专家咨询委员会委员、中华临床免疫和变态反应杂志主编、亚太变态反应组织理事会常务理事；世界变态反应组织（WAO）中国代表。先后承担国家级、省部级科研课题10余项。带领团队获得9种变应原医院制剂北京市药监局注册批件，牵头完成8项全国多中心进口药物注册临床试验。分别获北京市科学技术二等奖等省部级奖多项；获国家发明专利6项，发表文章80余篇。2010年获美国变态反应专科医师学会（ACAAI）世界杰出过敏医生奖，成为首位获得此奖的大陆医生。 ', N'~/Assets/Doctor_Imgs/D_014.jpg', 3, 44, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (16, N'zls', N'zls', N'赵林双', N'女', N'赵林双，女，副主任医师，医学博士，从事内科及内分泌专业26年，擅长糖尿病、甲状腺疾病、肾上腺疾病等疾病诊治。承担湖北省自然科学基金课题一项，全军“十五”课题分课题一项。曾获军队科技进步三等奖二项，参与军队科技进步二等奖研究一项，获省科技进步一等奖一项，其发表论著36篇，其中在中华医学会系列杂志上发表论著11篇。', N'~/Assets/Doctor_Imgs/D_015.jpg', 4, 7, N'副主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (17, N'lz', N'lz', N'李智', N'男', N'李智，副主任医师，中国人民解放军总医院（301医院）骨科博士，师从著名骨科专家卢世璧院士。1999年从事骨科临床工作，专业理论知识扎实，先后在美国耶鲁大学医学院和迈阿密大学医学院访学进修，在股骨头缺血性坏死、强直性脊柱炎（强直髋）、先天性髋关节发育不良、膝关节炎致内、外翻畸形、膝关', N'~/Assets/Doctor_Imgs/D_016.jpg', 4, 13, N'副主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (18, N'hzh', N'hzh', N'胡振红', N'男', N'胡振红，呼吸内科主任，副主任医师，医学博士。从事呼吸内科专业20年，擅长慢性阻塞性肺疾病、呼吸衰竭、重症肺炎、呼吸危重症等疾病的诊断与治疗。现任湖北省中西医结合学会呼吸病分会副主任委员、湖北省医学会呼吸病分会委员、武汉市防痨协会理事等学术职务。', N'~/Assets/Doctor_Imgs/D_017.jpg', 4, 6, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (19, N'lfc', N'lfc', N'陈利锋', N'女', N'陈利锋，风湿免疫科主任，医学博士/博士后，硕士生导师。临床工作近20年，擅长中西医结合治疗风湿免疫性疾病、老年病、呼吸病及妇科疾病等内科杂症。主持国家级、省部级课题6项，医院课题2项，发表学术论文30余篇，主编专著3部，获全军中医药大比武三等奖，全军医疗成果二等奖及专利1项 。入选2', N'~/Assets/Doctor_Imgs/D_018.jpg', 4, 42, N'主任医师', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (22, N'yjr', N'yjr', N'杨建荣', N'男', N'杨建荣，男，中共党员，广西壮族自治区人民医院肝胆外科主任医师，医务部部长。广西医学会普外专业委员会常委、肝胆外科学分会委员、广西中西医结合学会常委、广西医师协会区医院联络部部长。现任广西壮族自治区人民医院党委书记，主任医师、教授、硕士生导师，肝胆胰腺乳腺甲状腺外科业务主任。', N'~/Assets/Doctor_Imgs/D_001.jpg', 5, 2, N'主任医师', N'星期一上午，星期三上午，星期五下午，星期二下午，星期四下午，')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (23, N'ywz', N'ywz', N'乐文政', N'男', N'乐文政', N'~/Assets/Doctor_Imgs/D_001.jpg', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[t_doctorInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_onlineInquiry] ON 
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (1, 1, 2, N'吴医生，你好', CAST(N'2022-03-22T23:39:18.070' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (2, 1, 2, N'你敢问，我敢答，轻则癌症', CAST(N'2022-03-22T23:40:35.243' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (3, 1, 2, N'重则投胎', CAST(N'2022-03-22T23:41:36.253' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (4, 1, 2, N'小小感冒，不至于', CAST(N'2022-03-22T23:45:18.260' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (5, 2, 1, N'杨医生，你好', CAST(N'2022-03-22T23:50:18.070' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (6, 2, 1, N'一步到位，停尸房', CAST(N'2022-03-22T23:55:35.273' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (7, 2, 2, N'胃疼咋办', CAST(N'2022-03-27T23:52:49.820' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (8, 2, 2, N'血压180咋办', CAST(N'2022-03-28T01:13:13.407' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (9, 1, 1, N'肝胆外科？那我浑身是胆咋办', CAST(N'2022-03-28T18:55:27.500' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (10, 1, 1, N'在吗？', CAST(N'2022-03-28T18:55:32.993' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (11, 1, 1, N'在的', CAST(N'2022-03-28T18:59:44.040' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (17, 1, 2, N'吴隐雄', CAST(N'2022-03-29T14:42:08.120' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (18, 1, 1, N'做手术嘎了吧', CAST(N'2022-03-29T16:30:37.040' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (19, 2, 1, N'大可不必', CAST(N'2022-03-29T21:26:42.400' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (20, 2, 2, N'多读书多看报', CAST(N'2022-03-29T21:28:14.567' AS DateTime), NULL, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[t_onlineInquiry] OFF
GO

-- 用户登录查询
SELECT * FROM t_userInfo 
WHERE UserName = 'test' AND UserPwd = '000'

-- 用户信息查询
SELECT * FROM t_userInfo 
WHERE userID = 1

-- 医生登录
SELECT * FROM t_doctorInfo 
WHERE DoctorName = 'yjr' AND DoctorPwd = 'yjr'

-- 医院查询
SELECT HospitaName, HospitaDescribe, Grade, HospitaRegion, HospitalAddress, HospitalImg FROM t_hospitalinfo

-- 医生信息查询
SELECT doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept 
WHERE t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID and doctorID = 1

-- 医院科室查询
SELECT Department FROM t_dept 
WHERE deptID IN (SELECT deptID FROM t_doctorInfo WHERE hospitalID = 5)

-- 医生值班日期查询
SELECT WorkDay FROM t_doctorInfo 
WHERE doctorID = 1

-- 消息查询
SELECT * FROM t_onlineInquiry, t_userInfo, t_doctorInfo 
WHERE t_onlineInquiry.userID = t_userInfo.userID AND t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND t_userInfo.userID = 1 AND t_doctorInfo.doctorID = 1
ORDER BY MessageTime ASC

-- 医生值班信息修改
UPDATE t_doctorInfo SET WorkDay = '' 
WHERE doctorID = 1

-- 消息列表查询:
-- 医生端
SELECT t_onlineInquiry.userID, t_userInfo.RealName, t_userInfo.UserImg FROM t_onlineInquiry, t_userInfo 
WHERE t_onlineInquiry.userID = t_userInfo.userID AND doctorID = 1 AND DoctorRead = 0
GROUP BY t_onlineInquiry.userID, t_userInfo.RealName,t_userInfo.UserImg

-- 查询用户最新消息
SELECT * FROM t_onlineInquiry 
WHERE userID = 1 AND doctorID = 2 AND UserType = 1 
ORDER BY MessageTime DESC

-- 改为医生已读
UPDATE t_onlineInquiry SET DoctorRead = 1 
WHERE  userID = 1 AND doctorID = 1

-- 用户端
SELECT t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg, t_onlineInquiry.MessageImg FROM t_onlineInquiry, t_doctorInfo 
WHERE t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND userID = 1 AND UserRead = 0 
GROUP BY t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg, t_onlineInquiry.MessageImg

-- 查询医生最新消息
SELECT TOP 1 Message, MessageTime, MessageImg FROM t_onlineInquiry 
WHERE doctorID = 1 AND doctorID = 1 AND UserType = 0 
ORDER BY MessageTime DESC

-- 改为用户已读
UPDATE t_onlineInquiry SET UserRead = 1 
WHERE  userID = 1 AND doctorID = 1

-- 预约信息查询
SELECT appointmentID, t_userInfo.RealName, AppointmentTime FROM t_appointment, t_userInfo 
WHERE t_appointment.userID = t_userInfo.userID AND doctorID = 1

-- 删除预约信息
DELETE t_appointment 
WHERE appointmentID = 1

-- 聊天图片添加
INSERT t_onlineInquiry (userID, doctorID, MessageImg, UserType) VALUES ({0}, {1}, '{2}', 1)

-- 查询重复预约
SELECT * FROM t_appointment WHERE userID = 1
