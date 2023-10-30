<%@page import="Models.DBModels.BookPicture"%>
<%@page import="DAOs.DBModelDAOs.BookPictureDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Add Book Picture Component</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/Admin/BookCreate/select.css"/>
</head>

<body>
    <jsp:include page="/Views/header.jsp"/>

    <main class="bg-light d-flex">
        <jsp:include page="/Views/aside.jsp"/>
        
        <div class="container">
            <form id="submit" action="/BookCreateCtrl" method="post" enctype="multipart/form-data">
                
                <h1 class="text-center mt-3 mb-3">Thêm sách mới</h1>
            
                <h5>Mã sách</h5>
                <div class="text-danger" id="errId"></div>
                <input type="text" name="txtBookId" class="form-control mb-3" placeholder="Mã sách">

                <hr>

                <h5>Tên sách</h5>
                <input type="text" name="txtTitle" class="form-control mb-3" placeholder="Tên sách">

                <hr>

                <h5>Mô tả</h5>
                <textarea name="txtDescription" class="form-control mb-3" style="resize: none;" rows="8" placeholder="Mô tả"></textarea>

                <hr>

                <h5 class="d-inline-block">Nhà xuất bản</h5>
                <div class="select-publisher-container mb-3">
                    <div class="select-btn">
                        <span>Chọn một nhà xuất bản</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Tìm kiếm...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>

                <hr>

                <h5 class="d-inline-block">Tác giả</h5>
                <div class="select-author-container mb-3">
                    <div class="select-btn">
                        <span>Chọn tác giả</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Tìm kiếm...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>
                <div class="row">
                    <div class="d-flex flex-wrap selectedAuthors"></div>
                </div>

                <hr>

                <h5 class="d-inline-block">Thể loại</h5>
                <div class="select-genre-container mb-3">
                    <div class="select-btn">
                        <span>Chọn thể loại</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Tìm kiếm...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>
                <div class="row">
                    <div class="d-flex flex-wrap selectedGenres"></div>
                </div>

                <hr>

                <h5 class="d-inline-block">Ngôn ngữ</h5>
                <div class="select-language-container mb-3">
                    <div class="select-btn">
                        <span>Chọn một ngôn ngữ</span>
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div class="content">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="Tìm kiếm...">
                        </div>
                        <ul class="options"></ul>
                    </div>
                </div>

                <hr>

                <h5>Ảnh thu nhỏ</h5>
                <div class="thumbnail-upload">
                    <div class="upload-thumbnail mx-2 my-3">
                        <!-- Image here -->
                    </div>
                    <div class="upload-thumbnail-area btn btn-primary">
                        Tải ảnh lên
                    </div>

                </div>

                <hr>

                <h5>Ảnh minh họa</h5>                
                <div class="wrapper">
                    <div class="upload">
                        <div class="upload-wrapper">
                            <div class="upload-img row">
                                <!-- Image here !-->
                            </div>
                            <div class="upload-area">
                                <div class="upload-areq-img btn btn-primary">
                                    Tải ảnh lên
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr>
                <input type="file" id="upload-thumbnail-input" name="thumbnail" class="visually-hidden" >
                <input type="file" id="upload-input" name="pictures" class="visually-hidden" multiple>
                <input type="submit" class="form-control btn btn-danger" name="submit" value="Thêm Sách mới">
            </form>
        </div>
    </main>
    
    <jsp:include page="/Views/footer.jsp"/>
    
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>                
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/uploadPicture.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/selectPublisher.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/selectLanguage.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/selectGenre.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/selectAuthor.js"></script>
    <script src="${pageContext.request.contextPath}/Views/Admin/BookCreate/submit.js"></script>
</body>

</html