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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/add-book-picture/style.css""/>
</head>

<body>
    <jsp:include page="/Views/header.jsp"/>

    <main class="bg-light d-flex">
        <jsp:include page="/Views/aside.jsp"/>
        
        <div class="container">
            <input type="file" class="form-control" id="pics" name="fPics" multiple>
            
            <div class="d-flex d-none" id="select-btns">
                <button onclick="return selectAll();" id="btn-select-all" class="btn btn-link">Chọn tất cả</button>
                <button onclick="return unselectAll();" id="btn-unselect-all" class="btn btn-link" disabled>Bỏ chọn tất cả</button>
                <button onclick="return deleteSelected()" id="btn-delete-selected" class="btn btn-link" disabled>Xoá tất cả hình ảnh đã chọn</button>
            </div>
                  
            <div class="row" id="bookPictures"></div>
        </div>
    </main>
    
    <jsp:include page="/Views/footer.jsp"/>
    
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>                
    <script src="${pageContext.request.contextPath}/Views/add-book-picture/scripts.js"></script>
</body>

</html