<%-- 
    Document   : Cart
    Created on : Oct 13, 2023, 7:18:06 PM
    Author     : mummykiara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Locale" %>
<%@page import="java.text.NumberFormat"%>

<%  NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ocean Book</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/Assets/popper.min.js"></script>
        <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>

    <body>
        <header class="d-flex justify-content-between" style="padding: 10px;">

            <div class="d-flex align-items-center justify-content-between" style="width: 30%;">
                <div class="d-flex">
                    <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
                </div>
                <div class="dropdown">
                    <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-solid fa-bars fa-2x p-2"></i>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li>
                            <div class="d-flex" style="height: 300px;">
                                <div class="p-4">
                                    <div class="fs-4 text-nowrap">Danh mục sản phẩm</div>
                                    <hr class="hr">
                                    <div class="bg-light mb-3 rounded p-2">Nhà xuất bản</div>
                                    <div class="mb-3 rounded p-2">Tác giả</div>
                                    <div class="mb-3 rounded p-2">Thể loại</div>
                                    <div>Ngôn ngữ</div>
                                </div>
                                <div class="d-flex p-3">
                                    <div style="width: 280px;">
                                        <div class="mb-3">Nguyễn Nhật Ánh</div>
                                        <div class="mb-3">Xuân Diệu</div>
                                        <div class="mb-3">Hồ Anh Thái</div>
                                        <div class="mb-3">Nguyễn Trương Quý</div>
                                        <div class="mb-3">Nguyễn Vĩnh Khuyên</div>
                                        <div>Trang Hạ</div>
                                    </div>
                                    <div style="width: 300px;">
                                        <div class="mb-3">Nguyễn Phong Việt</div>
                                        <div class="mb-3">Nguyễn Ngọc Thạch</div>
                                        <div class="mb-3">Hamlet Trương</div>
                                        <div class="mb-3">Rosie Nguyễn</div>
                                        <div class="mb-3">Anh Khang</div>
                                        <div class="text-primary">Xem tất cả</div>
                                    </div>
                                </div>
                            </div>
                        <li>
                    </ul>
                </div>
            </div>
            <div class="input-group d-flex align-items-center" style="width: 40%;">
                <input id="search-input" type="search" id="form1" class="form-control" placeholder="Tìm kiếm..." style="height: 40px;"/>
                <button id="search-button" type="button" class="btn btn-primary" style="height: 40px;">
                    <i class="fa fa-search"></i>
                </button>
            </div>

            <div class="d-flex justify-content-between align-items-center" style="width: 30%;">
                <div>
                    <button class="btn btn-success mx-2"><i class="fa fa-shopping-cart mx-2"></i><br>Giỏ hàng</button>
                </div>

                <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <a class="text-dark text-center nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-bell mx-2"></i><br>
                            Thông báo <span class="text-danger">(3)</span>
                        </a>
                        <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                            <li style="width: 400px;" class="p-2">
                                <div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <div><strong>Đánh giá sản phẩm</strong></div>
                                        <div class="text-secondary">11:00 01/01/2023</div>
                                    </div>
                                    <div>Bạn có sản phẩm <strong>Book Title 1</strong> từ đơn hàng <strong>#123456</strong> chưa đánh giá</div>
                                </div>
                            </li>
                            <hr>
                            <li style="width: 400px;" class="p-2">
                                <div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <div><strong>Đánh giá sản phẩm</strong></div>
                                        <div class="text-secondary">11:00 01/01/2023</div>
                                    </div>
                                    <div>Bạn có sản phẩm <strong>Book Title 2</strong> từ đơn hàng <strong>#456789</strong> chưa đánh giá</div>
                                </div>
                            </li>
                            <hr>
                            <li style="width: 400px;" class="p-2">
                                <div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <div><strong>Đã giao thành công</strong></div>
                                        <div class="text-secondary">11:00 01/01/2023</div>
                                    </div>
                                    <div>Đơn hàng <strong>#456789</strong> đã được giao thành công</div>
                                </div>
                            </li>
                            <hr>
                            <li class="p-2">
                                <div class="text-primary">Xem tất cả</div>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Xin chào,<br>Nguyễn Văn A
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

        <main class="bg-light">
            <div class="container">
                <h1 class="text-center mt-3 mb-3">Giỏ hàng</h1>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="col-1 text-center">Chọn mua</th>
                            <th class="col-4 text-center">Sản phẩm</th>
                            <th class="col-2 text-center">Đơn giá</th>
                            <th class="col-2 text-center">Số lượng</th>
                            <th class="col-2 text-center">Số tiền</th>
                            <th class="col-1 text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <c:forEach items="${requestScope.CartList}" var="cart">
                            <tr>
                                <td class="text-center">
                                    <input class="form-check-input" type="checkbox" style="width: 30px; height: 30px;">
                                </td>
                                <td>
                                    <div class="d-flex p-2">
                                        <img
                                            src="${cart.getBookThumbnail()}"
                                            class="rounded" alt="..." style="width: 100px; height: 100px; object-fit: contain;">
                                        <div class="fs-5 mx-2 d-flex align-items-start">
                                            ${cart.getBookTitle()}
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center"><input class="font-weight-medium text-center BookPrice" type="text" style="border: none" readonly value="<fmt:formatNumber type="number" value="${cart.getBookprice()}" pattern="#,###" />"></td>
                                <td>
                                    <div class="d-flex">
                                        <div class="input-group d-flex justify-content-center align-items-center">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-minus" >
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <div class="mx-2"> 
                                                <input type="text" class="form-control mx-3 text-center BookQuantity" style="width: 50px;" value="${cart.getBookquantity()}">
                                            </div>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                <td class="text-center"><input class="font-weight-medium text-center totalEachProduct" type="text" style="border: none" readonly></td>
                                <td class="text-center"><i class="fa fa-remove"></i></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="bg-light p-4 mt-3 mb-3 d-flex justify-content-between align-items-center">
                    <div class="d-flex">
                        <div class="text-primary">Chọn tất cả (${cart.getBookquantity()})</div>
                        <div class="mx-3 text-primary">Bỏ chọn tất cả</div>
                    </div>
                    <div class="d-flex">
                        <div class="p-2 mx-2 text-dark" id="TotalCart">Tổng cộng: </div>
                        <div> <button class="btn btn-danger p-2">Mua hàng</button></div>
                    </div>
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
        <script>
            //Function calculates values and updates totals for each product
            function calculateTotalForProduct() {
                $('.BookPrice').each(function (index) {
                    
                    var price = parseFloat($(this).val().replace(/[^0-9.-]+/g, ''));
                    var quantity = parseInt($(this).closest('tr').find('.BookQuantity').val());
                    
                    var total = price * quantity;

                    //Format numbers
                    var formatTotalPrice = total.toLocaleString('en-US');

                    // Update the value for the "totalEachProduct" input tag.
                    $(this).closest('tr').find('.totalEachProduct').val(formatTotalPrice);
                });
            }

            // Call a calculation function when a webpage loads
            $(document).ready(function () {
                calculateTotalForProduct();

                //When the number of products changes, the value will be recalculated.
                $('.BookQuantity').on('input', function () {
                    calculateTotalForProduct();
                });
            });

        </script>

    </body>
</html>
