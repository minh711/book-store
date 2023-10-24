<%-- 
    Document   : orderListCustomer
    Created on : Oct 17, 2023, 9:51:11 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/orderDetailCustomer/style.css">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">

        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    </head>

    <body>
        <header class="d-flex justify-content-between" style="padding: 10px;">
            <div class="d-flex align-items-center justify-content-between">
                <img src="/image/logo.png" style="height: 40px;">
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <a class="text-dark text-center nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-bell mx-2"></i><br>
                        Thông báo <span class="text-danger">(3)</span>
                    </a>
                    <div class="dropdown">
                        <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Xin chào,<br>Nguyễn Văn B
                        </a>
                        <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item p-2" href="#">Đơn hàng</a></li>
                            <li><a class="dropdown-item p-2" href="#">Thông tin tài khoản</a></li>
                            <li><a class="dropdown-item p-2" href="#">Đăng xuất <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <main class="d-flex">
            <!-- Sidebar -->
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Bộ phận Quản lý Đơn hàng
                    </a>
                    <ul class="list-unstyled ps-0">
                        <li class="mb-1 rounded bg-primary">
                            <a href="OrderList" class="text-light nav-link">Danh sách đơn hàng</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container">
                <div class="container">
                    <h1 class="text-center mt-3">Lịch sử đơn hàng</h1>
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-12">
                            <table id="example" class="table table-bordered text-center mt-3 table-striped pt-2 ">
                                <thead class="table-primary">
                                <th>ID</th>
                                <th>ID khách hàng</th>
                                <th>Ngày đặt</th>
                                <th>Tổng cộng</th>
                                <th>Trạng thái</th>
                                <th></th>
                                </thead>
                                 <c:set var="orderDAO" value="${requestScope.orderDAO}" />
                                <tbody class="align-middle">
                                    <c:forEach items="${requestScope.orders}" var="order">
                                    <tr class="text-success">
                                        <td>${order.getId()}</td>
                                        <td>${order.getCustomerId()}</td>
                                        <td class="date">${order.getDate()}</td>
                                        <td class="totals">${order.getSaleTotal()}</td>
                                        <td class="status">${orderDAO.getOrderStatusName(order.getId())}</td>
                                        <td class="text-primary"> 
                                            <a href="OrderStatusUpdate?id=${order.getId()}">Chi tiết</a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-4">
                        <img src="/image/logo.png" alt="" style="height: 40px;">
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

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "language": {
                        "search": "Bộ lọc",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        },
                        "info": "Hiển thị _START_ - _END_ trên _TOTAL_ kết quả",
                        "infoEmpty": "Hiển thị 0 - 0 trên 0 kết quả",
                        "lengthMenu": "Hiển thị _MENU_ kết quả",
                        "emptyTable": "Không có dữ liệu",
                        "zeroRecords": "Không tìm thấy"
                    }
                });
            });
        </script>
       <script>
    document.addEventListener("DOMContentLoaded", function () {
        var cancels = document.querySelectorAll(".status");
        cancels.forEach(function (subElement) {
            var statusText = subElement.textContent.trim(); // Trim any leading/trailing spaces
            if (statusText === 'Đã hủy') {
                subElement.classList.add("text-danger"); // Use 'classList' instead of 'ClassList'
            }
            if (statusText === 'Thành công') {
                subElement.classList.add("text-success"); // Use 'classList' instead of 'ClassList'
            }
        });
        
        var totals = document.querySelectorAll('.totals');
         totals.forEach(function (priceElement) {
                var price = parseFloat(priceElement.textContent);
                if (!isNaN(price)) {
                    var formattedPrice = price.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                    var currencySymbol = '₫';
                    priceElement.textContent = formattedPrice.replace(currencySymbol, '') + 'đ';
                }
            });
       var dates = document.querySelectorAll('.date');
dates.forEach(function (dateElement) {
    var dateText = dateElement.textContent;
    var formattedDate = dateText.replace(/\.\d+/g, ''); // Remove the dot and numbers after it
    dateElement.textContent = formattedDate;
});

    });
</script>
    </body>

</html>