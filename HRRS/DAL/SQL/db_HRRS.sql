--CREATE DATABASE db_HRRS 
--ON PRIMARY ( 
--	NAME = 'db_HRRS', 
--	filename = 'D:\׿Խ��Ŀ\���׿Խ��Ŀ\HRRS\HRRS\DAL\SQL\db_HRRS.mdf',  -- ·���ǵû�
--	size = 5MB, 
--	maxsize = 10MB, 
--	filegrowth = 10% 
--) 
--LOG ON ( 
--	NAME = 'db_HRRS_log', 
--	filename = 'D:\׿Խ��Ŀ\���׿Խ��Ŀ\HRRS\HRRS\DAL\SQL\db_HRRS_log.ldf',  -- ·���ǵû�
--	size = 5MB, 
--	maxsize = 10MB, 
--	filegrowth = 10% 
--)
--GO

CREATE DATABASE db_HRRS 
GO

USE db_HRRS 
GO

-- �������ڣ���ɾ��
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

-- �û���Ϣ��
CREATE TABLE t_userInfo(
	userID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- �û�ID
	UserName VARCHAR ( 30 ) UNIQUE NOT NULL,  -- �û��˻�
	UserPwd VARCHAR ( 255 ) NOT NULL,  -- �û�����
	RealName VARCHAR ( 12 ),  -- �û���ʵ����
	UserSex VARCHAR ( 2 ) CHECK ( UserSex = '��' OR UserSex = 'Ů' ),  --�û��Ա� 
	IDCard VARCHAR ( 36 ),  -- �û����֤��
	UserPhone FLOAT UNIQUE,  -- �û��ֻ���
	UserImg VARCHAR(200) DEFAULT('~/Assets/ͷ��.svg'),  -- �û�ͷ��·��
)
		
-- ҽԺ���ұ�
CREATE TABLE t_dept( 
	deptID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- ����ID
	Department VARCHAR ( 30 ) UNIQUE NOT NULL,  -- ҽԺ����
) 
	
-- ҽԺ��Ϣ��
CREATE TABLE t_hospitalinfo(
	hospitalID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- ҽԺID
	HospitaName VARCHAR ( 50 ) NOT NULL,  -- ҽԺ����
	HospitaDescribe NVARCHAR ( MAX ),  -- ҽԺ���
	Grade VARCHAR ( 20 ),  -- ҽԺ�ȼ�
	HospitaRegion VARCHAR( 50 ),  -- ҽԺ����
	HospitalAddress VARCHAR ( 100 ),  -- ҽԺ��ַ	
	HospitalImg VARCHAR(255),  -- ҽԺͼƬ·��
) 
	
-- ҽ����Ϣ��
CREATE TABLE t_doctorInfo(
	doctorID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- ҽ��ID
	DoctorName VARCHAR ( 30 ) UNIQUE NOT NULL,  -- ҽ���˻�
	DoctorPwd VARCHAR ( 255 ) NOT NULL,  -- ҽ������
	DoctorRealName VARCHAR ( 12 ),  -- ҽ����ʵ����
	DoctorSex VARCHAR ( 2 ) CHECK ( DoctorSex = '��' OR DoctorSex = 'Ů' ),  -- ҽ���Ա�
	DoctorDescribe NVARCHAR ( MAX ),  -- ҽ�����
	DoctorImg VARCHAR( 255 ),  -- ҽ��ͷ��·��
	hospitalID INT FOREIGN KEY ( hospitalID ) REFERENCES t_hospitalinfo ( hospitalID ),  -- ҽ������ҽԺID�������
	deptID INT FOREIGN KEY ( deptID ) REFERENCES t_dept ( deptID ),  -- ҽ���������ұ�ID�������
	DoctorPosition VARCHAR ( 20 ),  -- ҽ��ְλ
	WorkDay VARCHAR ( 200 ),  -- �Ű�����
)
	
-- ԤԼ�����
CREATE TABLE t_appointment(
	appointmentID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- ԤԼID
	userID INT FOREIGN KEY ( userID ) REFERENCES t_userInfo ( userID ),  -- ԤԼ�Ļ���ID�������
	hospitalID INT FOREIGN KEY ( hospitalID ) REFERENCES t_hospitalinfo ( hospitalID ),  -- ԤԼ��ҽԺID�������
	deptID INT FOREIGN KEY ( deptID ) REFERENCES t_dept ( deptID ),  -- ԤԼ�Ŀ���ID�������
	doctorID INT FOREIGN KEY ( doctorID ) REFERENCES t_doctorInfo ( doctorID ),  -- ԤԼ��ҽ��ID�������
	AppointmentTime VARCHAR ( 255 ) NOT NULL,  -- ԤԼʱ��
)

-- ���������
CREATE TABLE t_onlineInquiry(
	inquiryID INT PRIMARY KEY IDENTITY ( 1, 1 ),  -- ����ID
	userID INT FOREIGN KEY ( userID ) REFERENCES t_userInfo ( userID ),  -- ԤԼ�Ļ���ID������� 
	doctorID INT FOREIGN KEY ( doctorID ) REFERENCES t_doctorInfo ( doctorID ),  -- ԤԼ��ҽ��ID�������
	[Message] nvarchar( MAX ) DEFAULT( NULL ),  -- ��Ϣ
	MessageTime DATETIME DEFAULT( GETDATE() ),  -- ��Ϣʱ��
	MessageImg VARCHAR( 255 ) DEFAULT( NULL ),  -- ��ϢͼƬ
	UserType INT NOT NULL,  -- �û����ͣ�1 Ϊ�û���0 Ϊҽ����
	UserRead INT DEFAULT( 0 ),  -- �û��Ƿ��Ѷ���Ϣ��1 Ϊ�Ѷ��� 0 Ϊδ����
	DoctorRead INT DEFAULT( 0 ),  -- ҽ���Ƿ��Ѷ���Ϣ��1 Ϊ�Ѷ��� 0 Ϊδ����
)

