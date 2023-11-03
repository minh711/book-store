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
                               
        <jsp:include page="/Views/footer.jsp"/>
        
        <jsp:include page="/Views/foot.jsp"/>
        <script src="${pageContext.request.contextPath}/Views/Customer/Authentication/RePassValidate.js"></script> 
    </body>
</html>