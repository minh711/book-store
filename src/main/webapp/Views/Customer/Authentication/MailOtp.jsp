<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thiết đặt lại mật khẩu</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 600px;">
                <div class="col-md-6">
                    <div class="card p-4" >
                        <form onsubmit="return validateFormReEmail()" action="/ResetPassword" method="post">
                            <h1 class="text-center mb-3">Thiết đặt lại mật khẩu</h1>
                            <p>Nhập địa chỉ Email mà bạn đã dùng để đăng ký tài khoản, chúng tôi sẽ gửi một mã xác nhận vào Email của bạn.</p>
                           
                            <p class="error-message text-danger">${mess}</p>
                          
                            <input type="email" class="form-control mb-3" name="email" placeholder="Địa chỉ Email" required="" id="mail" autofocus="" value="${mess2}">
                            <button class="btn btn-primary w-100" type="submit">Gửi mã xác nhận</button>
                        </form>
                         
                        <a href="/Login" ><button type="button">Cancel</button></a>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
                               
        <jsp:include page="/Views/foot.jsp"/>
        <script src="/Views/Customer/Authentication/ReEmailValidate.js"></script>
    </body>
</html>
