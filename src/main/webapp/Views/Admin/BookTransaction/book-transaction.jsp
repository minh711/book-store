<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>Sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/BookTransaction/style.css"/>
</head>

<body>
    <header class="d-flex justify-content-between" style="padding: 10px;">
        <div class="d-flex align-items-center justify-content-between">
            <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
        </div>
    </header>

    <main class="bg-light d-flex">
        <aside>
            <div class="flex-shrink-0 p-3" style="width: 280px;">
                <a href="#" class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                    Sample
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <a href="LoginBookStore.jsp" class="text-light nav-link bg-primary rounded p-2">
                            Login
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        
        <div class="container">
            <div>
                <h1>Nhập hàng</h1>
            </div>
            <div class="d-flex">
                <div class="select-distributor-container">
                    <div class="select-btn">
                        <span>Chọn nhà phân phối</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Tìm kiếm...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>
                <div class="mx-2 select-book-container">
                    <div class="select-btn">
                        <span>Chọn Sách</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Nhập mã hoặc tên Sách...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>
            </div>
            <div class="mt-3 col-md-5 d-flex justify-content-between">
                <input name="quantity" type="text" class="form-control" placeholder="Số lượng">
                <input name="total" type="text" class="mx-2 form-control" placeholder="Giá nhập">
                <input type="hidden" name="distributorId" value="">
                <input type="hidden" name="bookId" value="">
                <button class="btn btn-success form-control" onclick="return addNew();">Xác nhận</button>
            </div>
            <hr>
            <div>
                <h1>Lịch sử nhập hàng</h1>
                <table id="historyTable" class="display" style="width: 100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Mã Sách</th>
                            <th>Tên sách</th>
                            <th>Số lượng</th>
                            <th>Giá nhập</th>
                            <th>Ngày nhập</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="history">
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 p-4">
                    <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="" style="height: 40px;">
                    <div>
                        <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                    </div>
                </div>
                <div class="col-md-4 p-4">
                    <div class="d-flex">
                        <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                        <div>
                            business@oceanbook.com
                        </div>
                    </div>
                </div>
                <div class="col-md-2 d-flex justify-content-between p-4">
                    <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-facebook-messenger"></i>
                    <i class="fa-brands fa-youtube"></i>
                </div>
            </div>
        </div>
    </footer>
               
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/Views/BookTransaction/script.js"></script>
</body>

</html