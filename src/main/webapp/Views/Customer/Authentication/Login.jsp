<%-- 
    Document   : Login
    Created on : Oct 6, 2023, 4:10:42 PM
    Author     : DatNTT
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
             


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light">
            <div class="container d-flex align-items-center" style="height: 800px;">
                <div class="col-md-8 d-flex justify-content-center align-items-center">
                    <img src="${pageContext.request.contextPath}/Images/logo-large.jpg" >
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <form class="form" onsubmit="return validateForm();" action="${pageContext.request.contextPath}/login" method="post"   >
                            <h1 class="text-center mb-3">Đăng nhập</h1>

                            <p class=" text-danger">${mess}</p>

                            <input type="text" class="form-control mb-3" placeholder="Tên tài khoản"  required="" id="name" name="name" value="${cookie.user.value}"  >
                            <p class=" text-danger" id ="messName" ></p>

                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu"  required="" id="pass" name="pass" value="${cookie.pass.value}"   >
                            <p class=" text-danger" id ="messPass" ></p>

                            <input type="checkbox" ${(cookie.rem.value eq 'ON')?"checked":""} name="rem" value="ON" /> Ghi nhớ mật khẩu<br><br> 





                            <button class="btn btn-success btn-block mb-3 w-100"  value="Submit"  type="submit"><i class="fa fa-sign-in-alt"></i> Đăng nhập</button><br>



                            <a href="#">Quên mật khẩu?</a>
                            <hr>
                            <button onclick="window.location.href = 'SignupBookStore.jsp';"  class="btn btn-primary btn-block w-100"  type="button"> <i class="fa fa-user-plus"></i> Tạo tài khoản mới</button><br>



                            <a href="${pageContext.request.contextPath}/Views/sample.jsp" >Back</a>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/Views/Customer/Authentication/LoginValidate.js"></script> 
    </body>

</html>