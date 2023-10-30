<%-- 
    Document   : ResetMailBookStore
    Created on : Oct 17, 2023, 6:19:52 PM
    Author     : ASP_REF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Register</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>

    <body>
        <header class="d-flex p-2">
            <div class="d-flex align-items-center justify-content-between">
                <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
            </div>
        </header>

        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 600px;">
                <div class="col-md-6">
                    <div class="card p-4" >
                        <form onsubmit="return validateFormRePass()" action="${pageContext.request.contextPath}/Reset" method="post">
                            <h1 class="text-center mb-3">Thiết đặt lại mật khẩu</h1>
                            <p>Nhập mật khẩu mới của bạn</p>
                            
                             <p class="error-message text-danger">${mess}</p>
                             
                             
                             
                             <input type="password" class="form-control mb-3" name="Repass" placeholder="Mật khẩu" required="">
                             <input type="password" class="form-control mb-3" name="Cepass" placeholder="Nhập lại mật khẩu" required="">
                            <button class="btn btn-primary w-100" type="submit">Xác nhận</button>
                        </form>
                             
                             
                             
                        <form action="${pageContext.request.contextPath}/Cancel" method="post">
                               <button id="cancel" name="cancel" >Cancel</button>
                        </form>
                            
                            
                    </div>
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
        <script src="${pageContext.request.contextPath}/Views/Customer/Authentication/RePassValidate.js"></script> 
    </body>

</html>