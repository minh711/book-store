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
            <form action="/BookSearch" method="post">
                <input type="text" name="searchKey"/><br>
                <input  type="submit"/>
            </form>

            <br>
            <div>
                <div>
                    <select id="authorSelect">
                        <option value="">Chọn tác giả</option>
                    </select>
                </div>
                <div>
                    <select id="genreSelect">
                        <option value="">Chọn thể loại</option>
                    </select>
                </div>
                <div>
                    <select id="languageSelect">
                        <option value="">Chọn ngôn ngữ</option>
                    </select>
                </div>
                <div>
                    <select id="publisherSelect">
                        <option value="">Chọn nhà xuất bản</option>
                    </select>
                </div>
            </div>
            <div id="bookDetails">
                <c:forEach var="book" items="${books}">
                    <p>${book.title}</p>
                    <p>${book.publisher}</p>
                    <p>${book.language}</p>
                </c:forEach>
            </div> 
            <div>
                <div><button id="SortByBestSeller"> Bán chạy nhất</button><br></div>
                <div><button id="SortByBestSale"> Giảm nhiều nhất</button><br></div>
                <div><button id="SortByHighestPrice"> Giá từ cao đến thấp</button><br></div>
                <div><button id="SortByLowestPrice"> Giá từ thấp đến cao</button><br></div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
        
        <jsp:include page="/Views/foot.jsp"/>
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/Views/Customer/Home/script.js"></script>
    </body>
</html