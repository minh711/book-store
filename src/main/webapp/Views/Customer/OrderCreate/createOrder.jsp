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
        <jsp:include page="/Views/header.jsp"/>
        <div id="customAlertContainer" class="position-fixed top-0 end-0 p-3" style="z-index: 1050"></div>


        <main class="bg-light">
            <div class="container">
                <h1 class="text-center mt-3 mb-3">Thông tin đơn hàng</h1>
                <form id="myForm" method="post" action="CreateOrder" enctype="multipart/form-data">
                    <input type="hidden" name="data" value="${requestScope.jsonList}">
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
                                        <div class="mt-2 text-primary newAddress " role="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Thêm địa chỉ mới</div>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <textarea class="form-control" style="resize: none;" placeholder="Ghi chú" rows="3" name="note" id="noteTextarea"></textarea>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label class="mb-2"><h4>Phương thức thanh toán</h4></label>
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
                                            <h5 class="card-title">Thông tin thanh toán</h5>
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
                                            <input type="file" id="imageFile" name="paymentImage" class="form-control" accept="image/*">

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
                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Thêm địa chỉ mới</h5>

                            </div>
                            <div class="modal-body ">
                                <div class="container">
                                    <div class="row mt-3">
                                        <div class="col-6 ">
                                            <input type="text" class="form-control"id="fullName" placeholder="Họ và tên">
                                            <small class="text-danger d-none" id="errorName">Không được để trống</small>
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="form-control"id="phoneNumber" placeholder="Số điện thoại">
                                            <small class="text-danger d-none" id="errorPhone">10 chữ số, bắt đầu bằng 0</small>
                                        </div>
                                    </div>
                                    <div>
                                        <input type="text" class="mt-3 form-control" id="homeAddress" placeholder="Số nhà, tên đường">
                                        <small class="text-danger d-none" id="errorHome">Không được để trống</small>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="button" class="btn btn-primary" id="SaveButton">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <script>
