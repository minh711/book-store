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
                <h1 class="text-center mt-3 mb-3">Danh mục Sách</h1>

                <div class="bg-white shadow rounded mt-4 p-4">
                    <h5>Nhà xuất bản</h5>
                    <div class="row">
                        <c:forEach var="publisher" items="${publishers}">
                        <div class="col-md-4">
                            <form action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="publisherId" value="${publisher.id}">
                                <div class="input-group mt-3 mb-3">
                                    <input id="textPublisher${publisher.id}" type="text" class="form-control" name="genreName" value="${publisher.publisher}" readonly disabled>
                                    <span onclick="enableEdit('Publisher' + ${publisher.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="mx-2 fa-solid fa-pen-to-square" ></i>
                                    </span>
                                    <span onclick="enableDelete('Publisher' + ${publisher.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="fa-solid fa-trash"></i>
                                    </span>
                                </div>
                            </form>
                            <form id="deleteFormPublisher${publisher.id}" action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="deletePublisherId" value="${publisher.id}">
                            </form>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                        
                <div class="bg-white shadow rounded mt-4 p-4">
                    <h5>Tác giả</h5>
                    <div class="row">
                        <c:forEach var="author" items="${authors}">
                            <div class="col-md-4">
                                <form action="/Manager/Book/Attribute" method="post">
                                    <input type="hidden" name="authorId" value="${author.id}">
                                    <div class="input-group mt-3 mb-3">
                                        <input id="textAuthor${author.id}" type="text" class="form-control" name="authorName" value="${author.author}" readonly disabled>
                                        <span onclick="enableEdit('Author' + ${author.id})" class="input-group-text" style="cursor: pointer;">
                                            <i class="mx-2 fa-solid fa-pen-to-square" ></i>
                                        </span>
                                        <span onclick="enableDelete('Author' + ${author.id})" class="input-group-text" style="cursor: pointer;">
                                            <i class="fa-solid fa-trash"></i>
                                        </span>
                                    </div>
                                </form>
                                <form id="deleteFormAuthor${author.id}" action="/Manager/Book/Attribute" method="post">
                                    <input type="hidden" name="deleteAuthorId" value="${author.id}">
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                    
                <div class="bg-white shadow rounded mt-4 p-4">
                    <h5>Thể loại</h5>
                    <div class="row">
                        <c:forEach var="genre" items="${genres}">
                        <div class="col-md-4">
                            <form action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="genreId" value="${genre.id}">
                                <div class="input-group mt-3 mb-3">
                                    <input id="textGenre${genre.id}" type="text" class="form-control" name="genreName" value="${genre.genre}" readonly disabled>
                                    <span onclick="enableEdit('Genre' + ${genre.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="mx-2 fa-solid fa-pen-to-square" ></i>
                                    </span>
                                    <span onclick="enableDelete('Genre' + ${genre.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="fa-solid fa-trash"></i>
                                    </span>
                                </div>
                            </form>
                            <form id="deleteFormGenre${genre.id}" action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="deleteGenreId" value="${genre.id}">
                            </form>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                        
                <div class="bg-white shadow rounded mt-4 p-4">
                    <h5>Ngôn ngữ</h5>
                    <div class="row">
                        <c:forEach var="language" items="${languages}">
                        <div class="col-md-4">
                            <form action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="languageId" value="${language.id}">
                                <div class="input-group mt-3 mb-3">
                                    <input id="textLanguage${language.id}" type="text" class="form-control" name="genreName" value="${language.language}" readonly disabled>
                                    <span onclick="enableEdit('Language' + ${language.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="mx-2 fa-solid fa-pen-to-square" ></i>
                                    </span>
                                    <span onclick="enableDelete('Language' + ${language.id})" class="input-group-text" style="cursor: pointer;">
                                        <i class="fa-solid fa-trash"></i>
                                    </span>
                                </div>
                            </form>
                            <form id="deleteFormlanguage${language.id}" action="/Manager/Book/Attribute" method="post">
                                <input type="hidden" name="deleteLanguageId" value="${language.id}">
                            </form>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/Views/footer.jsp"/>
        <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>             
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

        <script>
            function enableEdit(editButton) {
                const inputField = document.querySelector('#text' + editButton);
                inputField.readOnly = false;
                inputField.disabled = false;
//                editButton.style.display = 'none';

                // Show the Save button
//                const saveButton = inputField.parentElement.nextElementSibling;
//                saveButton.style.display = 'block';

                // When Save button is clicked, submit the form
//                saveButton.addEventListener("click", function (event) {
//                    event.preventDefault();
//                    saveButton.style.display = 'none';
//                    inputField.readOnly = true;
//                    inputField.blur(); // Unfocus the input field
//                    inputField.parentElement.parentElement.submit();
//                });
            }

            function enableDelete(deleteButton) {
                // Show a confirmation dialog
                var confirmation = window.confirm('Bạn có thực sự muốn xóa?');

                if (confirmation) {
                    // Find the parent form element with the "deleteForm" class
                    const form = document.querySelector('#deleteForm' + deleteButton);
                    if (form) {
                        // Submit the form
                        form.submit();
                    }
                } else {
                    // Prevent the form from being submitted
                    event.preventDefault();
                }
            }
        </script>
    </body>
</html>

