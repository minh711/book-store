<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>
        <main>
            <div class="container d-flex justify-content-center align-items-center" style="height: 600px;">
                <div class="col-md-6">
                    <div class="card p-4" >
                        <form onsubmit="return OTPCheck()" action="/ResetPassword" method="post" >
                            <h1 class="text-center mb-3">Thiết đặt lại mật khẩu</h1>
                            <p>Một mã xác nhận gồm 6 chữ số vừa được gửi đến Email của bạn.</p>
                             
                            <p class="error-message text-danger">${mess}</p>

                            <div class="d-flex justify-content-center mb-3">
                                <input type="text" id="inputOtp" name="otp" placeholder="Nhập mã xác nhận" autofocus="" required="">
                            </div>

                            <button class="btn btn-primary w-100" name="action" value="resetPassword" type="submit" >Thiết đặt lại mật khẩu</button>

                            <hr>
                            <p>Trong trường hợp không nhận được mã xác nhận, vui lòng kiểm tra mục Thư rác hoặc Spam.</p>

                        </form>
                        <form action="/ResetPassword" method="post" >
                            <button id="reSend"  name="action" value="resendOTP" class="btn btn-secondary w-100"  type="submit">Gửi lại mã xác nhận <span id="time"></span> </button>
                        </form>     

                        <form action="/ResetPassword" method="post">
                            <input type="hidden" name="btnCancel" value="Cancel">
                            <button id="cancel" name="cancel" >Cancel</button>
                        </form>
                            
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>
                        
        <jsp:include page="/Views/foot.jsp"/>
        <script src="/Views/Customer/Authentication/otpValidate.js"></script> 
    </body>
</html>
