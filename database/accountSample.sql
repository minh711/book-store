USE [swp]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [fullName], [phone], [email], [gender], [birthday], [username], [password], [otp], [isAvailable], [roleId]) VALUES (26, N'apple', N'0983274324', N'sdfasd@gmail.com', N'Nữ', CAST(N'2023-10-20' AS Date), N'tao', N'sdfc!@AS12', NULL, 1, 2)
INSERT [dbo].[Account] ([id], [fullName], [phone], [email], [gender], [birthday], [username], [password], [otp], [isAvailable], [roleId]) VALUES (27, N'plum', N'0934723434', N'good9@gmail.com', N'Nam', CAST(N'2023-10-26' AS Date), N'man', N'sdfc!@AS12', NULL, 1, 2)
INSERT [dbo].[Account] ([id], [fullName], [phone], [email], [gender], [birthday], [username], [password], [otp], [isAvailable], [roleId]) VALUES (28, N'mango', N'0932948233', N'hellow@gmail.com', N'Nam', CAST(N'2023-10-27' AS Date), N'xoai', N'Hello!32World!', NULL, 1, 3)
INSERT [dbo].[Account] ([id], [fullName], [phone], [email], [gender], [birthday], [username], [password], [otp], [isAvailable], [roleId]) VALUES (29, N'lemon', N'0702813601', N'example@gmail.vn', N'Nam', CAST(N'2023-10-27' AS Date), N'chanh', N'Hello!32World!', NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
