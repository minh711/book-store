CREATE TABLE Publisher (
    id INT IDENTITY(1,1) PRIMARY KEY,
    publisher NVARCHAR(100) NOT NULL,
    isAvailable BIT NOT NULL
)

CREATE TABLE [Language] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    language NVARCHAR(100) NOT NULL,
    isAvailable BIT NOT NULL
)

CREATE TABLE Book (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100) NOT NULL,
    [description] NVARCHAR(2000) NOT NULL,
    thumbnail VARCHAR(100) NOT NULL,
    salePrice INT NOT NULL,
    price INT NOT NULL,
    discount INT NOT NULL,
    quantity INT NOT NULL,
    soleTotal INT NOT NULL,
    isAvailable BIT NOT NULL,
    publisherId INT FOREIGN KEY REFERENCES Publisher(id),
    languageId INT FOREIGN KEY REFERENCES [Language](id)
)

CREATE TABLE BookPicture (
    id INT IDENTITY(1,1) PRIMARY KEY,
    picture VARCHAR(100) NOT NULL,
    bookId INT FOREIGN KEY REFERENCES Book(id)
)
    
CREATE TABLE Author (
    id INT IDENTITY(1,1) PRIMARY KEY,
    author NVARCHAR(100) NOT NULL,
    isAvailable BIT NOT NULL
)

CREATE TABLE BookAuthor (
    bookId INT FOREIGN KEY REFERENCES Book(id),
    authorId INT FOREIGN KEY REFERENCES Author(id)
)

CREATE TABLE Genre (
    id INT IDENTITY(1,1) PRIMARY KEY,
    genre NVARCHAR(100) NOT NULL,
    isAvailable BIT NOT NULL
)
    
CREATE TABLE BookGenre (
    bookId INT FOREIGN KEY REFERENCES Book(id),
    genreId INT FOREIGN KEY REFERENCES Genre(id)
)

CREATE TABLE Role (
    id INT IDENTITY(1,1) PRIMARY KEY,
    role NVARCHAR(50) NOT NULL
) 
    
CREATE TABLE Account (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fullName NVARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender NVARCHAR(5) NOT NULL,
    birthday DATE NOT NULL,
    username VARChAR(50) NOT NULL,
    [password] VARChAR(32) NOT NULL,
    otp VARCHAR(6),
    isAvailable BIT NOT NULL,
    roleId INT FOREIGN KEY REFERENCES [Role](id)
)

CREATE TABLE Address (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fullName NVARCHAR(100) NOT NULL,
    phone VARCHAR(11),
    [address] NVARCHAR(500) NOT NULL,
    customerId INT FOREIGN KEY REFERENCES Account(id)
)

CREATE TABLE NotificationType (
    id INT IDENTITY(1,1) PRIMARY KEY,
    [type] NVARCHAR(50) NOT NULL
)
    
CREATE TABLE Notification (
    id INT IDENTITY(1,1) PRIMARY KEY,
    notification NVARCHAR(1000) NOT NULL,
    isViewed BIT NOT NULL,
    notificationTypeId INT FOREIGN KEY REFERENCES NotificationType(id)
)
    
CREATE TABLE Rating (
    id INT IDENTITY(1,1) PRIMARY KEY,
    star INT NOT NULL,
    comment NVARCHAR(500),
    customerId INT FOREIGN KEY REFERENCES Account(id)
)

CREATE TABLE Distributor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    distributor NVARCHAR(100) NOT NULL,
    isAvailable BIT NOT NULL
)
    
CREATE TABLE BookTransaction (
    bookId INT FOREIGN KEY REFERENCES Book(id),
    distributorId INT FOREIGN KEY REFERENCES Distributor(id),
    executorId INT FOREIGN KEY REFERENCES Account(id),
    quantity INT NOT NULL,
    [date] DATETIME NOT NULL
)

CREATE TABLE Cart (
    id INT IDENTITY(1,1) PRIMARY KEY,
    quantity INT NOT NULL,
    bookId INT FOREIGN KEY REFERENCES Book(id),
    customerId INT FOREIGN KEY REFERENCES Account(id)
)

CREATE TABLE [Order] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    saleTotal INT NOT NULL,
    total INT NOT NULL,
    fullName NVARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    [address] NVARCHAR(500) NOT NULL,
    isBanking BIT NOT NULL,
    bankingImage VARCHAR(100),
    note NVARCHAR(500),
    [date] DATETIME NOT NULL,
    customerId INT FOREIGN KEY REFERENCES Account(id)
)

CREATE TABLE OrderStatus (
    id INT IDENTITY(1,1) PRIMARY KEY,
    status NVARCHAR(50) NOT NULL
)
    
CREATE TABLE OrderStatusDetail (
    id INT IDENTITY(1,1) PRIMARY KEY,
    [date] DATETIME NOT NULL,
    orderId INT FOREIGN KEY REFERENCES [Order](id),
    orderStatusId INT FOREIGN KEY REFERENCES OrderStatus(id)
)

CREATE TABLE OrderDetail (
    orderId INT FOREIGN KEY REFERENCES [Order](id),
    bookId INT FOREIGN KEY REFERENCES Book(id),
    quantity INT NOT NULL,
    salePrice INT NOT NULL,
    price INT NOT NULL
)
