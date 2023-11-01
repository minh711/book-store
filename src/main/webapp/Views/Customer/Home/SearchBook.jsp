<%-- 
    Document   : SearchBook
    Created on : Nov 1, 2023, 2:30:32 PM
    Author     : DuyenLTM
--%>

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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/Admin/BookTransaction/style.css"/>
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>

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
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    </body>
    <script>
        $(document).ready(function () {
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
                var books =JSON.parse(JSON.stringify(jsonn));
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
                var books =JSON.parse(JSON.stringify(jsonn));
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
        });
    </script>


</html
