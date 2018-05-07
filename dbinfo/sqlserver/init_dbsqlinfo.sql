-- createdb
CREATE DATABASE [app_demo]
	ON (NAME = N'app_demo_Data', FILENAME = N'F:\study_info\dbdata\app_demo_Data.MDF', SIZE = 3072KB, MAXSIZE = UNLIMITED , FILEGROWTH = 10%)
	LOG ON (NAME = N'app_demo_Log', FILENAME = N'F:\study_info\dbdata\app_demo_Log.LDF', SIZE = 1024KB, MAXSIZE = UNLIMITED , FILEGROWTH = 10%)
	COLLATE Chinese_PRC_CI_AS
GO

-- sys.right
CREATE TABLE [app_demo].[dbo].[sys_right]  ( 
	[right_code]       	varchar(50) NOT NULL,
	[right_parent_code]	varchar(50) NULL,
	[right_type]       	varchar(20) NULL,
	[right_text]       	varchar(50) NULL,
	[right_url]        	varchar(100) NULL,
	[right_tip]        	varchar(50) NULL,
	CONSTRAINT [PK_sys_right] PRIMARY KEY CLUSTERED([right_code])
)
GO

-- initdata
insert into [app_demo].[dbo].[sys_right] (right_code,right_parent_code,right_type,right_text,right_url,right_tip) values
('L01','ROOT_MENU','Folder','权限管理','','权限管理'),
('L0101','L01','Folder','用户管理','','用户管理'),
('L010101','L0101','Document','添加用户','user.do?o=toAdd','添加用户'),
('L010102','L0101','Document','查询用户','user.do?o=toList','查询用户'),
('L0102','L01','Folder','角色管理','','角色管理'),
('L010201','L0102','Document','添加角色','role.do?o=toAdd','添加角色'),
('L010202','L0102','Document','查询角色','role.do?o=toList','查询角色')
go

CREATE TABLE [app_demo].[dbo].[sys_role]  ( 
	[role_id]  	bigint IDENTITY(1,1) NOT NULL,
	[role_name]	nvarchar(50) NOT NULL,
	[role_desc]	nvarchar(50) NULL,
	[role_flag]	int NULL,
	CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED([role_id])
)
GO

insert into [app_demo].[dbo].[sys_role] (role_name,role_desc,role_flag) values
('管理员','系统所有者',1),
('金牌会员','A',1)
go

CREATE TABLE [app_demo].[dbo].[sys_role_right]  ( 
	[rf_id]        	bigint IDENTITY(1,1) NOT NULL,
	[rf_role_id]   	bigint NOT NULL,
	[rf_right_code]	varchar(50) NOT NULL,
	CONSTRAINT [PK_RoleRight] PRIMARY KEY CLUSTERED([rf_id])
)
GO
ALTER TABLE [app_demo].[dbo].[sys_role_right]
	ADD CONSTRAINT [FK_sys_role_right_sys_role]
	FOREIGN KEY([rf_role_id])
	REFERENCES [dbo].[sys_role]([role_id])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE [app_demo].[dbo].[sys_role_right]
	ADD CONSTRAINT [FK_sys_role_right_sys_right]
	FOREIGN KEY([rf_right_code])
	REFERENCES [dbo].[sys_right]([right_code])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO

insert into [app_demo].[dbo].[sys_role_right] (rf_role_id,rf_right_code) values
(1,'L01'),
(1,'L0101'),
(1,'L010101'),
(1,'L010102'),
(1,'L0102'),
(1,'L010201'),
(1,'L010202'),
(2,'L01'),
(2,'L0101')
go

CREATE TABLE [app_demo].[dbo].[sys_user]  ( 
	[usr_id]      	bigint IDENTITY(1,1) NOT NULL,
	[usr_name]    	nvarchar(50) NOT NULL,
	[usr_password]	nvarchar(50) NOT NULL,
	[usr_flag]    	int NOT NULL,
	[usr_role_id] 	bigint NOT NULL,
	CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED([usr_id])
)
GO
ALTER TABLE [app_demo].[dbo].[sys_user]
	ADD CONSTRAINT [FK_sys_user_sys_user]
	FOREIGN KEY([usr_id])
	REFERENCES [dbo].[sys_user]([usr_id])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO

insert into [app_demo].[dbo].[sys_user] (usr_name,usr_password,usr_flag,usr_role_id) values
('admin','admin',1,1)
go

CREATE TABLE [app_demo].[dbo].[sys_user_role]  ( 
	[ur_id]     	bigint IDENTITY(1,1) NOT NULL,
	[ur_user_id]	bigint NULL,
	[ur_role_id]	bigint NULL,
	CONSTRAINT [PK_sys_user_role] PRIMARY KEY CLUSTERED([ur_id])
)
GO
ALTER TABLE [app_demo].[dbo].[sys_user_role]
	ADD CONSTRAINT [FK_sys_user_role_sys_user]
	FOREIGN KEY([ur_user_id])
	REFERENCES [dbo].[sys_user]([usr_id])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE [app_demo].[dbo].[sys_user_role]
	ADD CONSTRAINT [FK_sys_user_role_sys_role]
	FOREIGN KEY([ur_role_id])
	REFERENCES [dbo].[sys_role]([role_id])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO


insert into [app_demo].[dbo].[sys_user_role] (ur_user_id,ur_role_id) values
(1,1)
go
