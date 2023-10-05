USE [SWP_v0]
GO
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (1, N'Đang xử lý')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (2, N'Đã tiếp nhận')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (3, N'Đang giao')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (4, N'Thành công')
INSERT [dbo].[OrderStatus] ([id], [status]) VALUES (5, N'Đã hủy')
GO
INSERT [dbo].[Role] ([id], [role]) VALUES (1, N'Khách hàng')
INSERT [dbo].[Role] ([id], [role]) VALUES (2, N'Quản lý Sách')
INSERT [dbo].[Role] ([id], [role]) VALUES (3, N'Quản lý Đơn')
INSERT [dbo].[Role] ([id], [role]) VALUES (4, N'Admin')
GO
