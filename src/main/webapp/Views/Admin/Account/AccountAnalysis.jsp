<%-- 
    Document   : AccountAnalysis
    Created on : Nov 3, 2023, 1:49:27 AM
    Author     : ASP_REF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <style>
            /*vàng nh?t*/
            .waitting{
                background-color: #fdf5dd;
                color: #cfa00c;
                border-radius: 10px;
                padding: 5px;
            }
            /*xanh nh?t*/
            .finish{
                background-color: #cff6dd;
                color: #1fa750;
                border-radius: 10px;
                padding: 5px;
            }
            /*h?ng nh?t*/
            .terminate{
                background-color:#cafaf4;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
            .mamamia{
                background-color:#cad2fa;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }
            .anime{
                background-color:#e2faca;
                color: #EF4848;
                border-radius: 10px;
                padding: 5px;
            }


        </style>
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

                    <h1 class="text-center mt-3">Danh sách đơn hàng</h1>
                    <div class="row pb-3">

                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light rounded" style=" background: #fa05c9;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 75%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="fa   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2 ><strong id="countAll">0</strong></h2>
                                        <h6>Tất cả</h6>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light rounded" style=" background: #48bbde;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 75%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="fa   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2 ><strong id="countAvailable">0</strong></h2>
                                        <h6>hoạt động</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #d44a43 ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="far   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countUnavailable">0</strong></h2>
                                        <h6>Không hoạt động</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #33B440 ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="fas   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countCustomer">0</strong></h2>
                                        <h6>Khách hàng</h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #f3b61f ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="far   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countBookManager">0</strong></h2>
                                        <h6>Quản lý Sách</h6>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-3 pt-2 pb-2 ">
                            <div class=" card border text-light" style=" background: #ab04cc ;">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <li style="width: 5%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                            <i class="far   text-light" style="font-size: 1.8em;"></i>
                                        </li>
                                    </div>
                                    <div class="text-end">
                                        <h2><strong id="countOrderManager">0</strong></h2>
                                        <h6>Quản lý Đơn</h6>
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
                                <th>Tên đăng nhập</th>
                                <th>Họ và tên</th>
                                <th>Chức vụ</th>
                                <th>Trạng thái</th>
                                <th></th>
                                </thead>

                                <tbody class="align-middle">
                                    <c:forEach var="account" items="${AnalysisList}">
                                        <tr class="text-success ">
                                            <td>${account.id}</td>
                                            <td>${account.username}</td>
                                            <td>${account.fullName}</td>
                                         
                                            <td > <span class=" status"> ${account.roleName} </span></td>
                                            <td > <span class=" status"> ${account.isAvailString} </span></td>

                                            <td class="text-primary"> <a style="text-decoration: none;" href="/Account/Detail?id=${account.id}">Chi tiết</a></td>
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

            var AllValue = 0;
            var ActiveValue = 0;
            var NonActiveValue = 0;
            var CustomerValue = 0;
            var BookManagerValue = 0;
            var OrderManagerValue = 0;
            document.addEventListener("DOMContentLoaded", function () {
                var cancels = document.querySelectorAll(".status");
                cancels.forEach(function (subElement) {
                   
                    var statusText = subElement.textContent.trim();
                    if (statusText === 'Đã xóa') {
                        NonActiveValue++;
                         AllValue++;
                        subElement.classList.add("terminate");
                    } else if (statusText === 'Hoạt động') {
                        ActiveValue++;
                         AllValue++;
                        subElement.classList.add("finish");
                    } else if (statusText === 'Quản lý Sách') {
                        BookManagerValue++;
                        subElement.classList.add("mamamia");
                    } else if (statusText === 'Quản lý Đơn') {
                        OrderManagerValue++;
                        subElement.classList.add("anime");
                    }else {
                        subElement.classList.add("waitting");
                        CustomerValue++;
                    }


                });
                document.getElementById("countAvailable").textContent = ActiveValue.toString();
                document.getElementById("countUnavailable").textContent = NonActiveValue.toString();
                document.getElementById("countCustomer").textContent = CustomerValue.toString();
                document.getElementById("countBookManager").textContent = BookManagerValue.toString();
                document.getElementById("countOrderManager").textContent = OrderManagerValue.toString();
                document.getElementById("countAll").textContent = AllValue.toString();





//                var totals = document.querySelectorAll('.totals');
//                totals.forEach(function (priceElement) {
//                    var price = parseFloat(priceElement.textContent);
//                    if (!isNaN(price)) {
//                        var formattedPrice = price.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
//                        var currencySymbol = '₫';
//                        priceElement.textContent = formattedPrice.replace(currencySymbol, '') + 'đ';
//                    }
//                });
//                var dates = document.querySelectorAll('.date');
//                dates.forEach(function (dateElement) {
//                    var dateText = dateElement.textContent;
//                    var formattedDate = dateText.replace(/\.\d+/g, ''); // Remove the dot and numbers after it
//                    dateElement.textContent = formattedDate;
//                });

            });


        </script>
    </body>

</html>