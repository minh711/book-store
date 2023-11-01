<%-- 
    Document   : Cart
    Created on : Oct 13, 2023, 7:18:06 PM
    Author     : mummykiara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <jsp:include page="/Views/header.jsp"/>

        <div id="customAlertContainer" class="position-fixed top-0 end-0 p-3" style="z-index: 1050"></div>

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
                                    <input class="form-check-input SelectBook" type="checkbox" style="width: 30px; height: 30px;">
                                </td>
                                <td>
                                    <div class="d-flex p-2">
                                        <img
                                            src="${pageContext.request.contextPath}/Images/${cart.getBookThumbnail()}"
                                            class="rounded" alt="..." style="width: 100px; height: 100px; object-fit: contain;">
                                        <div class="fs-5 mx-2 d-flex align-items-start">
                                            ${cart.getBookTitle()}
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center"><input class="font-weight-medium text-center BookPrice" type="text" style="border: none;pointer-events: none" readonly value="<fmt:formatNumber type="number" value="${cart.getBookprice()}" pattern="#,###" />"></td>
                                <td>
                                    <div class="d-flex">
                                        <div class="input-group d-flex justify-content-center align-items-center">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-minus decreaseQuantity">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <div class="mx-2"> 
                                                <input type="text" class="form-control mx-3 text-center BookQuantity" style="width: 50px;" value="${cart.getBookquantity()}" min="1" max="${cart.getBookQuantityRemain()}">

                                            </div>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-plus increaseQuantity">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                <td class="text-center"><input class="font-weight-medium text-center totalEachProduct" type="text" style="border: none;pointer-events: none" readonly></td>
                                <td class="text-center"><i class="fa fa-remove DeleteProduct" style="cursor: pointer" data-bookid="${cart.getBookid()}" data-customerid="${cart.getAccountid()}"></i></td>
                        <input type ="hidden" class ="form-control mx-3 text-center BookQuantityRemain" value="${cart.getBookQuantityRemain()}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <form id="checkoutForm" method="post" action="${pageContext.request.contextPath}/Cart">
                    <div class="bg-light p-4 mt-3 mb-3 d-flex justify-content-between align-items-center">
                        <div class="d-flex">
                            <div class="text-primary SelectAll" style="cursor: pointer">Chọn tất cả</div>
                            <div class="mx-3 text-primary DeselectAll" style="cursor: pointer">Bỏ chọn tất cả</div>
                        </div>
                        <div class="d-flex">
                            <div class="p-2 mx-2 text-dark" id="TotalCart">Tổng cộng: </div>
                            <div> <button class="btn btn-danger p-2" type="submit" id="btnOrder">Mua hàng</button></div>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        <jsp:include page="/Views/footer.jsp"/>

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
            // Function to calculate the total based on selected checkboxes
            function calculateTotalCart() {
                var total = 0;
                $('.SelectBook').each(function () {
                    if ($(this).is(':checked')) {
                        var price = parseFloat($(this).closest('tr').find('.BookPrice').val().replace(/[^0-9.-]+/g, ''));
                        var quantity = parseInt($(this).closest('tr').find('.BookQuantity').val());
                        total += price * quantity;
                    }
                });
                // Format the total and update the TotalCart element
                var formattedTotal = total.toLocaleString('en-US');
                $('#TotalCart').text('Tổng cộng: ' + formattedTotal);
            }


            // Call a calculation function when a webpage loads
            $(document).ready(function () {
                calculateTotalForProduct();
                calculateTotalCart();
                //When the number of products changes, the value will be recalculated.
                $('.BookQuantity').on('input', function () {
                    calculateTotalCart();
                    calculateTotalForProduct();
                });
                $('.SelectBook').on("change", function () {
                    calculateTotalCart();
                });
                $('.SelectAll').on("click", function () {
                    calculateTotalForProduct();
                    calculateTotalCart();
                });
                $('.DeselectAll').on("click", function () {
                    calculateTotalForProduct();
                    calculateTotalCart();
                });
            });
            //Function to decrease quantity of book in Cart
            $('.decreaseQuantity').on('click', function () {
                var inputQuantity = $(this).closest('tr').find('.BookQuantity');
                var currentQuantity = parseInt(inputQuantity.val());
                var minQuantity = 1;
                if (!isNaN(currentQuantity) && currentQuantity > minQuantity) {
                    inputQuantity.val(currentQuantity - 1);
                    calculateTotalForProduct();
                    calculateTotalCart();
                    updateQuantity($(this).closest('tr'));
                }
            });
            //Function to increase quantity of book in Cart
            $('.increaseQuantity').on('click', function () {
                var inputQuantity = $(this).closest('tr').find('.BookQuantity');
                var currentQuantity = parseInt(inputQuantity.val());
                var maxQuantity = parseInt($(this).closest('tr').find('.BookQuantityRemain').val());
                if (!isNaN(currentQuantity) && currentQuantity < maxQuantity) {
                    inputQuantity.val(currentQuantity + 1);
                    calculateTotalForProduct();
                    calculateTotalCart();
                    updateQuantity($(this).closest('tr'));
                }
            });
            function validateBookQuantity(inputElement) {
                var currentQuantity = parseInt(inputElement.val());
                var minQuantity = 1;
                var maxQuantityRemain = parseInt(inputElement.closest('tr').find('.BookQuantityRemain').val());
                if (!isNaN(currentQuantity)) {
                    if (currentQuantity < minQuantity) {
                        inputElement.val(minQuantity);
                    } else if (currentQuantity > maxQuantityRemain) {
                        inputElement.val(maxQuantityRemain);
                    }
                } else {
                    inputElement.val(minQuantity);
                }
            }

            //Check the condition input of the BookQuantity
            $('.BookQuantity').on('input', function () {
                validateBookQuantity($(this));
                calculateTotalForProduct();
                calculateTotalCart();
                updateQuantity($(this).closest('tr'));
            });
            //Select all book
            $('.SelectAll').on('click', function () {
                $('.SelectBook').prop('checked', true);
            });
            //Deselect all book
            $('.DeselectAll').on('click', function () {
                $('.SelectBook').prop('checked', false);
            });
            $('.DeleteProduct').on('click', function () {
                var bookId = $(this).data('bookid');
                var customerId = $(this).data('customerid');
                var productrow = $(this).closest('tr');
                if (confirm("Bạn chắc chắn muốn xóa sản phẩm này?")) {
                    productrow.remove();
                    calculateTotalForProduct();
                    calculateTotalCart();
                    $.ajax({

                        type: "POST",
                        url: "${pageContext.request.contextPath}/Delete/Book",
                        data: {
                            bookId: bookId,
                            customerId: customerId
                        },
                        success: function (response) {
                            console.log(response);
                            const alertMessage = $('<div class="alert alert-success alert-dismissible fade show" role="alert"></div>');
                            alertMessage.html('<strong>Success:</strong> Đã xóa sản phẩm thành công.' +
                                    '</button>');
                            $('#customAlertContainer').append(alertMessage);
                            // Hide the alert after 10 seconds
                            setTimeout(function () {
                                alertMessage.alert('close');
                            }, 1500); // Adjust the time as needed
                        },
                        error: function (response) {
                            console.log(response);
                            const alertMessage = $('<div class="alert alert-success alert-dismissible fade show" role="alert"></div>');
                            alertMessage.html('<strong>Success:</strong> Đã xảy ra lỗi khi xóa sản phẩm.' +
                                    '</button>');
                            $('#customAlertContainer').append(alertMessage);
                            // Hide the alert after 10 seconds
                            setTimeout(function () {
                                alertMessage.alert('close');
                            }, 1500); // Adjust the time as needed
                        }
                    });
                }
            });

            document.getElementById('checkoutForm').addEventListener('submit', function (event) {
                //Prevent default form submission
                event.preventDefault();

                var selectedCheckboxes = document.querySelectorAll('.SelectBook:checked');
                if (selectedCheckboxes.length === 0) {
                    window.alert("Hãy chọn ít nhất 1 sản phẩm để thanh toán!");
                }
                if (selectedCheckboxes.length !== 0) {
                    for (var i = 0; i < selectedCheckboxes.length; i++) {

                        var checkbox = selectedCheckboxes[i];
                        var tr = checkbox.closest('tr');

                        //Get the values from the corresponding row
                        var bookId = tr.querySelector('.DeleteProduct').getAttribute('data-bookid');
                        var customerId = tr.querySelector('.DeleteProduct').getAttribute('data-customerid');
                        var bookQuantity = tr.querySelector('.BookQuantity').value;

                        //Create hidden fields and add them to forms
                        var bookIdInput = document.createElement('input');
                        bookIdInput.type = 'hidden';
                        bookIdInput.name = 'bookIds'; // Đặt tên trường trong biểu mẫu
                        bookIdInput.value = bookId;

                        var customerIdInput = document.createElement('input');
                        customerIdInput.type = 'hidden';
                        customerIdInput.name = 'customerIds'; // Đặt tên trường trong biểu mẫu
                        customerIdInput.value = customerId;

                        var quantityInput = document.createElement('input');
                        quantityInput.type = 'hidden';
                        quantityInput.name = 'quantities'; // Đặt tên trường trong biểu mẫu
                        quantityInput.value = bookQuantity;

                        //Add hidden fields to form
                        document.getElementById('checkoutForm').appendChild(bookIdInput);
                        document.getElementById('checkoutForm').appendChild(customerIdInput);
                        document.getElementById('checkoutForm').appendChild(quantityInput);


                        //Submit form
                        this.submit();
                    }
                }
            });

            //Declare a variable to track whether data has changed
            var dataChanged = false;
            var navigateAway = false;

            //Check the data of the form if it changed
            document.getElementById('checkoutForm').addEventListener('change', function () {
                dataChanged = true;
            });

            //Assign value if order button is clicked
            document.getElementById('btnOrder').addEventListener('click', function () {
                navigateAway = true;
            });

            //Assign the beforeunload event to check before leaving the page
            window.addEventListener('beforeunload', function (event) {
                if (dataChanged && !navigateAway) {
                    var confirmationMessage = 'Dữ liệu đã thay đổi. Bạn có muốn lưu lại trước khi rời trang?';
                    (event || window.event).returnValue = confirmationMessage;
                    return confirmationMessage;
                }
            });


        </script>
    </body>
</html>
