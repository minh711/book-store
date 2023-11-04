<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>Sample</title>
    <jsp:include page="/Views/head.jsp"/>
    <link rel="stylesheet" href="/Assets/DataTables-1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/Admin/BookTransaction/style.css"/>
</head>

<body>
    <jsp:include page="/Views/header.jsp"/>

    <main class="bg-light d-flex">
        <jsp:include page="/Views/aside.jsp"/>
        
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
                            <th>Người phụ trách</th>
                            <th>Nhà phân phối</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="history">
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    
    <jsp:include page="/Views/footer.jsp"/>
    
    <jsp:include page="/Views/foot.jsp"/>
    <script src="/Assets/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="/Views/Admin/BookTransaction/script.js"></script>
</body>

</html