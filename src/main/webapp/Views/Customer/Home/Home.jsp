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
            <form action="/BookSearch" method="post">
                <input type="text" name="searchKey"/><br>
                <input type="submit"/>
            </form>
            
            <br>
            <select id="authorSelect">
                <option value="">Chọn tác giả</option>
            </select>
            <select id="genreSelect">
                <option value="">Chọn thể loại</option>
            </select>
            <select id="languageSelect">
                <option value="">Chọn ngôn ngữ</option>
            </select>
            <select id="publisherSelect">
                <option value="">Chọn nhà xuất bản</option>
            </select>
            <div id="bookDetails">
                <c:forEach var="book" items="${books}">
                <p>${book.title}</p>
                <p>${book.publisher}</p>
                <p>${book.language}</p>

            </c:forEach>
            </div> 

        </main>
        <script>
            //get book attributes from BookSearch servlet
            $(document).ready(function () {
                getOptions("author");
                getOptions("genre");
                getOptions("language");
                getOptions("publisher");
            });

            function getOptions(optionType) {
                $.ajax({
                    url: "/BookSelectType",
                    type: "GET",
                    data: {optionType: optionType},
                    success: function (data) {
                        $("#" + optionType + "Select").append(data);
                    }
                });
            }

            //send to servlet when user click on a type in list
            $(document).ready(function () {
                $("#authorSelect").change(function () {
                    
                    var selectedAuthor = $(this).val();
                    $.ajax({
                        url: "/BookSelectType",
                        type: "POST",
                        data: {author: selectedAuthor},
                        success: function (data) {
                            displayBooks(data);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#genreSelect").change(function () {
                    var selectedGenre = $(this).val();
                    $.ajax({
                        url: "/BookSelectType",
                        type: "POST",
                        data: {genre: selectedGenre},
                        success: function (data) {
                            displayBooks(data);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#languageSelect").change(function () {
                    var selectedLanguage = $(this).val();
                    $.ajax({
                        url: "/BookSelectType",
                        type: "POST",
                        data: {language: selectedLanguage},
                        success: function (data) {
                            displayBooks(data);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#publisherSelect").change(function () {
                    var selectedPublisher = $(this).val();
                    $.ajax({
                        url: "/BookSelectType",
                        type: "POST",
                        data: {publisher: selectedPublisher},
                        success: function (data) {
                            displayBooks(data);
                        }
                    });
                });
            });

            //show list after processing in servlet
            function displayBooks(data) {
                var bookDetails = $("#bookDetails");
                bookDetails.empty();

                var books = JSON.parse(JSON.stringify(data));

                $.each(books, function (index, book) {
                    var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
                    bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
                });
            }
        </script>
    </script>

    <jsp:include page="/Views/footer.jsp"/>
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Customer/Home/script.js"></script>
</body>

</html