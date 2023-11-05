<%@page import="com.google.gson.Gson"%>
<%@page import="Models.MgrModels.BookDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Tìm kiếm</title>
        <jsp:include page="/Views/head.jsp"/>
        <style>
            .book-item {
                transition: transform 0.3s;
            }

            .book-item:hover {
                cursor: pointer;
                transform: scale(1.05); 
            }
            
            .sort-btn {
                cursor: pointer;
                text-decoration: none;
            }
            
            .sort-btn:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light">
            <div class="container p-3">
                <div class="bg-white shadow rounded mt-4 p-4">
                    
                    <c:if test="${isAll eq 'true'}">
                        <h3 class="text-center">Tất cả sản phẩm</h3>
                    </c:if>
                    
                    <c:if test="${isAll != 'true'}">
                        <h3>Kết quả tìm kiếm cho ${searchKey == null ? "" : "từ khóa "}${searchKey}${AuthorID == null ? "" : "Tác giả "}${PublisherID == null ? "" : "Nhà xuất bản "}${GenreID == null ? "" : "Thể loại "}${LanguageID == null ? "" : "Ngôn ngữ "}${Name}</h3>
                    </c:if>
                    
                    <div class="mt-4 d-flex align-items-center">
                        <div class="mx-2">Sắp xếp theo</div>
                        <a class="sort-btn mx-2" id="SortByBestSellerS"> Bán chạy nhất</a>
                        <a class="sort-btn mx-2" id="SortByBestSaleS"> Giảm nhiều nhất</a>
                        <a class="sort-btn mx-2" id="SortByHighestPriceS"> Giá từ cao đến thấp</a>
                        <a class="sort-btn mx-2" id="SortByLowestPriceS"> Giá từ thấp đến cao</a>
                        <a class="sort-btn mx-2" id="SortByHighestAvgRating"> Đánh giá từ cao đến thấp</a>
                        <a class="sort-btn mx-2" id="SortByLowestAvgRating"> Đánh giá từ thấp đến cao</a>
                    </div>
                    
                    <div class="row" id="bookSearchs">
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
            formatNumberElements();

            function goToBookDetail(bookId) {
                window.location.href = "/Book/Detail?ID=" + bookId;
            }
        </script>
        <%
            ArrayList<BookDetail> books = (ArrayList<BookDetail>) request.getAttribute("books");
            Gson gson = new Gson();
            String booksJson = gson.toJson(books);
        %>
        <script>
            $(document).ready(function () {                                                                                                                                                                                                              // @author DuyenLTM
                var jsonn = <%= booksJson %>
                
                $("#SortByBestSellerS").click(function () {
                    var books =JSON.parse(JSON.stringify(jsonn));
                    console.log(typeof books);
                    books.sort(function (a, b) {
                        return b.soleTotal - a.soleTotal;
                    });
                    var bookDetails = $("#bookSearchs");
                    bookDetails.empty();

                    $.each(books, function (index, book) {
                        let bookItem = 
                            "<div onclick=\"goToBookDetail(" + book.id + ");\" class=\"book-item col-lg-3 col-md-4 col-sm-6 p-4\">" +
                            "<div class=\"card border-0 shadow\">" +
                            "<div class=\"card-body d-flex flex-column justify-content-between\">" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<img style=\"width: 160px; height: 200px; object-fix: contain;\" src=\"/Images/" + book.thumbnail + "\" class=\"card-img-top\"/>" +
                            "</div>" +
                            "<div class=\"mt-2 text-center\">" +
                            "<h4 style=\"overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">" + book.title + "</h4>" +
                            "</div>" +
                            "<div class=\"text-center\">" +
                            "<div>" +
                            "<span style=\"font-weight: bold; font-size: 1.2em;\" class=\"format-number text-success me-2\" data-value=\"" + book.salePrice + "\"></span>" +
                            "<span class=\"text-danger\">" + book.discount + "% giảm</span>" +
                            "</div>" +
                            "<div>" +
                            "<span class=\"format-number text-decoration-line-through text-muted\" data-value=\"" + book.price + "\"></span>" +
                            "</div>" +
                            "</div>" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<p>" +
                            "<strong class=\"mx-2\">" + book.avgRating + "</strong>" +
                            "<span>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 1 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 2 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 3 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 4 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating === 5 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "</span>" +
                            "</p>" +
                            "<p class=\"mx-2 text-black-50\">(" + book.totalRating + ")</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        bookDetails.append(bookItem);
                        formatNumberElements();
                    });
                });
                
                $("#SortByBestSaleS").click(function () {
                    var books =JSON.parse(JSON.stringify(jsonn));
                    books.sort(function (a, b) {
                        return b.discount - a.discount;
                    });
                    var bookDetails = $("#bookSearchs");
                    bookDetails.empty();

                    $.each(books, function (index, book) {
                        let bookItem = 
                            "<div onclick=\"goToBookDetail(" + book.id + ");\" class=\"book-item col-lg-3 col-md-4 col-sm-6 p-4\">" +
                            "<div class=\"card border-0 shadow\">" +
                            "<div class=\"card-body d-flex flex-column justify-content-between\">" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<img style=\"width: 160px; height: 200px; object-fix: contain;\" src=\"/Images/" + book.thumbnail + "\" class=\"card-img-top\"/>" +
                            "</div>" +
                            "<div class=\"mt-2 text-center\">" +
                            "<h4 style=\"overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">" + book.title + "</h4>" +
                            "</div>" +
                            "<div class=\"text-center\">" +
                            "<div>" +
                            "<span style=\"font-weight: bold; font-size: 1.2em;\" class=\"format-number text-success me-2\" data-value=\"" + book.salePrice + "\"></span>" +
                            "<span class=\"text-danger\">" + book.discount + "% giảm</span>" +
                            "</div>" +
                            "<div>" +
                            "<span class=\"format-number text-decoration-line-through text-muted\" data-value=\"" + book.price + "\"></span>" +
                            "</div>" +
                            "</div>" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<p>" +
                            "<strong class=\"mx-2\">" + book.avgRating + "</strong>" +
                            "<span>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 1 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 2 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 3 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 4 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating === 5 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "</span>" +
                            "</p>" +
                            "<p class=\"mx-2 text-black-50\">(" + book.totalRating + ")</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        bookDetails.append(bookItem);
                        formatNumberElements();
                    });
                });
                
                $("#SortByHighestPriceS").click(function () {
                    var books = JSON.parse(JSON.stringify(jsonn));
                    books.sort(function (a, b) {
                        return b.price - a.price;
                    });
                    var bookDetails = $("#bookSearchs");
                    bookDetails.empty();

                    $.each(books, function (index, book) {
                        let bookItem = 
                            "<div onclick=\"goToBookDetail(" + book.id + ");\" class=\"book-item col-lg-3 col-md-4 col-sm-6 p-4\">" +
                            "<div class=\"card border-0 shadow\">" +
                            "<div class=\"card-body d-flex flex-column justify-content-between\">" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<img style=\"width: 160px; height: 200px; object-fix: contain;\" src=\"/Images/" + book.thumbnail + "\" class=\"card-img-top\"/>" +
                            "</div>" +
                            "<div class=\"mt-2 text-center\">" +
                            "<h4 style=\"overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">" + book.title + "</h4>" +
                            "</div>" +
                            "<div class=\"text-center\">" +
                            "<div>" +
                            "<span style=\"font-weight: bold; font-size: 1.2em;\" class=\"format-number text-success me-2\" data-value=\"" + book.salePrice + "\"></span>" +
                            "<span class=\"text-danger\">" + book.discount + "% giảm</span>" +
                            "</div>" +
                            "<div>" +
                            "<span class=\"format-number text-decoration-line-through text-muted\" data-value=\"" + book.price + "\"></span>" +
                            "</div>" +
                            "</div>" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<p>" +
                            "<strong class=\"mx-2\">" + book.avgRating + "</strong>" +
                            "<span>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 1 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 2 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 3 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 4 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating === 5 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "</span>" +
                            "</p>" +
                            "<p class=\"mx-2 text-black-50\">(" + book.totalRating + ")</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        bookDetails.append(bookItem);
                        formatNumberElements();
                    });
                });
                
                $("#SortByLowestPriceS").click(function () {
                    var books = JSON.parse(JSON.stringify(jsonn));
                    books.sort(function (a, b) {
                        return a.price - b.price;
                    });
                    var bookDetails = $("#bookSearchs");
                    bookDetails.empty();

                    $.each(books, function (index, book) {
                        let bookItem = 
                            "<div onclick=\"goToBookDetail(" + book.id + ");\" class=\"book-item col-lg-3 col-md-4 col-sm-6 p-4\">" +
                            "<div class=\"card border-0 shadow\">" +
                            "<div class=\"card-body d-flex flex-column justify-content-between\">" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<img style=\"width: 160px; height: 200px; object-fix: contain;\" src=\"/Images/" + book.thumbnail + "\" class=\"card-img-top\"/>" +
                            "</div>" +
                            "<div class=\"mt-2 text-center\">" +
                            "<h4 style=\"overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">" + book.title + "</h4>" +
                            "</div>" +
                            "<div class=\"text-center\">" +
                            "<div>" +
                            "<span style=\"font-weight: bold; font-size: 1.2em;\" class=\"format-number text-success me-2\" data-value=\"" + book.salePrice + "\"></span>" +
                            "<span class=\"text-danger\">" + book.discount + "% giảm</span>" +
                            "</div>" +
                            "<div>" +
                            "<span class=\"format-number text-decoration-line-through text-muted\" data-value=\"" + book.price + "\"></span>" +
                            "</div>" +
                            "</div>" +
                            "<div class=\"d-flex justify-content-center\">" +
                            "<p>" +
                            "<strong class=\"mx-2\">" + book.avgRating + "</strong>" +
                            "<span>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 1 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 2 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 3 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating >= 4 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "<i class=\"fa fa-star " + (book.avgRating === 5 ? 'text-warning' : 'text-secondary') + "\" aria-hidden=\"true\"></i>" +
                            "</span>" +
                            "</p>" +
                            "<p class=\"mx-2 text-black-50\">(" + book.totalRating + ")</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        bookDetails.append(bookItem);
                        formatNumberElements();
                    });
                });
            });                                                                                                                                                                                                                                          // @author DuyenLTM
            
            //Average Rating from highest to lowest
            $("#SortByHighestAvgRating").click(function () {
                var books =JSON.parse(JSON.stringify(jsonn));
                console.log(typeof books);
                books.sort(function (a, b) {
                    return b.avgRating - a.avgRating;
                });
                var bookDetails = $("#bookSearchs");
                bookDetails.empty();

                $.each(books, function (index, book) {
                    var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                    bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
                });
            });
            
            //Average Rating from lowest to highest
            $("#SortByLowestAvgRating").click(function () {
                var books =JSON.parse(JSON.stringify(jsonn));
                books.sort(function (a, b) {
                    return a.avgRating - b.avgRating;
                });
                var bookDetails = $("#bookSearchs");
                bookDetails.empty();

                $.each(books, function (index, book) {
                    var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                    bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
                });
            });
            
            function formatNumberElements() {
                let formatNumberElements = document.getElementsByClassName('format-number');

                for (let i = 0; i < formatNumberElements.length; i++) {
                    let element = formatNumberElements[i];
                    let value = element.getAttribute('data-value');
                    let formattedValue = Number(value).toLocaleString();
                    element.textContent = formattedValue + ' VNÐ';
                }
            }
        </script>   
    </body>
</html