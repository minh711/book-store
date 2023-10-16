<%-- 
    Document   : SignupBookStore
    Created on : Oct 8, 2023, 3:45:03 PM
    Author     : DatNTT
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
        <jsp:include page="/Views/header.jsp"/>

        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 800px;">
                <div class="col-md-5 ">
                    <div class="card p-4" >
                        <form  onsubmit="return validateFormSignUp()"  action="${pageContext.request.contextPath}/signup" class="form" method="post" >
                            <h1 class="text-center mb-3">Đăng ký</h1>

                            <p class=" text-danger">${mess}</p>

                            <input type="text" class="form-control mb-3" placeholder="Họ và tên" name="fullName" required="">
                            <input type="text" class="form-control mb-3" placeholder="Số điện thoại" name="phone" required="">
                            <input type="email" class="form-control mb-3" placeholder="Địa chỉ Email" name="email" required="">
                            <input type="text" class="form-control mb-3" placeholder="Tên đăng nhập" name="username" required="">
                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu" name="password" required="">
                            <input type="password" class="form-control mb-3" placeholder="Nhập lại mật khẩu" name="resetPWD" required="">




                            <label class="mb-2">Giới tính</label>
                            <div class="d-flex mb-3">
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input" value="Nam" name="gender" required="">
                                    <label class="form-check-label">Nam</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Nữ" name="gender" required="">
                                    <label class="form-check-label">Nữ</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Khác" name="gender" required="">
                                    <label class="form-check-label">Khác</label>
                                </div>                  
                            </div>




                            <label class="mb-2">Ngày sinh</label>
                            <input type="date" class="form-control mb-3" name="birthday" required="">



                            <br>
                            <button class="btn btn-primary w-100 mb-2"  type="submit"><i class="fa fa-user-plus"></i> Đăng ký</button>
                            <br>
                            <a href="LoginBookStore.jsp" ><i class="fa fa-angle-left mx-2"></i>Quay lại</a>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="/Views/Customer/Login/SignupValidate.js"></script>

    </body>
</html>