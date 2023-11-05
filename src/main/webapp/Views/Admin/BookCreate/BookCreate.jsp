<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm sách mới</title>
        <jsp:include page="/Views/head.jsp"/>
        <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
        <link rel="stylesheet" href="/Views/Admin/BookCreate/select.css"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container">
                <form id="submit" action="/Manager/Book/Create" method="post" enctype="multipart/form-data">

                    <h1 class="text-center mt-3 mb-3">Thêm sách mới</h1>

                    <h5>Mã sách</h5>
                    <div class="text-danger" id="errId"></div>
                    <input type="number" name="txtBookId" class="form-control mb-3" placeholder="Mã sách">

                    <h5>Tên sách</h5>
                    <div class="text-danger" id="errTitle"></div>
                    <input type="text" name="txtTitle" class="form-control mb-3" placeholder="Tên sách">

                    <h5>Mô tả</h5>
                    <div class="text-danger" id="errDescription"></div>
                    <textarea name="txtDescription" class="form-control mb-3" style="resize: none;" rows="8" placeholder="Mô tả"></textarea>

                    <hr> 

                    <h5>Giá giảm</h5>
                    <div class="text-danger" id="errSalePrice"></div>
                    <input type="number" name="txtSalePrice" class="form-control mb-3" placeholder="Giá giảm">

                    <h5>Giá gốc</h5>
                    <div class="text-danger" id="errPrice"></div>
                    <input type="number" name="txtPrice" class="form-control mb-3" placeholder="Giá gốc">

                    <hr>

                    <h5 class="d-inline-block">Nhà xuất bản</h5>
                    <div class="text-danger" id="errPublisher"></div>
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

                    <h5 class="d-inline-block">Tác giả</h5>
                    <div class="text-danger" id="errAuthor"></div>
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

                    <h5 class="d-inline-block">Thể loại</h5>
                    <div class="text-danger" id="errGenre"></div>
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

                    <h5 class="d-inline-block">Ngôn ngữ</h5>
                    <div class="text-danger" id="errLanguage"></div>
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
                    <div class="text-danger mb-2" id="errThumbnail"></div>
                    <div class="thumbnail-upload">
                        <div class="upload-thumbnail mx-2 my-3">
                            <!-- Image here -->
                        </div>
                        <div class="upload-thumbnail-area btn btn-primary">
                            Tải ảnh lên
                        </div>
                    </div>

                    <h5 class="mt-3">Ảnh minh họa</h5>      
                    <div class="text-danger mb-2" id="errPictures"></div>
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

        <jsp:include page="/Views/foot.jsp"/>            
        <script src="/Views/Admin/BookCreate/uploadPicture.js"></script>
        <script src="/Views/Admin/BookCreate/selectPublisher.js"></script>
        <script src="/Views/Admin/BookCreate/selectLanguage.js"></script>
        <script src="/Views/Admin/BookCreate/selectGenre.js"></script>
        <script src="/Views/Admin/BookCreate/selectAuthor.js"></script>
        <script src="/Views/Admin/BookCreate/submit.js"></script>
    </body>
</html