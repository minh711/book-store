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
    <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
</head>

<body>
    <header class="d-flex justify-content-between" style="padding: 10px;">
        <div class="d-flex align-items-center justify-content-between">
            <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
        </div>
    </header>

    <main class="bg-light d-flex">
        <aside>
            <div class="flex-shrink-0 p-3" style="width: 280px;">
                <a href="#" class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                    Sample
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <a href="#" class="text-light nav-link bg-primary rounded p-2">
                            Sample
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        
        <div class="container">
            <form class="form" id="form-pics" method="post" 
                  action="${pageContext.request.contextPath}/BookPictureUploadCtrl" 
                  onsubmit="return formValidate();" 
                  enctype="multipart/form-data">
                <input type="file" class="form-control" id="pics" name="fPics" multiple>
            </form>
                  
            <div class="row">
                <form class="form mt-2 mb-2" method="post"
                      action="${pageContext.request.contextPath}/BookPictureCtrl">
                    <input type="hidden" name="bookId" value="1">
                    <input type="submit" class="btn btn-danger" name="btnDeleteAllPics" value="Xóa tất cả">
                </form>
                <%
                    BookPictureDAO dao = new BookPictureDAO();
                    BookPicture[] bookPictures = dao.getAllByBookId(1);
                    for (int i = 0; i < bookPictures.length; i++) {
                %>
                <div class="mx-2 my-2" style="width: 120px;">
                    <form style="width: 120px;" class="form" method="post" 
                          action="${pageContext.request.contextPath}/BookPictureCtrl">
                        
                        <img style="width: 120px; height: 160px; object-fit: contain;" 
                             src="${pageContext.request.contextPath}/Images/<%= bookPictures[i].getPicture()%>">
                        
                        <input type="hidden" name="picId" value="<%= bookPictures[i].getId()%>">
                        
                        <button 
                            onclick="return confirm('Bạn có chắc muốn xóa hình ảnh này?')" 
                            class="mt-2 btn btn-danger form-control" 
                            type="submit" 
                            name="btnDeletePic" 
                        >Xóa</button>
                    </form>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 p-4">
                    <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="" style="height: 40px;">
                    <div>
                        <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                    </div>
                </div>
                <div class="col-md-4 p-4">
                    <div class="d-flex">
                        <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                        <div>
                            business@oceanbook.com
                        </div>
                    </div>
                </div>
                <div class="col-md-2 d-flex justify-content-between p-4">
                    <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-facebook-messenger"></i>
                    <i class="fa-brands fa-youtube"></i>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>                
    <script src="scripts.js"></script>
</body>

</html