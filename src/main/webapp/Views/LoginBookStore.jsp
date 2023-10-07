<%-- 
    Document   : Login
    Created on : Oct 6, 2023, 4:10:42 PM
    Author     : ASP_REF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
<!--        <script defer="" src="LoginValidate.js"></script>      -->

        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>

    <body>
        <header class="d-flex p-2">
            <div class="d-flex align-items-center justify-content-between">
                <img src="${pageContext.request.contextPath}/Images/logo.jpg"  style="height: 40px;">
            </div>
        </header>

        <main class="bg-light">
            <div class="container d-flex align-items-center" style="height: 800px;">
                <div class="col-md-8 d-flex justify-content-center align-items-center">
                    <img src="${pageContext.request.contextPath}/Images/logo-large.jpg" >
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <form id="form" action="${pageContext.request.contextPath}/login" method="post">
                            <h1 class="text-center mb-3">Đăng nhập</h1>
                            
                             <p  class=" text-danger">${mess}</p>
                             <div id ="mess"> </div>
                            <input type="text" class="form-control mb-3" placeholder="Tên tài khoản"  required="" name="name" value="${cookie.user.value}" >
                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu"  required="" name="pass" value="${cookie.pass.value}" >
                            
                            
                            <input type="checkbox" ${(cookie.rem.value eq 'ON')?"checked":""} name="rem" value="ON" /> Ghi nh? m?t kh?u<br><br> 
                            
                            <button class="btn btn-success btn-block mb-3 w-100" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button><br>
                            
                            <a href="#">Quên mật khẩu?</a>
                            <hr>
                            <button class="btn btn-primary btn-block w-100" type="button"><i class="fa fa-user-plus"></i> Tạo tài khoản mới</button><br>
                            <a href="sample.jsp" >Back</a>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-4">
                        <img src="/image/logo.png" alt="" style="height: 40px;">
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
    </body>

</html>