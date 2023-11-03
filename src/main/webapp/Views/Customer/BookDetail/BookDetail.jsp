<%-- 
    Document   : BookDetail
    Created on : Oct 6, 2023, 6:03:06 PM
    Author     : NhuLNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="Models.MgrModels.BookAuthorDetail"%>
<%@page import="Models.MgrModels.BookGenreDetail"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
        <style>
            .carousel {
                height: 500px;
                width: 450px;
            }

            .carousel-item img {
                width: 100%;
                height: 100%;
                object-fit: contain;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light">
            <div class="container">
                <main class="d-flex bg-light">
                    <div class="container">

                        <div class="row mt-4">
                            <div class="col-sm-6">

                                <div class="rounded bg-white p-4 mb-3">
                                    <div class="d-flex align-items-center justify-content-center">
                                        <div>
                                            <div id="carouselExampleDark" class="carousel carousel-dark slide">
                                                <div class="carousel-indicators">
                                                    <c:forEach items="${requestScope.BookPicture}" var="picture" varStatus="loop">
                                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${loop.index}" class="${loop.first ? 'active' : ''}"
                                                                aria-current="${loop.first ? 'true' : 'false'}" aria-label="Slide ${loop.index + 1}"></button>
                                                    </c:forEach>
                                                </div>
                                                <div class="carousel-inner">
                                                    <c:forEach items="${requestScope.BookPicture}" var="picture" varStatus="loop">
                                                        <div class="carousel-item ${loop.first ? 'active' : ''} img-thumbnail img-fluid rounded" data-bs-interval="10000">
                                                            <img src="${pageContext.request.contextPath}/Images/${picture.getPicture()}" class="d-block">
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </div>

                                        </div>

                                    </div>
                                </div>


                                <form id="addToCart" method="post" action="Book">                   
                                    <div class="d-flex align-items-center mb-3 justify-content-center">
                                        <input type="hidden" name="customerid" value="1">
                                        <input type="hidden" name="bookid" value ="${bookDetail.id}">
                                        <input type="hidden" id="quantityBook" name="quantityBook" value="">
                                        <div class="mx-2">
                                            <button class="btn btn-outline-secondary" type="submit" onclick="showSuccess()">
                                                <i class="fa fa-shopping-cart text-dark mx-2" aria-hidden="true""></i>
                                                Thêm vào giỏ hàng
                                            </button>
                                        </div>
                                        <div class="mx-2">
                                            <button class="btn btn-danger" style="width: 200px">Mua ngay</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="col-md-6">
                                <div>
                                    <div>
                                        <h2>${bookDetail.title}</h2>
                                        <div class="mt-3">
                                            <div class="d-flex">
                                                <!-- Element on the left -->
                                                <div class="px-4">
                                                    <p>Tên sách</p>
                                                    <p>Tác giả</p>
                                                    <p>Nhà xuất bản</p>
                                                    <p>Thể loại</p>
                                                    <p>Ngôn ngữ</p>
                                                </div>
                                                <!-- Vertical divider -->
                                                <div class="vr vr-blurry" style=""></div>
                                                <!-- Element on the left -->
                                                <div class="px-4">
                                                    <p>${bookDetail.title}</p>
                                                    <p>
                                                        <c:forEach items="${requestScope.BookAuthor}" var="author" varStatus="loop">
                                                            <span>${author.getAuthor()}${!loop.last?', ':' '} </span>
                                                        </c:forEach>
                                                    </p>
                                                    <p>${bookDetail.getPublisher()}</p>
                                                    <p>
                                                        <c:forEach items="${requestScope.BookGenre}" var="genre" varStatus="loop">
                                                            <span>${genre.getGenre()}${!loop.last?', ':' '} </span>
                                                        </c:forEach>
                                                    </p>

                                                    <p>${bookDetail.getLanguage()}</p>

                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div>
                                        <div>
                                            <div class="d-flex">

                                                <h3 class="text-danger"><strong><fmt:formatNumber type="number" value="${bookDetail.salePrice}" pattern="#,###" /></strong></h3>

                                                <div class="ts-lg mx-2 d-flex align-items-center">-${bookDetail.discount}%</div>
                                            </div>
                                            <div class="ts-lg text-decoration-line-through"><fmt:formatNumber type="number" value="${bookDetail.price}" pattern="#,###" />đ</div>
                                            <div class="d-flex">
                                                <p>
                                                    <strong class="mx-2">4.5</strong>
                                                    <span>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                                    </span>
                                                </p>
                                                <p class="mx-2 text-black-50">(10 đánh giá)</p>
                                            </div>

                                            <div class="text-danger mb-3">Số lượng còn lại: ${bookDetail.soleTotal}</div>
                                            <div class="d-flex">
                                                <div class="text-nowrap mx-2 d-flex align-items-center">Số lượng</div>
                                                <div class="input-group d-flex justify-content-start align-items-center">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-primary btn-minus" id="decreaseQuantity">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <div> 
                                                        <input type="text" class="form-control mx-3 text-center" style="width: 50px;"  id="cusEditQuantity" value="1"></div>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-primary btn-plus" id="increaseQuantity">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <hr>
                            <h2>MÔ TẢ SẢN PHẨM</h2>
                            <p style="text-align: justify;">
                                ${bookDetail.description}
                            </p><br>
                        </div>
                        <hr>
                        <div class="mt-4 p-4 text-dark rounded">
                            <h2>ĐÁNH GIÁ CỦA KHÁCH HÀNG</h2>
                            <div class="d-flex">
                                <p>
                                    <strong class="mx-2">${bookDetail.avgRating}</strong>
                                    <span>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                    </span>
                                </p>
                                <p class="mx-2 text-black-50">(10 đánh giá)</p>
                            </div>
                            <div class="d-flex">
                                <div class="mx-2 border bg-warning text-light rounded-pill p-2" style="cursor: pointer">Tất cả đánh giá</div>
                                <div class="mx-2 border rounded-pill p-2" style="cursor: pointer">
                                    5 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2" style="cursor: pointer">
                                    4 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2" style="cursor: pointer">
                                    3 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2" style="cursor: pointer">
                                    2 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                                <div class="mx-2 border rounded-pill p-2" style="cursor: pointer">
                                    1 
                                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                    (2)
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${requestScope.BookRating}" var="Rating">
                        <div class="mt-4 p-4 bg-white text-dark rounded">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex">
                                    <div class="mx-2">Nguyễn Văn A</div>
                                </div>
                                <div class="text-black-50">${Rating.getDateRating()}</div>
                            </div>
                            <div class="mt-2">
                                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <i class="fa fa-star text-secondary" aria-hidden="true"></i>
                                <div class="mt-2 text-dark">${Rating.getComment()}</div>
                            </div>
                        </div>
                        </c:forEach>
                        </div>
                    </div>
                </main>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <script>

            const quantityInput = document.getElementById("cusEditQuantity");
            const decreaseBtn = document.getElementById("decreaseQuantity");
            const increaseBtn = document.getElementById("increaseQuantity");

            //Limit the smallest quantity, and the largest
            const minQuantity = 1;
            const maxQuantity = ${bookDetail.soleTotal};

            //Check the condition if the Decrease button is pressed
            decreaseBtn.addEventListener("click", () => {
                let currentQuantity = parseInt(quantityInput.value);
                if (!isNaN(currentQuantity) && currentQuantity > minQuantity) {
                    quantityInput.value = currentQuantity - 1;
                }
            });

            //Check the condition if the Increase button is pressed
            increaseBtn.addEventListener("click", () => {
                let currentQuantity = parseInt(quantityInput.value);
                if (!isNaN(currentQuantity) && currentQuantity < maxQuantity) {
                    quantityInput.value = currentQuantity + 1;
                }
            });

            //Check conditions for increasing and decreasing value then update value.
            quantityInput.addEventListener("input", () => {
                let currentQuantity = parseInt(quantityInput.value);
                if (isNaN(currentQuantity) || currentQuantity < minQuantity) {
                    quantityInput.value = minQuantity;
                } else if (currentQuantity > maxQuantity) {
                    quantityInput.value = maxQuantity;
                }

            });

            const addToCartForm = document.getElementById("addToCart");
            const cusEditQuantity = document.getElementById("cusEditQuantity");
            const quantityBook = document.getElementById("quantityBook");

            //Set the value to quantityBook when submitting a form
            addToCartForm.addEventListener("submit", function (event) {

                const cusEditQuantityValue = cusEditQuantity.value;

                quantityBook.value = cusEditQuantityValue;
            });

            function showSuccess() {
                alert("Sản phẩm đã được thêm vào giỏ hàng!");
            }
        </script>
    </body>
</html>
