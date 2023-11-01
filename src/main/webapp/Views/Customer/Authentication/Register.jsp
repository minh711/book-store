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
                        <form  onsubmit="return validateFormSignUp()"  action="${pageContext.request.contextPath}/Register" class="form" method="post" >
                            <h1 class="text-center mb-3">Đăng ký</h1>

                            <p class="error-message1 text-danger">${mess}</p>

                            <input type="text" class="form-control mb-3" placeholder="Họ và tên" name="fullName"   autofocus="" value="${mess2}">


                            <p class="error-message2 text-danger">${messP}</p>
                            <input type="text" class="form-control mb-3" placeholder="Số điện thoại" name="phone"   autofocus="" value="${mess3}">


                            <p class="error-message3 text-danger">${messE}</p>
                            <input type="text" class="form-control mb-3" placeholder="Địa chỉ Email" name="email"   autofocus="" value="${mess4}">


                            <p class="error-message4 text-danger">${messU}</p>
                            <input type="text" class="form-control mb-3" placeholder="Tên đăng nhập" name="username"   autofocus="" value="${mess5}">


                            <p class="error-message5 text-danger">${mess}</p>
                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu" name="password"  autofocus="" value="${mess6}">


                            <p class="error-message6 text-danger">${mess}</p>
                            <input type="password" class="form-control mb-3" placeholder="Nhập lại mật khẩu" name="resetPWD"   autofocus="" value="${mess7}" >



                            <p class="error-message7 text-danger">${mess}</p>
                            <label class="mb-2">Giới tính</label>
                            <div class="d-flex mb-3">
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input" value="Nam" name="gender" required="" ${mess9 == 'Nam' ? 'checked' : ''}>
                                    <label class="form-check-label">Nam</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Nữ" name="gender" required="" ${mess9 == 'Nữ' ? 'checked' : ''}>
                                    <label class="form-check-label">Nữ</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Khác" name="gender" required="" ${mess9 == 'Khác' ? 'checked' : ''}>
                                    <label class="form-check-label">Khác</label>
                                </div>                  
                            </div>



                            <p class="error-message8 text-danger">${mess}</p>
                            <label class="mb-2">Ngày sinh</label>
                            <input type="date" class="form-control mb-3" name="birthday"   value="${mess8}" autofocus="">



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
        <script src="${pageContext.request.contextPath}/Views/Customer/Authentication/RegisterValidate.js"></script>

    </body>
</html>