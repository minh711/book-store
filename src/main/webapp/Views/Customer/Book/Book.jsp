<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Sample</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            .book-item {
                transition: transform 0.3s;
            }

            .book-item:hover {
                cursor: pointer;
                transform: scale(1.05); 
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light">
            <div class="container p-3">
                <div class="bg-white shadow rounded mt-4 p-4">
                    <h3>Hiển thị kết quả cho </h3>
                    <div class="row">
                        <c:forEach var="book" items="${books}" >
                            <div onclick="goToBookDetail(${book.id});" class="book-item col-lg-3 col-md-4 col-sm-6 p-4">
                                <div class="card border-0 shadow">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <div class="d-flex justify-content-center">
                                            <img style="width: 160px; height: 200px; object-fix: contain;" src="/Images/${book.thumbnail}" class="card-img-top"/>
                                        </div>

                                        <div class="mt-2 text-center">
                                            <h4 style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                                ${book.title}
                                            </h4>
                                        </div>

                                        <div class="text-center">
                                            <div>
                                                <span style="font-weight: bold; font-size: 1.2em;" class="format-number text-success me-2" data-value="${book.salePrice}"></span>
                                                <span class="text-danger">${book.discount}% giảm</span>
                                            </div>

                                            <div>
                                                <span class="format-number text-decoration-line-through text-muted" data-value="${book.price}"></span>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <p>
                                                <strong class="mx-2">${book.avgRating}</strong>
                                                <span>
                                                    <i class="fa fa-star ${book.avgRating >= 1 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 2 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 3 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating >= 4 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                    <i class="fa fa-star ${book.avgRating == 5 ? 'text-warning' : 'text-secondary'}" aria-hidden="true"></i>
                                                </span>
                                            </p>
                                            <p class="mx-2 text-black-50">(${book.totalRating})</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        <script src="${pageContext.request.contextPath}/Views/Customer/Home/script.js"></script>
        <script>
            // Format the number from 1000 to 1.000 form (for VND)
            const formatNumberElements = document.getElementsByClassName('format-number');

            for (let i = 0; i < formatNumberElements.length; i++) {
                let element = formatNumberElements[i];
                let value = element.getAttribute('data-value');
                let formattedValue = Number(value).toLocaleString();
                element.textContent = formattedValue + ' VNÐ';
            }

            $(document).ready(function () {
                $('#rating-slider').carousel();
            });
            
            function goToBookDetail(bookId) {
                window.location.href = "${pageContext.request.contextPath}/Book/Detail?ID=" + bookId;
            }
        </script>
    </body>
</html