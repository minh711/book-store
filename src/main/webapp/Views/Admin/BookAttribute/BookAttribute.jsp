<%-- 
    Document   : BookAttribute
    Created on : Nov 1, 2023, 10:52:13 PM
    Author     : DuyenLTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="${pageContext.request.contextPath}/Views/Admin/BookAttribute/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>
            <div class="container">
                <h1 class="text-center mb-3">Danh mục Sách</h1>

                <div class="mt-3 bg-white rounded p-4 mb-3">
                    <h5>Tác giả</h5>
                    <c:forEach var="author" items="${authors}">
                        <form action="/BookAttribute?authorId=${author.id}" method="post">
                            <div class="input-group mt-3 mb-3">
                                <input type="text" class="form-control" name="authorName" value="${author.author}" readonly>
                                <span class="input-group-text">
                                    <i class="mx-2 fa-solid fa-pen-to-square" onclick="enableEdit(this)"></i>
                                </span>
                            </div>

                            <button  class="btn btn-primary  align-right" type="submit" style="display: none;">Save</button>
                        </form>
                        <div class="form-container">
                            <form action="/BookAttribute?deleteAuthorId=${author.id}" method="post">
                                <button class="btn btn-danger" onclick="enableDelete(this)">Xóa</button>
                            </form>
                        </div>
                    </c:forEach>

                    <h5>Thể loại</h5>

                    <c:forEach var="genre" items="${genres}">
                        <form action="/BookAttribute?genreId=${genre.id}" method="post">
                            <div class="input-group mt-3 mb-3">
                                <input type="text" class="form-control" name="genreName" value="${genre.genre}" readonly>
                                <span class="input-group-text">
                                    <i class="mx-2 fa-solid fa-pen-to-square" onclick="enableEdit(this)"></i>
                                </span>
                            </div>

                            <button  class="btn btn-primary  align-right" type="submit" style="display: none;">Save</button>
                        </form>
                        <div class="form-container">
                            <form action="/BookAttribute?deleteGenreId=${genre.id}" method="post">
                                <button class="btn btn-danger" onclick="enableDelete(this)">Xóa</button>
                            </form>
                        </div>
                    </c:forEach>

                    <h5>Ngôn ngữ</h5>
                    <c:forEach var="language" items="${languages}">
                        <form action="/BookAttribute?languageId=${language.id}" method="post">
                            <div class="input-group mt-3 mb-3">
                                <input type="text" class="form-control" name="languageName" value="${language.language}" readonly>
                                <span class="input-group-text">
                                    <i class="mx-2 fa-solid fa-pen-to-square" onclick="enableEdit(this)"></i>
                                </span>
                            </div>

                            <button  class="btn btn-primary  align-right" type="submit" style="display: none;">Save</button>
                        </form>
                        <div class="form-container">
                            <form action="/BookAttribute?deleteLanguageId=${language.id}" method="post">
                                <button class="btn btn-danger" onclick="enableDelete(this)">Xóa</button>
                            </form>
                        </div>
                    </c:forEach>

                    <h5>Nhà xuất bản</h5>
                    <c:forEach var="publisher" items="${publishers}">
                        <form action="/BookAttribute?publisherId=${publisher.id}" method="post">
                            <div class="input-group mt-3 mb-3">
                                <input type="text" class="form-control" name="publisherName" value="${publisher.publisher}" readonly>
                                <span class="input-group-text">
                                    <i class="mx-2 fa-solid fa-pen-to-square" onclick="enableEdit(this)"></i>
                                </span>
                            </div>

                            <button  class="btn btn-primary  align-right" type="submit" style="display: none;">Save</button>
                        </form>
                        <div class="form-container">
                            <form action="/BookAttribute?deletePublisherId=${publisher.id}" method="post">
                                <button class="btn btn-danger" onclick="enableDelete(this)">Xóa</button>
                            </form>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </main>
        <jsp:include page="/Views/footer.jsp"/>
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

        <script>
            function enableEdit(editButton) {
                const inputField = editButton.parentElement.previousElementSibling;
                inputField.readOnly = false;
                editButton.style.display = 'none';

                // Show the Save button
                const saveButton = inputField.parentElement.nextElementSibling;
                saveButton.style.display = 'block';

                // When Save button is clicked, submit the form
                saveButton.addEventListener("click", function (event) {
                    event.preventDefault();
                    saveButton.style.display = 'none';
                    inputField.readOnly = true;
                    inputField.blur(); // Unfocus the input field
                    inputField.parentElement.parentElement.submit();
                });
            }

            function enableDelete(deleteButton) {
                // Show a confirmation dialog
                var confirmation = window.confirm('Bạn có thực sự muốn xóa?');

                if (confirmation) {
                    const form = deleteButton.closest('form');
                    form.submit();
                } else {
                    // Prevent the form from being submitted
                    event.preventDefault();
                }
            }


        </script>

    </body>
</html>

