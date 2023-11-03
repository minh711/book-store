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
        <jsp:include page="/Views/head.jsp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/orderDetailCustomer/style.css">
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

        <main class="bg-light d-flex">
           <jsp:include page="/Views/aside.jsp"/>
           
            <div class="container">
                <div class="container">

                    <h1 class="text-center mt-3">Danh sách đơn hàng</h1>
                    <div class="row pb-3">
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light rounded" style=" background: #48bbde;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 75%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="fa fa-scroll text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2 ><strong id="countOrder">0</strong></h2>
                                        <h6>Đơn Hàng</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #33B440 ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="fas fa-handshake text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countSuccess">0</strong></h2>
                                        <h6>Thành Công</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #f3b61f ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="far fa-clock text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countProcessing">0</strong></h2>
                                        <h6>Đang Thực Hiện</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #d44a43 ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="far fa-times-circle text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countCancel">0</strong></h2>
                                        <h6>Đã Hủy</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-12">
                            <table id="example" class="table table-bordered  strip text-center mt-3  pt-2 ">
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
                                        <tr class="text-success ">
                                            <td>${order.getId()}</td>
                                            <td>${order.getCustomerId()}</td>
                                            <td class="date">${order.getDate()}</td>
                                            <td class="totals">${order.getSaleTotal()}</td>
                                            <td > <span class=" status"> ${orderDAO.getOrderStatusName(order.getId())} </span></td>
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

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
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

            var OrderValue = 0;
            var SuccessValue = 0;
            var ProcessValue = 0;
            var CancelValue = 0;
            document.addEventListener("DOMContentLoaded", function () {
                var cancels = document.querySelectorAll(".status");
                cancels.forEach(function (subElement) {
                    OrderValue++;
                    var statusText = subElement.textContent.trim();
                    if (statusText === 'Đã hủy') {
                        CancelValue++;
                        subElement.classList.add("terminate");
                    } else if (statusText === 'Thành công') {
                        SuccessValue++;
                        subElement.classList.add("finish");
                    } else {
                        subElement.classList.add("waitting");
                        ProcessValue++;
                    }


                });
                document.getElementById("countOrder").textContent = OrderValue.toString();
                document.getElementById("countSuccess").textContent = SuccessValue.toString();
                document.getElementById("countProcessing").textContent = ProcessValue.toString();
                document.getElementById("countCancel").textContent = CancelValue.toString();

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