SET IDENTITY_INSERT [OrderStatus] ON;
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (1, N'Đang xử lý')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (2, N'Đã tiếp nhận')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (3, N'Đang giao')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (4, N'Thành công')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (5, N'Đã hủy')
SET IDENTITY_INSERT [OrderStatus] OFF;
GO
SET IDENTITY_INSERT [Role] ON;
INSERT [dbo].[Role] ([id], [role]) VALUES (1, N'Khách hàng')
INSERT [dbo].[Role] ([id], [role]) VALUES (2, N'Quản lý Sách')
INSERT [dbo].[Role] ([id], [role]) VALUES (3, N'Quản lý Đơn')
INSERT [dbo].[Role] ([id], [role]) VALUES (4, N'Admin')
SET IDENTITY_INSERT [Role] OFF;
GO
