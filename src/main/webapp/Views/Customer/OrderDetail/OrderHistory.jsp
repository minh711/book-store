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
        <title>Lịch sử mua hàng</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            .waitting{
                background-color: #fdf5dd;
                color: #cfa00c;
                border-radius: 10px;
                padding: 5px;
            }
            .finish{
                background-color: #cff6dd;
                color: #1fa750;
                border-radius: 10px;
                padding: 5px;
            }
            .terminate{
                background-color:#FFDADA;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="d-flex">
            <jsp:include page="/Views/aside.jsp"/>
            
            <div class="container">
                <div class="container">
                    <h1 class="text-center mt-3">Lịch sử đơn hàng</h1>
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-12">
                            <table id="example" class="table table-bordered text-center mt-3">
                                <thead class="table-danger">
                                <th>ID</th>
                                <th>Họ và tên</th>
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
                                        <td>${order.fullName}</td>
                                        <td class="date">${order.getDate()}</td>
                                        <td class="totals">${order.getSaleTotal()}</td>
                                        <td > <span class=" status"> ${orderDAO.getOrderStatusName(order.getId())} </span></td>
                                        <td class="text-primary"> 
                                            <a href="orderDetailCustomerCtrl?id=${order.getId()}">Chi tiết</a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="/Assets/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
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
                    var statusText = subElement.textContent.trim(); 
                    if (statusText === 'Đã hủy') {
                        subElement.classList.add("terminate");
                    }
                    if (statusText === 'Thành công') {
                        subElement.classList.add("finish"); 
                    }
                    else{
                       subElement.classList.add("waitting");   
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