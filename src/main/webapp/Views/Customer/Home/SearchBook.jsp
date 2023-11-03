<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.MgrModels.BookDetail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sample</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <div id="bookSearchs">
                <c:forEach var="book" items="${books}">
                    <p>${book.title}</p>
                    <p>${book.publisher}</p>
                    <p>${book.language}</p>

                </c:forEach>
            </div> 
            <div>
                <div><button id="SortByBestSellerS"> Bán chạy nhất</button><br></div>
                <div><button id="SortByBestSaleS"> Giảm nhiều nhất</button><br></div>
                <div><button id="SortByHighestPriceS"> Giá từ cao đến thấp</button><br></div>
                <div><button id="SortByLowestPriceS"> Giá từ thấp đến cao</button><br></div>
            </div>
            <%
                ArrayList<BookDetail> books = (ArrayList<BookDetail>) request.getAttribute("books");
                Gson gson = new Gson();
                String booksJson = gson.toJson(books);
            %>

        </main>

        <jsp:include page="/Views/footer.jsp"/>
        
        <jsp:include page="/Views/foot.jsp"/>
        <script>
            $(document).ready(function () {                                                                                                                                                                                                              // @author DuyenLTM
                var jsonn=<%= booksJson%>

                $("#SortByBestSellerS").click(function () {
                    var books =JSON.parse(JSON.stringify(jsonn));
                    console.log(typeof books);
                    books.sort(function (a, b) {
                        return b.soleTotal - a.soleTotal;
                    });
                    var bookDetails = $("#bookSearchs");
                    bookDetails.empty();

                    $.each(books, function (index, book) {
                        var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                        bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
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
                        var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                        bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
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
                        var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                        bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
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
                        var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                        bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
                    });
                });
            });                                                                                                                                                                                                                                          // @author DuyenLTM
        </script>   
    </body>
</html
