<%-- 
    Document   : OrderDetail
    Created on : Oct 11, 2023, 8:36:28 AM
    Author     : hienHT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <jsp:include page="/Views/head.jsp"/>
        <link rel="stylesheet" href="/Views/Customer/OrderDetail/style.css">
        <style>
            #overlay {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 2;
                cursor: pointer;
            }

            #overlay img {
                display: block;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                max-width: 90%;
                max-height: 90%;
            }
        </style>
    </head>

    <body>
        <div id="overlay" onclick="off()">
            <img id="overlay-image" src="" alt="Clicked Image">
        </div>
        <header class="d-flex justify-content-between" style="padding: 10px;">
            <div class="d-flex align-items-center justify-content-between" style="width: 30%;">
                <div class="d-flex">
                    <img src="/image/logo.png" style="height: 40px;">
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
        <c:set var="currentStatus" value="${requestScope.currentStatus}" />
        <input type="hidden" id="currentStatus" name="currentStatus" value="${requestScope.currentStatus}">
        <input type="hidden" id="previousStatus" name="previousStatus" value="${requestScope.previousStatus}">
        <!--        
                        <input type="hidden" id="currentStatus" name="currentStatus" value="5">
                        <input type="hidden" id="previousStatus" name="previousStatus" value="3">-->
        <main class="d-flex">

            <div class="container">
                <h1 class="text-center mt-3 mb-3">Thông tin đơn hàng</h1>
                <form id="form"  method="post" action="orderDetailCustomerCtrl" onsubmit="return validateForm()">
                    <input type="hidden" id="orderID" name="OrderID" value="${requestScope.OrderID}">

                    <div class="border">
                        <div class="text-success text-center fs-5 mt-3 mb-3" id="currentStatusName">Trạng thái: ${requestScope.currentStatusName}</div>
                        <div class="d-flex justify-content-center">
                            <button  id="changeStatusButton" class="btn btn-danger mx-4 mb-3"  name="statusButton" value="5">Hủy đơn hàng</button>
                        </div>
                        <div class="d-flex mb-3 align-items-start" style="height: 200px;">
                            <div class="col-12">
                                <ul class="d-flex justify-content-between">
                                    <li style="width: 25%;" class="fs-1 text-secondary list-unstyled text-center inProcessing"  >
                                        <i class="fa fa-user-clock"></i>
                                    </li>
                                    <li style="width: 25%;" class="fs-1 text-secondary list-unstyled text-center inPackaging">
                                        <i class="fa  fa-box"></i>
                                    </li>                                                               
                                    <li style="width: 25%;" class="fs-1 text-secondary  list-unstyled text-center inDelivery">
                                        <i class="fa fa-truck"></i>
                                    </li>
                                    <li style="width: 25%;" class="fs-1 text-secondary list-unstyled text-center complete">
                                        <i class="fa-regular fa-handshake"></i>
                                    </li>
                                    <li style="width: 25%;" class="fs-1 text-danger list-unstyled text-center finalStage">
                                        <i class="fa fa-times-circle"></i>
                                    </li>
                                </ul>
                                <ul class="progressbar">
                                    <li  style="width: 25%;"  class="" id="inProcessing">Đang xử lý</li>
                                    <li  style="width: 25%;" class="" id="inPackaging">Đã tiếp nhận</li>
                                    <li  style="width: 25%;" class="" id="inDelivery">Đang giao</li>
                                    <li  style="width: 25%;" class="" id="complete">Đã giao thành công</li>
                                    <li  style="width: 25%;" class="" id="finalStage">Đã hủy</li>

                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <table class="table table-bordered">
                            <thead class="table-primary">
                                <tr>
                                    <th class="col-4 text-center">Sản phẩm</th>
                                    <th class="col-2 text-center">Đơn giá</th>
                                    <th class="col-2 text-center">Số lượng</th>
                                    <th class="col-2 text-center">Số tiền</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">
                                <c:forEach items="${requestScope.OrderItems}" var="item">
                                    <tr>

                                        <td>
                                            <div class="d-flex p-2">
                                                <img                                                 
                                                      src="${pageContext.request.contextPath}/Images/${item.getThumbnail()}"
                                                    class="rounded" alt="..." style="width: 100px; height: 100px; object-fit: contain;">
                                               
                                                <div class="fs-5 mx-2 d-flex align-items-start">
                                                    ${item.getTittle()}
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center price">${item.getSalePrice()}</td>
                                        <td class="text-center quantity">${item.getQuantity()}</td>  
                                        <td class="text-center subtotal">${item.getSalePrice()* item.getQuantity()}</td>


                                    </tr>
                                </c:forEach>                        </tbody>
                        </table>
                        <c:set var="order" value="${requestScope.Order}" />

                        <div class="card p-3">
                            <div class="row">
                                 <div class="col-md-7">
                                    <div class="row mt-3">
                                        <div class="col-6 ">
                                            <input type="text" class="form-control bg-white" placeholder="Họ và tên" value="${order.getFullName()}" disabled>
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="form-control bg-white" placeholder="Số điện thoại" value="${order.getPhone()}" disabled>
                                        </div>
                                    </div>
                                    <div class="mt-3 d-flex bg-white rounded p-3 justify-content-between border">
                                        <div>
                                            <div>${order.getAddress()}</div>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <textarea class="form-control bg-white" style="resize: none;" rows="3" disabled>${order.getNote()}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <input type="hidden" id="paymentMethod" name="paymentMethod" value="${order.isIsBanking()}">
                                    <div class="bankingDetails" id="bankingDetails">
                                        <div class="card mt-3">
                                            <div class="card-body">
                                                <h5 class="card-title">Thanh toán chuyển khoản</h5>
                                                <div>Số tiền</div>
                                                <h3 class="text-danger"><strong class="total">${order.getSaleTotal()}</strong></h3>
                                                <label class="mb-2">Ảnh chụp màn hình chuyển khoản</label><br>
                                                <div class="card-body">

                                                    <img id="paymentImage" src="${pageContext.request.contextPath}/Images${order.bankingImage}" onclick="showOverlay(this)" style="width: 100px; height: 100px; object-fit: contain">

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="CodDetails" id="CodDetails">
                                        <div class="card mt-3">
                                            <div class="card-body">
                                                <h5 class="card-title">Thanh toán khi nhận hàng</h5>
                                                <div>Số tiền</div>
                                                <h3 class="text-danger"><strong class="total">${order.getSaleTotal()}</strong></h3>

                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
        <jsp:include page="/Views/foot.jsp"/>
        <script>
            function showOverlay(img) {
                const overlay = document.getElementById("overlay");
                const overlayImage = document.getElementById("overlay-image");

                overlayImage.src = img.src;
                overlayImage.alt = img.alt;
                overlay.style.display = "block";
            }

            function off() {
                document.getElementById("overlay").style.display = "none";
            }
        </script>                                        
        <script src="/Views/Customer/OrderDetail/scripts.js"></script>                    
    </body>

</html