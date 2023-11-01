<%-- 
    Document   : OrderList
    Created on : Oct 21, 2023, 5:45:27 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/Customer/OrderDetail/style.css">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <c:set var="currentStatus" value="${requestScope.currentStatus}" />
        <input type="hidden" id="currentStatus" name="currentStatus" value="${requestScope.currentStatus}">
        <input type="hidden" id="previousStatus" name="previousStatus" value="${requestScope.previousStatus}">


        <!--                        <input type="hidden" id="currentStatus" name="currentStatus" value="1">
                                <input type="hidden" id="previousStatus" name="previousStatus" value="1">-->
        <main class="d-flex">
            <!-- Sidebar -->
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Bộ phận Quản lý Đơn hàng
                    </a>
                    <ul class="list-unstyled ps-0">
                        <li class="mb-1">
                            <a href="OrderList" class="text-dark nav-link">Danh sách đơn hàng</a>
                        </li>
                        <li class="mb-1 bg-primary rounded p-2">
                            <a href="#" class="text-light nav-link">Thông tin đơn hàng</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container">
                <h1 class="text-center mt-3 mb-3">Thông tin đơn hàng</h1>
                <form id="form"  method="post" action="OrderStatusUpdate" onsubmit="return validateForm()">
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
                                    <li style="width: 25%;" class="" id="inProcessing">
                                        <button class="btn btn-secondary" name="statusButton" value="1" id="btnProcessing">Xác nhận Đã xử lý</button>
                                    </li>
                                    <li style="width: 25%;" class="" id="inPackaging">
                                        <button class="btn btn-secondary" name="statusButton" value="2" id="btnPackaging">Xác nhận đã tiếp nhận</button>
                                    </li>
                                    <li style="width: 25%;" class="" id="inDelivery">
                                        <button class="btn btn-secondary" name="statusButton" value="3" id="btnDelivery">Xác nhận Đang giao</button>
                                    </li>
                                    <li style="width: 25%;" class="" id="complete">
                                        <button class="btn btn-secondary" name="statusButton" value="4" id="btnComplete">Xác nhận Đã giao thành công</button>
                                    </li>
                                    <li style="width: 25%;" class="" id="finalStage">
                                        <button class="btn btn-danger" disabled>Đã hủy</button>
                                    </li>
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
                                                <input type="hidden" name="thumbnailPath" value="${item.getThumbnail()}">
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
                                                <div>
                                                    <img src="${pageContext.request.contextPath}/Images${order.bankingImage}" onclick="showOverlay(this)" style="width: 100px; height: 100px; object-fit: contain">
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
        <script src="${pageContext.request.contextPath}/Views/Admin/OrderList/scripts.js"></script>                                     
    </body>

</html