SET IDENTITY_INSERT [dbo].[t_userInfo] ON 
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (1, N'test', N'000', N'����', N'��', N'452131200110110000', 17377009991, N'~/Assets/User_Imgs/3eb3616dd0973ad7.jpg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (2, N'xsy', N'xsy', N'ʮһ', N'��', N'452131200110110000', 17377008888, N'~/Assets/User_Imgs/U_001.jpg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (3, N'yhy', N'yhy', N'Ҷ��Ԫ', N'��', N'452131200110110886', 13877198140, N'~/Assets/ͷ��.svg')
GO
INSERT [dbo].[t_userInfo] ([userID], [UserName], [UserPwd], [RealName], [UserSex], [IDCard], [UserPhone], [UserImg]) VALUES (4, N'asd', N'asd', N'����', N'��', N'452131200110110886', 18672908647, N'~/Assets/User_Imgs/201612230416198566.JPG')
GO
SET IDENTITY_INSERT [dbo].[t_userInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_dept] ON 
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (41, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (20, N'����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (21, N'������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (22, N'�������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (23, N'����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (24, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (18, N'����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (2, N'�ε����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (25, N'�ε������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (43, N'��Ⱦ�ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (13, N'�ǿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (26, N'�ؽ����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (44, N'������ӳ��')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (6, N'�����ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (9, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (27, N'�������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (28, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (29, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (30, N'������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (31, N'��ǻ��')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (32, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (12, N'�������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (7, N'�ڷ��ڴ�л��')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (33, N'Ƥ����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (42, N'��ͨ�ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (16, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (34, N'�����������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (5, N'���ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (15, N'�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (4, N'���ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (17, N'��ʹ��')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (35, N'θ�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (11, N'θ������Ѫ�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (3, N'�����ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (36, N'�������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (1, N'��Ѫ���ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (14, N'��Ѫ�����')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (8, N'ѪҺ�ڿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (37, N'�ۿ�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (38, N'��ҽ���˿�')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (39, N'��ҽ��')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (40, N'������')
GO
INSERT [dbo].[t_dept] ([deptID], [Department]) VALUES (10, N'��֢ҽѧ��')
GO
SET IDENTITY_INSERT [dbo].[t_dept] OFF
GO
SET IDENTITY_INSERT [dbo].[t_hospitalinfo] ON 
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (1, N'����ҽ�ƴ�ѧ��һ����ҽԺ', N'��������ɽ���¡��߽����ϡ��Ϻ�֮���Ĺ���ҽ�ƴ�ѧ��һ����ҽԺ������1934�꣬�ǹ����׼������׵��ۺ�ҽԺ��ȫ���ټ�ҽԺ��ȫ�����շ���ʾ��ҽԺ��ȫ����ӤҽԺ��ȫ���ۺ�ҽԺ��ҽҩ����ʾ����λ���ǹ���ҽ�ơ�ҽѧ������ҽѧ�о���ҽ�Ʊ��������ġ�ҽԺ���ж���������Ժ�������ٴ�����46��������91����ҽ������17�������Ŵ�λ3491�š���������330�����˴Σ�סԺ����10�����˴Σ�������5����̨�Ρ�ҽԺ����ְ��5631�ˡ����У���������ְ��322�ˡ�����ְ��440�ˡ����ܹ���Ժ�������ר��32�ˣ�����ͻ�����׿Ƽ���Ա10�ˣ���������ר��13�ˣ�������ʮ��ǧ�˲Ź��̡��ڶ������ѡ8�ˣ���һ������ҽѧ�߲�ιǸ��˲�������139���ƻ�������ѡ10�ˣ��л�ҽѧ��ȫ��ίԱ45�ˣ�����ҽѧ���רҵίԱ������ίԱ48�ˡ�������ίԱ50�ˡ�200������ѧ������Ӣ�����ձ���30������ҡ�ҽԺ��֡�ҽ��������ҽԺ�����ĺ��ģ����ʸ�Ч��ҽԺ��չ����������ԭ�򣬼�ǿҽԺ�ں����裬���ҽԺ���Ƽ���ˮƽ���ܶ�������Ŀ��˹�������ȫ���Ŀհף����󲿷��ٴ�ҽ�ơ�ҽ��ר�Ƽ���ˮƽ���ڹ������ȡ������Ƚ���λ��', N'�����׵�', N'����', N'����������˫ӵ·', N'~/Assets/Hospital_Imgs/H_001.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (2, N'������ѧ������ɽҽԺ', N'������ѧ������ɽҽԺ�ǹ��������ͼƻ�����ίԱ��Ԥ�����λ���Ǹ�����ѧ�ĸ����ۺ��Խ�ѧҽԺ��ҽԺ��ҵ��1937�꣬�ǵ�ʱ�й��˹���ĵ�һ�������ۺ���ҽԺ�������ڹ����Ϻ�ҽѧԺ��Ϊ�����й�������������������ɽ����������Ϊ����ɽ����ҽԺ�������Ϊ��ɽҽԺ����ź������Ϻ���һҽѧԺ������ɽҽԺ���Ϻ�ҽ�ƴ�ѧ������ɽҽԺ��2001����������1991��12�¾���������׼����Ϊ�Ϻ��е�һ�������׵�ҽԺ������76��ķ�չ����ɽҽԺ����Ŀǰռ�����95892.1�O���ܽ������356206.5�O���˶���λ1700�š�2013���ż��������311���˴Σ���Ժ����8.4���˴Σ�סԺ��������5.5���˴Ρ�ȫԺְ��3433�ˣ����й���ѧԺԺʿ1�ˣ��й�����ԺԺʿ2�ˣ��߼�ְ��437�ˣ�ҽʦ1219�ˣ���סԺҽʦ�淶����ѵ����355�ˣ�����ʿ1340�ˣ�ҽ����Ա401�ˡ�', N'����', N'�Ϻ�', N'�Ϻ��з���·180��/б��·1609�� ', N'~/Assets/Hospital_Imgs/H_002.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (3, N'����Э��ҽԺ', N'����Э��ҽԺ���ۺ�ʵ���ǳ����ڵ������׵�ҽԺ���ڰ�����Ŀ�п�ν���й�ҽԺ��һ�ҡ�����Э��ҽԺ��ԭ�����ʵ�ҽԺ�ϲ����Ϊ������Ժ������Э��ҽԺ��Ժ������Э��ҽԺ��Ժ��Ŀǰ����סԺ��λ2000���ţ���ߵ���������ͻ��15000�˴Σ����Ժ����8���˴Σ�סԺ����3.2������ƽ��סԺ��9.5�����£���������6���˴Ρ������ٴ���ҽ������54�������Ҽ��ص�ѧ��20�����������ص�ѧ��5������ְ��ʽְ��4000���ˣ���ԺԺʿ6�ˡ���������682�ˣ��л�ҽѧ�ᡢ����ҽѧ�ἰ����ѧ��ǰ����ί���������Ρ�������ίԱ����������60�������ĺ�����־�����ܱ༰��������60����', N'�����׵�', N'����', N'�����ж�����˧��԰1��', N'~/Assets/Hospital_Imgs/H_003.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (4, N'�й������ž��в�ս����ҽԺ', N'�й������ž��в�ս����ҽԺ��һ�����й�����ʷ�͸�����ͳ��ҽԺ��1946��6�£������ں�����ʡ�����أ���ǰ��Ϊ�������������ڰ˺�ҽԺ��ҽԺ��7��Ǩַ��13��������10�θı�������ϵ��2016��9��5�գ�ת��֣�����ڱ������ġ�ҽԺʼ�ռ���վ�Ϊ�����򣬼�ֿ�ѧ��չ��·���ԶԵ�������������ʹ�����ҳ�֮�����۴󰮣��ö����ơ����񡢿��к͹���ľ���֮���ɾʹ�ҽ�����������ܵĻԻ͡�Ŀǰ��ҽԺ�ѷ�չ��Ϊһ����ҽ�ơ���ѧ�����С�Ԥ��������������Ϊһ��Ĵ����ۺ��Ծ���ҽԺ����ȫ�������׵�ҽԺ��ȫ���ټ�ҽԺ����ӤҽԺ��ȫ�����ֻ�ҽԺ����ʾ����λ��ȫ���Ƚ�ҽԺ��ȫ���������Ӣ�ۼ��塢ȫ������ѵ���Ƚ���λ���Ǻ���ʡ���人�У�����ְ�������񣩻���ҽ�Ʊ��ն���ҽԺ������ʡ���人�У�����ũ�����ҽ�ƶ���ҽԺ������ʡʡֱ���人����ֱ������ҽ�ƶ���ҽԺ������ʡ�۸����ҽԺ������ʡ���������λ', N'�����׵�', N'����', N'�人�����������·627��', N'~/Assets/Hospital_Imgs/H_004.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (5, N'����׳������������ҽԺ', N'����׳������������ҽԺλ�ڹ���׳����������������������Դ·6�ţ�ʼ����1941�꣬�����������ﲿ��һ����Ժ���������22.45��ƽ���ף�ռ�����64585.96ƽ���ף���һ����ҽ�ơ����С���ѧ��Ԥ������Ϊһ��������ۺ�ҽԺ��ҽԺ������Ѫ���ڿơ������ڿơ����ڿơ����ڿơ������ڿơ��ڷ��ڴ�л�ơ�ѪҺ�ڿƣ���֢ҽѧ�ơ�θ������Ѫ����ơ��ε�������ơ�������ơ��ǿơ���Ѫ����ơ�����ơ�����ơ���ʹ�ơ����ơ����ơ����ơ��ۿơ���ҽ�ơ���ҽ���˿ơ������ơ�����ơ�����ơ������Ƶ��ٴ���ҽ�����ҡ����������ڿơ��ۿơ���ҽ���˿ơ��ٴ�����Ϊ�����ٴ��ص�ר�ƣ����ơ����ڿơ�����ơ���֢ҽѧ�ơ����ڿơ������Ϊ�������ٴ��ص�ר�ƣ�����Ѫ�ܲ��ƺ������ڿ�Ϊ�������ص�ѧ�ƺ͹������������ġ��ۿơ�����΢���������ġ��ǿ�Ϊ�������ص㽨��ѧ�ơ�ҽԺ������Ժ�����Ų���1881�ţ�����ҽ��ֱ�߼����������ȫ����Ӱ�񵼺���������ϵͳ��������128�Ŷ������CT��������3.0T�˴Ź���GE�ͷ�����Ѫ����Ӱϵͳ��ҽ���豸��', N'����', N'����', N'��������������Դ·6��', N'~/Assets/Hospital_Imgs/H_005.jpg')
GO
INSERT [dbo].[t_hospitalinfo] ([hospitalID], [HospitaName], [HospitaDescribe], [Grade], [HospitaRegion], [HospitalAddress], [HospitalImg]) VALUES (6, N'�����еڶ�����ҽԺ', N'�����еڶ�����ҽԺ������ҽ�ƴ�ѧ��������ҽԺ������ҽ�ƴ�ѧ�����ٴ�ҽѧԺ��λ�ڹ���׳�������������е���·13�ţ�ʼ����1952�꣬ռ�����3���ƽ���ף��������7���ƽ���ף���һ����ҽ�ơ����ȡ���ѧ�����С�Ԥ��������������Ϊһ��������ۺ�ҽԺ����������ҽ������ҽԺ��ҽԺ���к����ڿơ������ڿơ����ڿơ������ơ����ڿơ��ڷ��ڿơ���Ѫ���ڿơ���ҽ�ơ�θ����ơ�������ơ�������ơ��ε�����ơ�����ơ�����������ơ��ؽ���ơ�������ơ�������ơ����ơ������ơ��ۿơ�����ơ��ĵ�ͼ��Ͽơ�����Ƶ�46��ҽ��רҵ���ң�4��ҽ�����ģ�����������ֳҽ�����ġ�����֫���ӳ����ġ������в��������������ġ�������ҩѧ�����������ģ���3���������ص�ѧ�ƣ����ơ�����ơ�����ƣ���2���о�����������­�Դ����о����������йǿƼ����о�������3���������ص�ѧ�ƣ���ֳҽ�����ġ������ơ��ǿƣ���15���ٴ������ң��飩��2�����������������ģ������н���������԰�ֵ�����԰���������������ġ���������������ɳ��ֵ�ǰ�����������������ģ������⣬����������ҽԺ�ͽ���������ҽԺ�����ڽ��裩��', N'����', N'����', N'����׳�������������е���·13��', N'~/Assets/Hospital_Imgs/H_006.jpg')
GO
SET IDENTITY_INSERT [dbo].[t_hospitalinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_doctorInfo] ON 
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (1, N'zz', N'zz', N'����', N'��', N'���������ڿ����Σ���רδ��ҵ���ٴ�����20�꣬�ó�Ӧ�Ը�����̱���ߣ�������ַ��У�װ����ɵ��ѧ����˵�����ȵȡ�2002��1��11�ճ����ں��������ܰ�����ǵ��������ĵ�ͷ�ߣ��������ӣ��ǳ�������λ���ӣ�������ȡ��Ϊ����Ԣ����δ���Ǻͻʵ�һ�����������ǳ�˧����', N'~/Assets/Doctor_Imgs/D_000.jpg', 3, 5, N'����ҽʦ', N'����һ���磬')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (2, N'wyx', N'wyx', N'������', N'��', N'�����ۣ��й���Ա����Ѫ���ڿ�����ҽʦ��ҽԺ��Ժ������Ѫ���ڿƸ����Σ�������������ҽԺ������Ѫ�ܼ�������Ϻ����ƽ�30�꣬�ر����ڹ��Ĳ�����Ѫѹ������ʪ�����ಡ���ļ���������ʧ����������ơ���Ƥ������������֧�������������������������ȷ���������ļ������ḻ�ľ��顣', N'~/Assets/Doctor_Imgs/D_002.jpg', 5, 1, N'����ҽʦ', N'���������磬���������磬����һ���磬���������磬')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (3, N'csq', N'csq', N'
��˫��
', N'��', N' 
��˫��
��ҽѧ��ʿ ������ҽʦ ���º���ϵͳ�������ƹ���10���꣬�����˷ḻ���ٴ����顣1983����������Լ�����ֽ�˹ҽѧԺ�Ͷ�����ҽѧ��ѧ�����η���ѧ�� 

�ó������ڿƳ����������Ρ� ', N'~/Assets/Doctor_Imgs/D_003.jpg', 1, 6, N'������ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (4, N'lyh', N'lyh', N'���̻�', N'Ů', N'���̻�������ҽʦ�����ڣ����ڿ����Σ����ڿ�ר�ң�˶ʿ�о�����ʦ��ҽѧ˶ʿ���л�ҽѧ�����ಡѧ�ֻ�ȫ��ίԱ���й�ҽʦЭ�������ڿ�ҽʦ�᳣ֻ��ίԱ������ҽѧ�����ಡѧ�ֻ�����ίԱ�����л����ಡ��־����������ҽѧ������־��ί���Ⱥ󷢱�����100��ƪ������˶ʿ�о���70�ˣ��ó������ۺ�����Ĥ��������IgA���������������ס�ʹ��������������������Ѫѹ��������֢�Ǵ������ס�Ѫ���ס��������ಡ������� �� ', N'~/Assets/Doctor_Imgs/D_004.jpg', 1, 4, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (5, N'zc', N'zc', N'�ų�', N'��', N'�ųۣ� 1982���ҵ����ɽ��ѧ��1987���ñ���������ѧ��߷��Ӳ��Ϲ�ѧ˶ʿ��2003����������¿�����ѧ�߷��ӻ�ѧ��ѧ��ʿ���л����񹲺͹��Ƽ��������Ƚ�����ߡ�רע�ڡ�ħ���ϸ�¶���ǵĽṹ������Ӧ�û����о�����Ŀ��2002��-2004���ڹ����Ϸ�ҽԺ����ƣ�2004�������ڹ���ҽ�ƴ�ѧ��һ����ҽԺ��֢ҽѧ�� ', N'~/Assets/Doctor_Imgs/D_005.jpg', 1, 10, N'������ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (6, N'fjb', N'fjb', N'���̲�', N'��', N' ���̲�������ҽʦ����ҽ���˿�ѧ��������ҽ����ٴ�˶ʿ��������������ʦ����Ϊ��Ͽ��ѧ����ҽѧ������ѧ��ʦ����Ͽ��ѧ����ҽѧס�ർʦ��ʦ�й���ҽ�ƴ�ѧ��һ����ҽԺ��������ڣ����С���Ѫ��������ѧ��˼�롣�����Ĵ���ѧ����ҽԺ����ҽѧ���Ľ��ޡ��й���������ίԱ���Ա���л�ҽѧ����ʹѧ�ֻ��Ա����������ҽѧ��ίԱ����ҽ�粡ѧ��ίԱ��UPTA��Ա��֤������DMS������֤��AMS������ʼ�ˡ��ó��ۺ�Ӧ�ô�ͳ��ҽҩ���ִ��ɽ������������ڿƣ���ƣ����ƣ����ƣ����˿Ƽ��񾭿Ƶȼ����� ', N'~/Assets/Doctor_Imgs/D_006.jpg', 1, 39, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (7, N'cg', N'cg', N'�¸�', N'��', N'�¸ڣ� ҽԺְ��  ����Ƹ����Σ��ؿƲ�������
 
ѧ����ְ  
 
���޷ο�ѧ�ᣨAsian Pulmonary Pathology Society,APPS���й�����
 
������������Э�ᣨInternational Thymic Malignancy Interest GroupITMIG��ίԱ
 
���ʷΰ��о�Э�ᣨInternational Association for the Study of Lung Cancer,IASLC����Ա
 
���ʰ�֢���������֯��International Collaboration on Cancer Reporting��ICCR)ר��
 
�л�Ԥ��ҽѧ��ְҵ�뻷������ѧ��ίԱ
 
�й�ҽҩ���＼��Э����֯����������ֻ�ίԱ
 
�л�ҽѧ�Ს��ֻ��ؿƲ�����ίԱ
 
�л�ҽѧ���Ϻ��ֻ��9�첡��ר�Ʒֻ�ίԱ
 
�о�����  ��������ѧ
 
��ѧ����  ���̲�ʿ��˶ʿ�о���������ר��ҽʦ��ѵ
 
��������
 
2000�꣬�¹�WuerzburgUniversity, ��۴�ѧ
 
2011�꣬����Memorial Sloan Kettering Cancer Center
 
������
 
�������ܰ���ϸ��ѧ����֯����ѧ�ͷ�������ѧ�о�������������ˣ�
 
1996����Ϻ��пƼ��������Ƚ�
�������������Լ����Ԥ��ָ����о�������һ����ˣ�
 
2003����Ϻ��пƼ��������Ƚ�
 
�׽��Ϻ���ҽѧ�Ƽ������Ƚ�', N'~/Assets/Doctor_Imgs/D_007.jpg', 2, 41, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (8, N'tys', N'tys', N'̷��ɽ ', N'��', N'̷��ɽ �� ר������������ٷ������Լ����Ĳ�����ϣ��ó��μ��ز������������ܵ���֢�Գ����������Ƣ�༲���������Լ����Ĳ�����ϣ��ó��ε������������ܵ��������μ��ز��������Ǽ��ܰ���֯Դ����������������֯������ϡ���ֳϸ����ɫ��ϸ�������Ĳ�����ϵȡ�
 
ҽԺְ��1990-1��2013-9��������Ρ�2010-9��2014-12�ٴ�����סԺҽʦ��ѵ�������Ρ�
 
�о�������������ѧ', N'~/Assets/Doctor_Imgs/D_008.jpg', 2, 41, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (9, N'dj', N'dj', N'����', N'��', N'���������θ�����ѧ������ɽҽԺ�ǿ����Ρ�����������Ρ����������ۺ������������Ρ�������ѧҽѧ�����о������������������ǹ�������ί��ͻ������������ר�ҡ��Ϻ��пƼ���Ӣ���Ϻ�����˲š��Ϻ�������ѧ�ƴ�ͷ�ˡ��Ϻ�ҽѧ��չ�ܳ����׽����Ϻ��д��ڿ�ѧ������ߡ����¹ǿƹ���30�꣬��ɼ���������ǧ�������ó��������������������Լ�����������ˡ��������ۺͼ�����������Σ����������ڼ������������������Լ����ķ��Ρ����޸��ؽ������յ����ٴ�������о����Ե�һ����˻�ù��ҿƼ��������Ƚ���2014�꣩���Ϻ��пƼ�����һ�Ƚ���2011�꣩���Ϻ��пƼ��������Ƚ���2013�꣩�Ƚ���������ù�������ί�䷢�ġ��й���ҽ�������л�ҽѧ�ᡢ�й�ҽʦЭ������ϰ䷢�ġ���֮��ҽ��������ʱ����ר�ƾ�Ӣ�����ǿơ��ȶ�������ƺš������л�ҽѧ��ǿƷֻἹ��ѧ��ίԱ���л�ҽѧ���˲�ѧ�ֻ�ǿ�רί�ḱ����ίԱ���л�ҽѧ����շֻḱ����ίԱ���й��о���ҽԺѧ�Ἱ�����רί�ḱ����ίԱ���й�ҽʦЭ��ǿ�ҽʦ�ֻ�ίԱ���Ϻ�ҽʦЭ��ǿƷֻḱ�᳤���й�����ҽ���ѧ����˿�רί�ḱ����ίԱ���Ϻ�������ҽ���ѧ����˿�רί������ίԱ���й�����ҽѧ�����ؽڿ���רҵίԱ�ḱ����ίԱ��ѧ����ְ���౾�л�ϵ����־��10�౾SCI��־��ί��ͨѶ��ί������ˡ�����28����Ҽ�ʡ�������𣬾��Ѵ�2000��Ԫ���Ե�һ����ͨѶ���߷�������189ƪ��SCI��¼98ƪ������1600��Σ�������α���ҽ̲�5�������ղ�ʿ�о����Ͳ�ʿ���о���Ա��Ŀǰ��������ʿ43������ʿ��3����', N'~/Assets/Doctor_Imgs/D_009.jpg', 2, 13, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (11, N'zxb', N'zxb', N'������', N'��', N'�����벩ʿ�����������ˡ�������ѧ������ɽҽԺ��������Σ���ʿ����ʦ��������ѧ����ҽѧԺ˫Ƹ���ڡ����й�ҽʦЭ���ھ�ҽʦ�᳣ֻί�����ܸ��£��й�ҽʦЭ�����ھ�רί�ḱ����ίԱ��ŷ��ͬѧ�����ھ�רί�ḱ����ίԱ���Ϻ�����Э���������ֻḱ����ίԱ���ڹ������ȱ�������EEEA����������­�ʹ�����Meckel��s ������������������ͳ�״ͻ�г��������ھ�SCITA�г��ɹ�������������������б����Ĥ���ȡ������ϣ����ȱ�������3D-FIESTA MR��������­�����߲��䣬���Ȳ��öԲ�����Ѿ�������ШǰҶ��·�г���������������Ĥ���������ھ�������·��״ͻ�г��Ӻ�·��ѹ��λ�̶�����­�װ���֢���ھ������հ���·�г���������­�ʹ���������ȫϵ���ھ�Ļ��С������·��SCITA�����з����ƹ����ã��ḻ�����ھ��������������ر��������ɹ�������������б����Ĥ���������г���2013���������üٰ�Ĥ����뼼���г��������������������������ȫ���ʣ�����GH�����ڷ��ڻ����ʴ�������ˮƽ�����ȫ�ھ�����Ƶĸ�������������ƹ��ʵ�����ھ����������������ȫ��������á�2019��11�·������˳��������ھ��������ˣ��ٽ����������ھ��������ƹ�ʹ��¹��������ࡶ�ھ�����΢�����������ѧ���͡��ɹ����������ھ�΢������ѧ���������α�����Walter C. Jean����ġ�Skull Base Surgery��Strategies����ר����', N'~/Assets/Doctor_Imgs/D_010.jpg', 2, 15, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (12, N'lwc', N'lwc', N'��ο��
', N'��', N' ��ο�ȣ������ڿ�ѧ���ڣ��У�1924���������������ˡ�1948���ҵ�ڸ���Э�ʹ�ѧ����ϵ��1953���ҵ�ڱ����й�Э��ҽѧԺҽ���ơ�1955��1956���α���Э��ҽԺ�ڿ���סԺҽʦ��1957��������ҽʦ��1979��������ҽʦ��1983���α���Э��ҽԺ�ڿƸ����Σ�1985��1986���α���Э��ҽԺ�ڿ����Ρ����ڣ���ʿ�о�����ʦ��1959��1960�����ڱ�����ҽѧԺ���Ͼ���ҽѧԺѧϰ��ҽ���ꡣ1983����������Լ�����ֽ�˹ҽѧԺ�Ͷ�����ҽѧ��ѧ�����η���ѧ�ߡ� ', N'~/Assets/Doctor_Imgs/D_011.jpg', 3, 6, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (13, N'zxj', N'zxj', N'��ѧ��', N'Ů', N'��ѧ��������ҽʦ���ڿ�ѧ���ڣ���ʿ����ʦ��1981-1986��������ҽѧԺ��ҽѧ����ѧλ��1989-1993�ڱ���Э��ҽԺ���ʪ����ѧ��ʿѧλ������Э��ҽԺȫ��ҽѧ�ƣ���ͨ�ڿƣ����Σ�����Э��ҽѧԺȫ��ҽѧϵ���Ρ��ֵ������������ҹ�������������Ŀ-�������꽡������淶�ƶ�ר�����鳤������ʹ���о�С���й������л�ҽѧ��ȫ��ҽѧ�ֻḱ����ίԱ���л�ҽѧ���ڿ�ѧ�᳣ֻί���й���������Э�᳣�����£��й�ҽʦЭ������ҽѧ�᳣ֻ��ίԱ�����һ�������������׼רҵίԱ��ĸ�����ίԱ���й���������Э���ͥҽ�����Ϲ���ίԱ����ϯ������ҽѧ���ڿ�ѧ�ֻḱ����ίԱ������ҽѧ��ȫ��ѧ�ֻḱ����ίԱ�����л�ȫ��ҽʦ��־�������࣬������ҽѧ���ٴ��������л����ߺͱ�̬��Ӧ��־�������й�ȫ��ҽѧ����������ҽѧ������־��ί��', N'~/Assets/Doctor_Imgs/D_012.jpg', 3, 42, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (14, N'lts', N'lts', N'��̫��', N'��', N'��̫��������ҽʦ�����ڣ���ʿ�о�����ʦ����Ⱦ�ڿ����Ρ����������̲�ר����ѯίԱ���ٴ����鳤���л�ҽѧ���Ⱦ�Լ����ֻḱ����ίԱ�氬�̲�ѧ���鳤�������л�ҽѧ���ȴ����ͼ�����ֻ�����ίԱ��������ѧ������200��ƪ��������SCI��¼����־�Ϸ�������50��ƪ�����������ó���2500�Σ�����λ�ù��Һ�ʡ�����Ƽ������ɹ��������⣬�����ȫ����ѧ�ع���Ա�Ƚ����˴����ڰ˽�ȫ������Ƽ�����ȫ������һ���Ͷ�������ѡ�������Ͱ�ǧ���˲Ĺ��̡����Ҽ���ѡ�����ܹ���Ժ���������', N'~/Assets/Doctor_Imgs/D_013.jpg', 3, 43, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (15, N'yj', N'yj', N'����', N'Ů', N'���ѣ� ���α���Э��ҽԺ��̬����������Ӧ�ƽ��ڡ���ʿ����ʦ��



�ó����ֹ����Լ������Ѳ�֢�����Ρ������ó��������������������ݿˡ�ʳ�����������֢�ϲ�ʳ�������ҩ�������ݡ����Ĳ���ѧ���Ρ�


���ι����Լ�����׼���Ʊ������ص�ʵ�������Σ��й�ҽʦЭ���̬��Ӧҽʦ�ֻ�᳤���л�ҽѧ���̬��Ӧ�ֻ�ǰ�����Σ��й�ҽʦЭ�����¡�����ҽʦЭ�᳣�����¡�����ʳҩ���ҩƷע������ר����ѯίԱ��ίԱ���������߹滮ר����ѯίԱ��ίԱ���л��ٴ����ߺͱ�̬��Ӧ��־���ࡢ��̫��̬��Ӧ��֯���»᳣�����£������̬��Ӧ��֯��WAO���й������Ⱥ�е����Ҽ���ʡ�������п���10��������Ŷӻ��9�ֱ�ӦԭҽԺ�Ƽ�������ҩ���ע��������ǣͷ���8��ȫ�������Ľ���ҩ��ע���ٴ����顣�ֱ�񱱾��п�ѧ�������Ƚ���ʡ�������������ҷ���ר��6���������80��ƪ��2010���������̬��Ӧר��ҽʦѧ�ᣨACAAI������ܳ�����ҽ��������Ϊ��λ��ô˽��Ĵ�½ҽ���� ', N'~/Assets/Doctor_Imgs/D_014.jpg', 3, 44, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (16, N'zls', N'zls', N'����˫', N'Ů', N'����˫��Ů��������ҽʦ��ҽѧ��ʿ�������ڿƼ��ڷ���רҵ26�꣬�ó����򲡡���״�ټ����������ټ����ȼ������Ρ��е�����ʡ��Ȼ��ѧ�������һ�ȫ����ʮ�塱����ֿ���һ�������ӿƼ��������Ƚ����������ӿƼ��������Ƚ��о�һ���ʡ�Ƽ�����һ�Ƚ�һ��䷢������36ƪ���������л�ҽѧ��ϵ����־�Ϸ�������11ƪ��', N'~/Assets/Doctor_Imgs/D_015.jpg', 4, 7, N'������ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (17, N'lz', N'lz', N'����', N'��', N'���ǣ�������ҽʦ���й������ž���ҽԺ��301ҽԺ���ǿƲ�ʿ��ʦ�������ǿ�ר��¬���Ժʿ��1999����¹ǿ��ٴ�������רҵ����֪ʶ��ʵ���Ⱥ�������Ү³��ѧҽѧԺ�������ܴ�ѧҽѧԺ��ѧ���ޣ��ڹɹ�ͷȱѪ�Ի�����ǿֱ�Լ����ף�ǿֱ�ţ����������Źؽڷ���������ϥ�ؽ������ڡ��ⷭ���Ρ�ϥ��', N'~/Assets/Doctor_Imgs/D_016.jpg', 4, 13, N'������ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (18, N'hzh', N'hzh', N'�����', N'��', N'����죬�����ڿ����Σ�������ҽʦ��ҽѧ��ʿ�����º����ڿ�רҵ20�꣬�ó����������Էμ���������˥�ߡ���֢���ס�����Σ��֢�ȼ�������������ơ����κ���ʡ����ҽ���ѧ��������ֻḱ����ίԱ������ʡҽѧ��������ֻ�ίԱ���人�з���Э�����µ�ѧ��ְ��', N'~/Assets/Doctor_Imgs/D_017.jpg', 4, 6, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (19, N'lfc', N'lfc', N'������', N'Ů', N'�����棬��ʪ���߿����Σ�ҽѧ��ʿ/��ʿ��˶ʿ����ʦ���ٴ�������20�꣬�ó�����ҽ������Ʒ�ʪ�����Լ��������겡�������������Ƽ������ڿ���֢�����ֹ��Ҽ���ʡ��������6�ҽԺ����2�����ѧ������30��ƪ������ר��3������ȫ����ҽҩ��������Ƚ���ȫ��ҽ�Ƴɹ����Ƚ���ר��1�� ����ѡ2', N'~/Assets/Doctor_Imgs/D_018.jpg', 4, 42, N'����ҽʦ', NULL)
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (22, N'yjr', N'yjr', N'���', N'��', N'��٣��У��й���Ա������׳������������ҽԺ�ε��������ҽʦ��ҽ�񲿲���������ҽѧ������רҵίԱ�᳣ί���ε����ѧ�ֻ�ίԱ����������ҽ���ѧ�᳣ί������ҽʦЭ����ҽԺ���粿���������ι���׳������������ҽԺ��ί��ǣ�����ҽʦ�����ڡ�˶ʿ����ʦ���ε��������ټ�״�����ҵ�����Ρ�', N'~/Assets/Doctor_Imgs/D_001.jpg', 5, 2, N'����ҽʦ', N'����һ���磬���������磬���������磬���ڶ����磬���������磬')
GO
INSERT [dbo].[t_doctorInfo] ([doctorID], [DoctorName], [DoctorPwd], [DoctorRealName], [DoctorSex], [DoctorDescribe], [DoctorImg], [hospitalID], [deptID], [DoctorPosition], [WorkDay]) VALUES (23, N'ywz', N'ywz', N'������', N'��', N'������', N'~/Assets/Doctor_Imgs/D_001.jpg', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[t_doctorInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[t_onlineInquiry] ON 
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (1, 1, 2, N'��ҽ�������', CAST(N'2022-03-22T23:39:18.070' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (2, 1, 2, N'����ʣ��ҸҴ�����֢', CAST(N'2022-03-22T23:40:35.243' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (3, 1, 2, N'����Ͷ̥', CAST(N'2022-03-22T23:41:36.253' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (4, 1, 2, N'СС��ð��������', CAST(N'2022-03-22T23:45:18.260' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (5, 2, 1, N'��ҽ�������', CAST(N'2022-03-22T23:50:18.070' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (6, 2, 1, N'һ����λ��ͣʬ��', CAST(N'2022-03-22T23:55:35.273' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (7, 2, 2, N'θ��զ��', CAST(N'2022-03-27T23:52:49.820' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (8, 2, 2, N'Ѫѹ180զ��', CAST(N'2022-03-28T01:13:13.407' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (9, 1, 1, N'�ε���ƣ����һ����ǵ�զ��', CAST(N'2022-03-28T18:55:27.500' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (10, 1, 1, N'����', CAST(N'2022-03-28T18:55:32.993' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (11, 1, 1, N'�ڵ�', CAST(N'2022-03-28T18:59:44.040' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (17, 1, 2, N'������', CAST(N'2022-03-29T14:42:08.120' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (18, 1, 1, N'���������˰�', CAST(N'2022-03-29T16:30:37.040' AS DateTime), NULL, 0, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (19, 2, 1, N'��ɲ���', CAST(N'2022-03-29T21:26:42.400' AS DateTime), NULL, 1, 0, 0)
GO
INSERT [dbo].[t_onlineInquiry] ([inquiryID], [userID], [doctorID], [Message], [MessageTime], [MessageImg], [UserType], [UserRead], [DoctorRead]) VALUES (20, 2, 2, N'�����࿴��', CAST(N'2022-03-29T21:28:14.567' AS DateTime), NULL, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[t_onlineInquiry] OFF
GO

-- �û���¼��ѯ
SELECT * FROM t_userInfo 
WHERE UserName = 'test' AND UserPwd = '000'

-- �û���Ϣ��ѯ
SELECT * FROM t_userInfo 
WHERE userID = 1

-- ҽ����¼
SELECT * FROM t_doctorInfo 
WHERE DoctorName = 'yjr' AND DoctorPwd = 'yjr'

-- ҽԺ��ѯ
SELECT HospitaName, HospitaDescribe, Grade, HospitaRegion, HospitalAddress, HospitalImg FROM t_hospitalinfo

-- ҽ����Ϣ��ѯ
SELECT doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept 
WHERE t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID and doctorID = 1

-- ҽԺ���Ҳ�ѯ
SELECT Department FROM t_dept 
WHERE deptID IN (SELECT deptID FROM t_doctorInfo WHERE hospitalID = 5)

-- ҽ��ֵ�����ڲ�ѯ
SELECT WorkDay FROM t_doctorInfo 
WHERE doctorID = 1

-- ��Ϣ��ѯ
SELECT * FROM t_onlineInquiry, t_userInfo, t_doctorInfo 
WHERE t_onlineInquiry.userID = t_userInfo.userID AND t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND t_userInfo.userID = 1 AND t_doctorInfo.doctorID = 1
ORDER BY MessageTime ASC

-- ҽ��ֵ����Ϣ�޸�
UPDATE t_doctorInfo SET WorkDay = '' 
WHERE doctorID = 1

-- ��Ϣ�б��ѯ:
-- ҽ����
SELECT t_onlineInquiry.userID, t_userInfo.RealName, t_userInfo.UserImg FROM t_onlineInquiry, t_userInfo 
WHERE t_onlineInquiry.userID = t_userInfo.userID AND doctorID = 1 AND DoctorRead = 0
GROUP BY t_onlineInquiry.userID, t_userInfo.RealName,t_userInfo.UserImg

-- ��ѯ�û�������Ϣ
SELECT * FROM t_onlineInquiry 
WHERE userID = 1 AND doctorID = 2 AND UserType = 1 
ORDER BY MessageTime DESC

-- ��Ϊҽ���Ѷ�
UPDATE t_onlineInquiry SET DoctorRead = 1 
WHERE  userID = 1 AND doctorID = 1

-- �û���
SELECT t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg, t_onlineInquiry.MessageImg FROM t_onlineInquiry, t_doctorInfo 
WHERE t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND userID = 1 AND UserRead = 0 
GROUP BY t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg, t_onlineInquiry.MessageImg

-- ��ѯҽ��������Ϣ
SELECT TOP 1 Message, MessageTime, MessageImg FROM t_onlineInquiry 
WHERE doctorID = 1 AND doctorID = 1 AND UserType = 0 
ORDER BY MessageTime DESC

-- ��Ϊ�û��Ѷ�
UPDATE t_onlineInquiry SET UserRead = 1 
WHERE  userID = 1 AND doctorID = 1

-- ԤԼ��Ϣ��ѯ
SELECT appointmentID, t_userInfo.RealName, AppointmentTime FROM t_appointment, t_userInfo 
WHERE t_appointment.userID = t_userInfo.userID AND doctorID = 1

-- ɾ��ԤԼ��Ϣ
DELETE t_appointment 
WHERE appointmentID = 1

-- ����ͼƬ���
INSERT t_onlineInquiry (userID, doctorID, MessageImg, UserType) VALUES ({0}, {1}, '{2}', 1)

-- ��ѯ�ظ�ԤԼ
SELECT * FROM t_appointment WHERE userID = 1
