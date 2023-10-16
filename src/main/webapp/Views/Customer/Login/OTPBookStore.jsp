<%-- 
    Document   : OTPBookStore
    Created on : Oct 16, 2023, 8:17:19 PM
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
        <jsp:include page="/Views/header.jsp"/>

        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 600px;">
                <div class="col-md-6">
                    <div class="card p-4" >
                        <form action="${pageContext.request.contextPath}/otp" method="post" >
                            <h1 class="text-center mb-3">Thiết đặt lại mật khẩu</h1>
                            <p>Một mã xác nhận gồm 6 chữ số vừa được gửi đến Email của bạn.</p>
                            <p class=" text-danger">${mess}</p>

                            <div class="d-flex justify-content-center mb-3">
                                <input type="text" name="otp" placeholder="Nhập mã xác nhận" >
                            </div>
                            <button class="btn btn-primary w-100" type="submit" >Thiết đặt lại mật khẩu</button>
                            <hr>
                            <p>Trong trường hợp không nhận được mã xác nhận, vui lòng kiểm tra mục Thư rác hoặc Spam.</p>

 </form>
                            <form action="${pageContext.request.contextPath}/otp" method="get">
                            <button class="btn btn-secondary w-100" type="submit"  >Gửi lại mã xác nhận (60 giây)</button>
                       </form>



                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
    </body>

</html>
