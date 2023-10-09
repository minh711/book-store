<%-- 
    Document   : createOrder
    Created on : Oct 5, 2023, 12:57:15 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <style>
            .bankingDetails {
                display: none;
            }
            .CodDetails {
                display: block;
            }
            .addNewAddressDetails{
                display: none;
            }
        </style>
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
                <h1 class="text-center mt-3 mb-3">Thông tin đơn hàng</h1>
                <form id="myForm" method="post" action="CreateOrder">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                               
                                <th class="col-6 text-center">Sản phẩm</th>
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
                            <h5 class="subSale" style="display: none">${item.getPrice()* item.getQuantity()}</h5>
                          
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="card p-4">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="card">
                                    <div class="card-body">
                                        <label class="mb-2">Địa chỉ đã lưu</label>
                                        <select class="form-select" id="addressSelect" name="selectedAddress">
                                            <c:forEach  items="${requestScope.addresses}" var="place">
                                                <option value="${place.getId()}">${place.getFullName()}, ${place.getPhone()}, ${place.getAddress()} </option>
                                            </c:forEach>

                                        </select>
                                        <div class="mt-2 text-primary newAddress" id="newAddressLink">Thêm địa chỉ mới</div>

                                    </div>
                                </div>
                                <div class="addNewAddressDetails">
                                    <div class="row mt-3">
                                        <div class="col-6 ">
                                            <input type="text" class="form-control"id="fullName" placeholder="Họ và tên">
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="form-control"id="phoneNumber" placeholder="Số điện thoại">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 mt-3">
                                            <input type="text" class="form-control"id="province" placeholder="Tỉnh/Thành Phố">

                                        </div>
                                        <div class="col-6 mt-3">

                                            <input type="text" class="form-control"id="huyen" placeholder="Quận/Huyện">

                                        </div>
                                    </div>
                                    <input type="text" class="mt-3 form-control" id="homeAddress" placeholder="Số nhà, tên đường">
                                </div>
                                <div class="mt-3">
                                    <textarea class="form-control" style="resize: none;" placeholder="Ghi chú" rows="3" name="note"></textarea>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label class="mb-2">Phương thức thanh toán</label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input payment-radio" name="payment-method" value="false">
                                        <label class="form-check-label">Thanh toán khi nhận hàng</label>
                                    </div>
                                    <div class="form-check mx-2">
                                        <input type="radio" class="form-check-input payment-radio" name="payment-method" value="true">
                                        <label class="form-check-label">Chuyển khoản</label>
                                    </div>

                                </div>
                                <div class="CodDetails">                                
                                    <div class="card mt-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Thông tin thanh toan</h5>
                                            <div>Đến ngày nhận hàng vui lòng chuẩn bị</div>
                                            <div>Số tiền</div>
                                            <h3 class="text-danger"><strong id="total1"></strong></h3>

                                        </div>
                                    </div>
                                </div>
                                <div id="bankingPaymentSection" class="bankingDetails">
                                    <div class="card mt-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Thông tin chuyển khoản</h5>
                                            <div>Vui lòng chuyển khoản đến</div>
                                            <div>Chủ tài khoản: Chủ Nhà Sách</div>
                                            <div>Số tài khoản: 1234 1234 1234 1234 VietcomBank</div>
                                            <div>Số tiền</div>
                                            <h3 class="text-danger"><strong id="total2"></strong></h3>
                                            <label class="mb-2">Ảnh chụp màn hình chuyển khoảng</label>
                                            <input type="file" name="paymentImage" class="form-control" accept="image/*">

                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="total1Value" name="total1Value" value="">
                                <input type="hidden" id="totalSaleValue" name="totalSaleValue" value="">
                                <button class="btn btn-danger w-100 mt-3">Xác nhận</button>
                            </div>
                        </div>
                    </div>
                </form>
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
        <script>
            var isAddAddressVisible = false;
            document.addEventListener("DOMContentLoaded", function () {
                var paymentRadios = document.querySelectorAll(".payment-radio");
                var bankingDetails = document.querySelector(".bankingDetails");
                var CodDetails = document.querySelector(".CodDetails");

                var total1ValueInput = document.getElementById("total1Value");
                var totalSaleValue = document.getElementById("totalSaleValue")
                var total = calculateTotal();
                total1ValueInput.value = total;
                totalSaleValue.value = calculateSaleTotal();
                // Format as currency
                var total1Element = document.getElementById("total1");
                total1Element.textContent = total.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                var total2Element = document.getElementById("total2");
                total2Element.textContent = total.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                for (var i = 0; i < paymentRadios.length; i++) {
                    paymentRadios[i].addEventListener("change", function () {
                        if (this.value === "true") {
                            bankingDetails.style.display = "block";
                            CodDetails.style.display = "none";
                        } else {
                            bankingDetails.style.display = "none";
                            CodDetails.style.display = "block";
                        }

                        // Calculate and display the total

                    });
                }


                // Select the "Thêm địa chỉ mới" link by its id
                var newAddressLink = document.getElementById("newAddressLink");

                // Select the .addNewAddressDetails section
                var addNewAddressDetails = document.querySelector(".addNewAddressDetails");

                // Add a click event listener to the link
                newAddressLink.addEventListener("click", function () {
                    // Toggle the display property of the .addNewAddressDetails section
                    if (addNewAddressDetails.style.display === "none" || addNewAddressDetails.style.display === "") {
                        addNewAddressDetails.style.display = "block";
                        isAddAddressVisible = true;
                    } else {
                        addNewAddressDetails.style.display = "none";
                        isAddAddressVisible = false;
                    }
                });
            });

            // format currency in table  //
            var priceElements = document.querySelectorAll(".price");

            var subtotalElements = document.querySelectorAll(".subtotal");

            priceElements.forEach(function (priceElement) {
                var price = parseFloat(priceElement.textContent);
                if (!isNaN(price)) {
                    priceElement.textContent = price.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                }
            });


            subtotalElements.forEach(function (subtotalElement) {
                var subtotal = parseFloat(subtotalElement.textContent);
                if (!isNaN(subtotal)) {
                    subtotalElement.textContent = subtotal.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                }
            });


            // end format currency   //





            // validate input fields

            const form = document.getElementById('myForm');
            const fullNameInput = document.getElementById('fullName');
            const phoneNumberInput = document.getElementById('phoneNumber');
            const CityInput = document.getElementById('province');
            const HuyenInput = document.getElementById('huyen');
            const homeInput = document.getElementById('homeAddress');
            const paymentMethodRadios = document.querySelectorAll('input[name="payment-method"]');
            form.addEventListener('submit', function (e) {

                let valid = true;
                var selectedPayment = document.querySelector('input[name="payment-method"]:checked');
                // Reset previous validation styles
                fullNameInput.classList.remove('is-invalid');
                phoneNumberInput.classList.remove('is-invalid');
                CityInput.classList.remove('is-invalid');
                HuyenInput.classList.remove('is-invalid');
                homeInput.classList.remove('is-invalid');
                // Validate full name (assuming it should not be empty)
                if (isAddAddressVisible === true) {
                    if (fullNameInput.value.trim() === '') {
                        valid = false;
                        fullNameInput.classList.add('is-invalid');
                    }
                    // Validate City/Province
                    if (CityInput.value.trim() === '') {
                        valid = false;
                        CityInput.classList.add('is-invalid');
                    }
                    // Validate huyen
                    if (HuyenInput.value.trim() === '') {
                        valid = false;
                        HuyenInput.classList.add('is-invalid');
                    }
                    if (homeInput.value.trim() === '') {
                        valid = false;
                        homeInput.classList.add('is-invalid');
                    }
                    // Validate phone number (assuming it should be a valid numeric input)
                    const phoneNumberPattern = /^0\d{9}$/;
                    if (!phoneNumberPattern.test(phoneNumberInput.value.trim())) {
                        valid = false;
                        phoneNumberInput.classList.add('is-invalid');
                    }
                }
                // Check if a payment method is selected
                let paymentMethodSelected = false;
                paymentMethodRadios.forEach(function (radio) {
                    if (radio.checked) {
                        paymentMethodSelected = true;
                    }
                });

                if (!paymentMethodSelected && valid === true) {
                    valid = false;
                    alert('Please select a payment method before submitting.');
                }
                if (selectedPayment && selectedPayment.value === "true") {
                    // Check if a file is uploaded
                    var fileInput = document.querySelector('input[type="file"]');
                    if (!fileInput || !fileInput.files.length) {
                        e.preventDefault();
                        alert("Please upload a file for banking payment.");
                    }
                }

                // Prevent form submission if there are validation errors
                if (!valid) {

                    e.preventDefault();
                }
            });


            // Function to calculate the total
            function calculateTotal() {
                var subtotalElements = document.querySelectorAll(".subtotal");
                var total = 0;

                subtotalElements.forEach(function (subtotalElement) {
                    var subtotal = parseFloat(subtotalElement.textContent.replace(/\D/g, ''));
                    if (!isNaN(subtotal)) {
                        total += subtotal;
                    }
                });

                return total;
            }

            function calculateSaleTotal() {
                var subtotalElements = document.querySelectorAll(".subSale");
                var total = 0;

                subtotalElements.forEach(function (subtotalElement) {
                    var subtotal = parseFloat(subtotalElement.textContent.replace(/\D/g, ''));
                    if (!isNaN(subtotal)) {
                        total += subtotal;
                    }
                });

                return total;
            }


        </script>

    </body>

</html>