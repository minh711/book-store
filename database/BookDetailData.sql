USE [SWPProject]
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (1, N'NXB Kim Đồng', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (2, N'NXB Lao Động', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (3, N'NXB Hội Nhà Văn', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (4, N'NXB Thế Giới', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (5, N'NXB Trẻ', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (6, N'
Penguin Books Ltd', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (7, N'Profile Books Ltd', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (8, N'NXB Phụ nữ Việt Nam', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (9, N'MCBooks', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (10, N'NXB Dân Trí', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (11, N'NXB Thanh niên', 1)
GO
INSERT [dbo].[Publisher] ([id], [publisher], [isAvailable]) VALUES (12, N'NXB Hà Nội', 1)
GO
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 
GO
INSERT [dbo].[Language] ([id], [language], [isAvailable]) VALUES (1, N'Tiếng Anh', 1)
GO
INSERT [dbo].[Language] ([id], [language], [isAvailable]) VALUES (2, N'Tiếng Việt', 1)
GO
INSERT [dbo].[Language] ([id], [language], [isAvailable]) VALUES (3, N'Tiếng Nhật', 1)
GO
INSERT [dbo].[Language] ([id], [language], [isAvailable]) VALUES (4, N'Tiếng Hàn', 1)
GO
INSERT [dbo].[Language] ([id], [language], [isAvailable]) VALUES (5, N'Tiếng Trung', 1)
GO
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([id], [title], [description], [thumbnail], [salePrice], [price], [discount], [quantity], [soleTotal], [isAvailable], [publisherId], [languageId]) VALUES (1, N'Tôi là Beto', N'Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ thâm trầm, khiến người đọc phải ngẫm nghĩ. Đây chắc chắn là tác phẩm không chỉ dành cho trẻ em.', N'path', 94500, 126000, 15, 1240, 4982, 1, 5, 2)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (1, N'Hồ Anh Thái', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (2, N'Nguyễn Vĩnh Khuyên', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (3, N'Hamlet Trương', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (4, N'Nguyễn Nhật Ánh', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (5, N'Trang Hạ', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (6, N'José Mauro de Vasconcelos', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (7, N'Xuân Diệu', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (8, N'Roise Nguyễn', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (9, N'Nguyễn Phong Việt', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (10, N'Anh Khang', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (11, N'Jordan B. Peterson', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (12, N'Phan Văn Trường', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (13, N'Morgan Housel', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (14, N'Shannon Thomas, LCSW', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (15, N'Trương Manh', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (16, N'Paulo Coelho', 1)
GO
INSERT [dbo].[Author] ([id], [author], [isAvailable]) VALUES (17, N'Andrea Hirata', 1)
GO
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
INSERT [dbo].[BookAuthor] ([bookId], [authorId]) VALUES (1, 4)
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (1, N'Chính trị - Pháp Luật', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (2, N'Lịch sử', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (3, N'Tiểu thuyết', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (4, N'Khoa học - Công nghệ', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (5, N'Giáo trình', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (6, N'Sách thiếu nhi', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (7, N'Văn học - Nghệ thuật', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (8, N'Tâm lý', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (9, N'Sách giáo khoa', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (10, N'Văn hóa - Xã hội', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (11, N'Truyện', 1)
GO
INSERT [dbo].[Genre] ([id], [genre], [isAvailable]) VALUES (12, N'Sách tư duy - Kỹ năng sống', 1)
GO
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
INSERT [dbo].[BookGenre] ([bookId], [genreId]) VALUES (1, 11)
GO
INSERT [dbo].[BookGenre] ([bookId], [genreId]) VALUES (1, 3)
GO
