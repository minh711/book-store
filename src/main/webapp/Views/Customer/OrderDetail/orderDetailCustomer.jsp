<%-- 
    Document   : orderDetailCustomer
    Created on : Oct 11, 2023, 8:36:28 AM
    Author     : hienHT
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
            .bankingDetails {
                display: none;
            }
            .CodDetails {
                display: block;
            }

        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>
        
        <c:set var="currentStatus" value="${requestScope.currentStatus}" />
        <input type="hidden" id="currentStatus" name="currentStatus" value="${requestScope.currentStatus}">
        <input type="hidden" id="previousStatus" name="previousStatus" value="${requestScope.previousStatus}">
        <!--        <input type="hidden" id="currentStatus" name="currentStatus" value="5">
                <input type="hidden" id="previousStatus" name="previousStatus" value="1">-->
        <main class="bg-light">
            <div class="container">
                <h1 class="text-center mt-3 mb-3">Thông tin đơn hàng</h1>
                <form id="form"  method="post" action="orderDetailCustomerCtrl" onsubmit="return validateForm()">
                    <div class="border">
                        <div class="text-success text-center fs-5 mt-3 mb-3" id="currentStatusName">Trạng thái: ${requestScope.currentStatusName}</div>
                        <div class="d-flex justify-content-center">
                            <button  id="changeStatusButton" class="btn btn-danger mx-4 mb-3">Hủy đơn hàng</button>
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
                                    <li style="width: 25%;" class="fs-1 text-secondary list-unstyled text-center finalStage">
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
                            <thead>
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
                                                    src="${item.getThumbnail()}"
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
                                        <div class="col-6">
                                            <input type="text" class="form-control" placeholder="Họ và tên" value="${order.getFullName()}" readonly>
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="form-control" placeholder="Số điện thoại" value="${order.getPhone()}" readonly>
                                        </div>
                                    </div>
                                    <div class="mt-3 d-flex bg-light rounded p-3 justify-content-between">
                                        <div>
                                            <div>${order.getAddress()}</div>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <textarea class="form-control" style="resize: none;" rows="3" readonly>${order.getNote()}</textarea>
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
                                                <img src="${order.getBankingImage()}" style="width: 100px; height: 100px; object-fit: contain">
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
        
        <script>
            document.addEventListener("DOMContentLoaded", function () {

                // Get the currentStatus value from your database or JSP scriptlet.
                const currentStatus = document.getElementById("currentStatus").value;
                // Define the progress step elements.
                const inProcessing = document.querySelector(".inProcessing");
                const inPackaging = document.querySelector(".inPackaging");
                const inDelivery = document.querySelector(".inDelivery");
                const complete = document.querySelector(".complete");
                const finalStage = document.querySelector(".finalStage");
                //define the progress step in progress bar
                const processingStep = document.getElementById("inProcessing");
                const packagingStep = document.getElementById("inPackaging");
                const deliveryStep = document.getElementById("inDelivery");
                const completeStep = document.getElementById("complete");
                const finalStep = document.getElementById("finalStage");
                const previousStatus = document.getElementById("previousStatus").value;
                console.log("Previous Status: " + previousStatus);
                console.log("current Status: " + currentStatus);
                // Function to update progress based on currentStatus.

                function cleanStatus() {
                    inProcessing.style.display = "none";
                    inPackaging.style.display = "none";
                    inDelivery.style.display = "none";
                    complete.style.display = "none";
                    finalStage.style.display = "none";
                    processingStep.style.display = "none";
                    packagingStep.style.display = "none";
                    deliveryStep.style.display = "none";
                    completeStep.style.display = "none";
                    finalStep.style.display = "none";
                }

                function updateProgress() {

                    if (currentStatus === "1") {
                        cleanStatus();
                        inProcessing.style.display = "block";
                        inPackaging.style.display = "block";
                        inDelivery.style.display = "block";
                        processingStep.style.display = "block";
                        packagingStep.style.display = "block";
                        deliveryStep.style.display = "block";
                        complete.style.display = "block";
                        completeStep.style.display = "block";
                        processingStep.classList.add("active");

                        inProcessing.classList.remove("text-secondary");
                        inProcessing.classList.add("text-success");
                    } else if (currentStatus === "2") {
                        cleanStatus();
                        inProcessing.style.display = "block";
                        inPackaging.style.display = "block";
                        inDelivery.style.display = "block";
                        processingStep.style.display = "block";
                        packagingStep.style.display = "block";
                        deliveryStep.style.display = "block";
                        complete.style.display = "block";
                        completeStep.style.display = "block";
                        processingStep.classList.add("active");
                        packagingStep.classList.add("active");

                        inProcessing.classList.remove("text-secondary");
                        inProcessing.classList.add("text-success");
                        inPackaging.classList.remove("text-secondary");
                        inPackaging.classList.add("text-success");
                    } else if (currentStatus === "3") {
                        cleanStatus();
                        inProcessing.style.display = "block";
                        inPackaging.style.display = "block";
                        inDelivery.style.display = "block";
                        processingStep.style.display = "block";
                        packagingStep.style.display = "block";
                        deliveryStep.style.display = "block";
                        complete.style.display = "block";
                        completeStep.style.display = "block";
                        processingStep.classList.add("active");
                        packagingStep.classList.add("active");
                        deliveryStep.classList.add("active");

                        inProcessing.classList.remove("text-secondary");
                        inProcessing.classList.add("text-success");
                        inPackaging.classList.remove("text-secondary");
                        inPackaging.classList.add("text-success");
                        inDelivery.classList.remove("text-secondary");
                        inDelivery.classList.add("text-success");
                    } else if (currentStatus === "4") {
                        console.log("da toi day");
                        cleanStatus();
                        //the below line does not work
                        inProcessing.style.display = "block";
                        processingStep.style.display = "block";
                        processingStep.classList.add("active");
                        inPackaging.style.display = "block";
                        packagingStep.style.display = "block";
                        packagingStep.classList.add("active");
                        inDelivery.style.display = "block";
                        deliveryStep.style.display = "block";
                        deliveryStep.classList.add("active");
                        complete.style.display = "block";
                        completeStep.style.display = "block";
                        completeStep.classList.add("active");

                        inProcessing.classList.remove("text-secondary");
                        inProcessing.classList.add("text-success");
                        inPackaging.classList.remove("text-secondary");
                        inPackaging.classList.add("text-success");
                        inDelivery.classList.remove("text-secondary");
                        inDelivery.classList.add("text-success");
                        complete.classList.remove("text-secondary");
                        complete.classList.add("text-success");


                    } else if (currentStatus === "5") {
                        if (previousStatus === "1") {
                            cleanStatus();
                            inProcessing.style.display = "block";
                            processingStep.style.display = "block";
                            processingStep.classList.add("active");
                            finalStage.style.display = "block";
                            finalStep.style.display = "block";
                            finalStep.classList.add("error");
                            inPackaging.style.display = "block";
                            packagingStep.style.display = "block";
                            packagingStep.classList.add("error");
                            inDelivery.style.display = "block";
                            deliveryStep.style.display = "block";
                            deliveryStep.classList.add("error")
                            inProcessing.classList.remove("text-secondary");
                            inProcessing.classList.add("text-success");
                        } else if (previousStatus === "3") {
                            cleanStatus();
                            inProcessing.style.display = "block";
                            processingStep.style.display = "block";
                            processingStep.classList.add("active");
                            inPackaging.style.display = "block";
                            packagingStep.style.display = "block";
                            packagingStep.classList.add("active");
                            inDelivery.style.display = "block";
                            deliveryStep.style.display = "block";
                            deliveryStep.classList.add("active");
                            finalStage.style.display = "block";
                            finalStep.style.display = "block";
                            finalStep.classList.add("error");

                            inProcessing.classList.remove("text-secondary");
                            inProcessing.classList.add("text-success");
                            inPackaging.classList.remove("text-secondary");
                            inPackaging.classList.add("text-success");
                            inDelivery.classList.remove("text-secondary");
                            inDelivery.classList.add("text-success");

                        }
                    }
                }

                updateProgress();
                const priceElements = document.querySelectorAll(".price");
                const subtotalElements = document.querySelectorAll(".subtotal");
                const totalElements = document.querySelectorAll(".total");
                const formatter = new Intl.NumberFormat("en-US", {
                    style: "currency",
                    currency: "VND",
                });
                priceElements.forEach(function (element) {
                    const value = parseFloat(element.textContent);
                    element.textContent = formatter.format(value);
                });
                subtotalElements.forEach(function (element) {
                    const value = parseFloat(element.textContent);
                    element.textContent = formatter.format(value);
                });
                totalElements.forEach(function (element) {
                    const value = parseFloat(element.textContent);
                    element.textContent = formatter.format(value);
                });
                // Toggle display based on paymentMethod value
                const paymentMethod = document.getElementById("paymentMethod");
                const bankingDetails = document.getElementById("bankingDetails");
                const CodDetails = document.getElementById("CodDetails");
                if (paymentMethod.value === "true") {
                    // Payment via banking (display bankingDetails)
                    bankingDetails.style.display = "block";
                    CodDetails.style.display = "none";
                } else {
                    // Payment on delivery (display CodDetails)
                    bankingDetails.style.display = "none";
                    CodDetails.style.display = "block";
                }
            });
            function validateForm() {
                var currentStatus = document.getElementById("currentStatus").value;

                if (currentStatus !== "1") {
                    alert("Đơn hàng của bạn đang trong quá trình gửi. Không thể hủy!");
                    return false;
                }

                // If currentStatus is 1, the form will be submitted.
                if (currentStatus === "1") {
                    var confirmation = confirm("Bạn có thật sự muốn hủy đơn hàng?");
                    if (confirmation) {
                        return true;  // User confirmed, allow form submission.
                    } else {
                        return false; // User canceled, prevent form submission.
                    }
                }
            }


        </script>                       
    </body>

</html