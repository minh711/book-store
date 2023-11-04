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
        <jsp:include page="/Views/head.jsp"/>
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
                        <form class="form" onsubmit="return validateForm();" action="${pageContext.request.contextPath}/Login" method="post"   >
                            <h1 class="text-center mb-3">Đăng nhập</h1>

                            
                            
                            
                            <p class="error-message text-danger">${mess}</p>

                            <input type="text" class="form-control mb-3" placeholder="Tên tài khoản"  required="" autofocus="" id="name" name="name" value="${cookie.user.value}${mess2}"  >

                            
                              <p class="error-message2 text-danger">${mess3_1}</p>
                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu"  required="" autofocus="" id="pass" name="pass" value="${cookie.pass.value}${mess3}"   >


                            <input type="checkbox" ${(cookie.rem.value eq 'ON')?"checked":""} name="rem" value="ON" /> Ghi nhớ mật khẩu<br><br> 



                            <button class="btn btn-success btn-block mb-3 w-100"  value="Submit"  type="submit"><i class="fa fa-sign-in-alt"></i> Đăng nhập</button><br>



                            <a href="/ResetPassword">Quên mật khẩu?</a>
                            <hr>
                            <button onclick="window.location.href = '${pageContext.request.contextPath}/Views/Customer/Authentication/Register.jsp';"  class="btn btn-primary btn-block w-100"  type="button"> <i class="fa fa-user-plus"></i> Tạo tài khoản mới</button><br>



                            <a href="${pageContext.request.contextPath}/Views/Customer/Home/Home.jsp" >Back</a>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        <script src="${pageContext.request.contextPath}/Views/Customer/Authentication/LoginValidate.js"></script> 
    </body>

</html>