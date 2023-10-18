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
