<%-- 
    Document   : SignupBookStore
    Created on : Oct 8, 2023, 3:45:03 PM
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
                <img src="/image/logo.png" style="height: 40px;">
            </div>
        </header>

        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 800px;">
                <div class="col-md-5 ">
                    <div class="card p-4" >
                        <form  action="signup" class="form-signup" method="post" >
                            <h1 class="text-center mb-3">Đăng ký</h1>
                            
                              <p class=" text-danger">${mess}</p>
                            
                            <input name="fullname" type="text" class="form-control mb-3" placeholder="Họ và tên"  required="">
                            <input name="sdt" type="text" class="form-control mb-3" placeholder="Số điện thoại"  required="">
                            <input name="mail" type="email" class="form-control mb-3" placeholder="Địa chỉ Email"  required="">
                            <br>
                            <input name="username" type="text" class="form-control mb-3" placeholder="Tên đăng nhập" required="">
                            <input name="pass" type="password" class="form-control mb-3" placeholder="Mật khẩu" required="">
                            <input name="repass" type="password" class="form-control mb-3" placeholder="Nhập lại mật khẩu" required="">
                            
                             <br>
                            
                            
                            <label class="mb-2">Giới tính</label>
                            <div  class="d-flex mb-3">
                                <div class="form-check mx-2">
                                    <input name="a" type="radio" class="form-check-input" name="radio"  required="">
                                    <label class="form-check-label">Nam</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input name="a" type="radio" class="form-check-input"  name="radio"  required="">
                                    <label class="form-check-label">Nữ</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input name="a" type="radio" class="form-check-input" name="radio"  required="">
                                    <label class="form-check-label">Khác</label>
                                </div>                  
                            </div>
                           
                            
                            
                           
                            
                            <label class="mb-2">Ngày sinh</label>
                            <input name="namsinh" type="date" class="form-control mb-3"  required="">
                            <br>
                            <button class="btn btn-primary w-100 mb-2" type="submit"><i class="fa fa-user-plus"></i> Đăng ký</button>
                            <br>
                            <a href="LoginBookStore.jsp" ><i class="fa fa-angle-left mx-2"></i>Quay lại</a>
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