//            var isAddAddressVisible = false;
            document.addEventListener("DOMContentLoaded", function () {
                var paymentRadios = document.querySelectorAll(".payment-radio");
                var bankingDetails = document.querySelector(".bankingDetails");
                var CodDetails = document.querySelector(".CodDetails");

                var total1ValueInput = document.getElementById("total1Value");
                var totalSaleValue = document.getElementById("totalSaleValue");
                var total = calculateTotal();
                total1ValueInput.value = total;
                totalSaleValue.value = calculateSaleTotal();
                var imageFile = document.getElementById("imageFile");
                console.log(total1ValueInput);
                // Format as currency
                var currencySymbol = '₫';
                var total1Element = document.getElementById("total1");
                total1Element.textContent = total.toLocaleString('en-US', {style: 'currency', currency: 'VND'}).replace(currencySymbol, '') + 'đ';
                var total2Element = document.getElementById("total2");
                total2Element.textContent = total.toLocaleString('en-US', {style: 'currency', currency: 'VND'}).replace(currencySymbol, '') + 'đ';
                for (var i = 0; i < paymentRadios.length; i++) {
                    paymentRadios[i].addEventListener("change", function () {
                        if (this.value === "true") {
                            bankingDetails.style.display = "block";
                            CodDetails.style.display = "none";
                        } else {
                            bankingDetails.style.display = "none";
                            CodDetails.style.display = "block";
                            imageFile.value = "";
                        }

                        // Calculate and display the total

                    });
                }


                // Select the "Thêm địa chỉ mới" link by its id
                var newAddressLink = document.getElementById("newAddressLink");

                // Select the .addNewAddressDetails section
                var addNewAddressDetails = document.querySelector(".addNewAddressDetails");


                // Select the textarea element by its id
                var noteTextarea = document.getElementById("noteTextarea");

                // Add an input event listener to the textarea
                noteTextarea.addEventListener("input", function () {
                    // Get the current text in the textarea
                    var currentText = noteTextarea.value;

                    // Check if the length of the text exceeds the limit (500 characters)
                    if (currentText.length > 500) {
                        // If it exceeds, truncate the text to 500 characters
                        noteTextarea.value = currentText.slice(0, 500);
                    }
                });
            });

            // format currency in table  //
            var priceElements = document.querySelectorAll(".price");

            var subtotalElements = document.querySelectorAll(".subtotal");

            priceElements.forEach(function (priceElement) {
                var price = parseFloat(priceElement.textContent);
                if (!isNaN(price)) {
                    var formattedPrice = price.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                    var currencySymbol = '₫';
                    priceElement.textContent = formattedPrice.replace(currencySymbol, '') + 'đ';
                }
            });



            subtotalElements.forEach(function (subtotalElement) {
                var subtotal = parseFloat(subtotalElement.textContent);
                if (!isNaN(subtotal)) {
                    var formattedSubtotal = subtotal.toLocaleString('en-US', {style: 'currency', currency: 'VND'});
                    var currencySymbol = '₫';
                    subtotalElement.textContent = formattedSubtotal.replace(currencySymbol, '') + 'đ';
                }
            });


            // end format currency   //





            // validate input fields

            const form = document.getElementById('myForm');

            const paymentMethodRadios = document.querySelectorAll('input[name="payment-method"]');
            form.addEventListener('submit', function (e) {

                let valid = true;
                var selectedPayment = document.querySelector('input[name="payment-method"]:checked');

                // Check if a payment method is selected
                let paymentMethodSelected = false;
                paymentMethodRadios.forEach(function (radio) {
                    if (radio.checked) {
                        paymentMethodSelected = true;
                    }
                });

                if (!paymentMethodSelected && valid === true) {
                    valid = false;
                    alert('Vui lòng chọn một phương thức thanh toán.');
                }
                if (selectedPayment && selectedPayment.value === "true") {
                    // Check if a file is uploaded
                    var fileInput = document.querySelector('input[type="file"]');
                    if (!fileInput || !fileInput.files.length) {
                        e.preventDefault();
                        alert("Vui lòng tải 1 tệp ảnh lên.");
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
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>  
        <script>
            const fullNameInput = document.getElementById('fullName');
            const phoneNumberInput = document.getElementById('phoneNumber');
            const homeInput = document.getElementById('homeAddress');
            const saveButton = document.getElementById('SaveButton');

            const errorName = document.getElementById('errorName');
            const errorHome = document.getElementById('errorHome');
            const errorPhone = document.getElementById('errorPhone');

            const modal = document.getElementById('exampleModalCenter');
            modal.addEventListener('show.bs.modal', function () {
                // Clear the input fields
                fullNameInput.value = '';
                phoneNumberInput.value = '';
                homeInput.value = '';
                fullNameInput.classList.remove('is-invalid');
                phoneNumberInput.classList.remove('is-invalid');
                homeInput.classList.remove('is-invalid');
                errorName.classList.add('d-none');
                errorHome.classList.add('d-none');
                errorPhone.classList.add('d-none');
            });


            saveButton.addEventListener('click', function () {

                if (validateAddress()) {
                    sendDataToServlet();
                }
            });

            function validateAddress() {

                let valid = true;

                if (fullNameInput.value.trim() === '') {
                    valid = false;
                    fullNameInput.classList.add('is-invalid');
//                    errorName.classList.add('d-block');
                    errorName.classList.remove('d-none');
                } else {
                    fullNameInput.classList.remove('is-invalid');
//                    errorName.classList.remove('d-block');
                    errorName.classList.add('d-none');
                }

                if (homeInput.value.trim() === '') {
                    valid = false;
                    homeInput.classList.add('is-invalid');

                    errorHome.classList.remove('d-none');
                } else {
                    homeInput.classList.remove('is-invalid');
                    errorHome.classList.add('d-none');
                }

                // Validate phone number (assuming it should be a valid numeric input)
                const phoneNumberPattern = /^0\d{9}$/;
                if (!phoneNumberPattern.test(phoneNumberInput.value.trim())) {
                    valid = false;
                    phoneNumberInput.classList.add('is-invalid');
                    errorPhone.classList.remove('d-none');
                } else {
                    phoneNumberInput.classList.remove('is-invalid');
                    errorPhone.classList.add('d-none');
                }

                return valid;
            }


            function sendDataToServlet() {
                const fullName = fullNameInput.value;
                const phoneNumber = phoneNumberInput.value;
                const address = homeInput.value;

                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/Order/AddAddress',
                    data: {
                        fullName: fullName,
                        phoneNumber: phoneNumber,
                        address: address
                    },
                    success: function (response) {
                        console.log(response);
                        // Create and add a Bootstrap alert message to customAlertContainer
                        const alertMessage = $('<div class="alert alert-success alert-dismissible fade show" role="alert"></div>');
                        alertMessage.html('<strong>Success:</strong> Đã thêm địa chỉ thành công.' +
                                '</button>');

                        $('#customAlertContainer').append(alertMessage);

                        // Hide the alert after 10 seconds
                        setTimeout(function () {
                            alertMessage.alert('close');
                        }, 1500); // Adjust the time as needed

                        const select = $('#addressSelect'); // Make sure '#addressSelect' matches the ID of your <select> element

                        // Deselect all previously selected options
                        select.find('option').prop('selected', false);

                        const option = $('<option></option>').attr('value', response).text(fullName + ', ' + phoneNumber + ', ' + address);
                        select.append(option);
                        option.prop('selected', true);

                        // Close the modal
                        $('#exampleModalCenter').modal('hide');
                    }
                });
            }
        </script>
    </body>

</html>