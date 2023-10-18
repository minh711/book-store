<%-- 
    Document   : createAccount
    Created on : Oct 7, 2023, 10:49:13 PM
    Author     : DuyenLTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Blank Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-12">
                    <div class="bg-white rounded p-4" >
                        <form action="/Account/Update" method="POST">
                            <h1 class="text-center mb-3">Thông tin tài khoản</h1>
                            <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                            <input type="text" class="form-control mb-3" readonly="" value="<c:out value="${accountDetail.fullName}" ></c:out>" name="fullName">
                                <label class="mb-2 text-primary text-opacity-50" readonly="">Số điện thoại</label>
                                <input type="text" class="form-control mb-3" readonly="" value="<c:out value="${accountDetail.phone}"  ></c:out>" name="phone">
                                <label class="mb-2 text-primary text-opacity-50" readonly="">Địa chỉ Email</label>
                                <input type="email" class="form-control mb-3" readonly="" value="<c:out value="${accountDetail.email}" ></c:out>"  name="email">
                                <label class="mb-2 text-primary text-opacity-50">Tên đăng nhập</label>
                                <input type="text" class="form-control mb-3" readonly="" value="<c:out value="${accountDetail.username}"  ></c:out>" name="username">
                                <label class="mb-2 text-primary text-opacity-50" >Mật khẩu</label>
                                <input type="password" class="form-control mb-3" readonly="" value="<c:out value="${accountDetail.password}"  ></c:out>" name="password">
                                <label class="mb-2 text-primary text-opacity-50">Giới tính</label>
                                <div class="d-flex mb-3" >
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" disabled value="Nam" name="gender" ${accountDetail.gender=='Nam'?'checked':''}>
                                    <label class="form-check-label">Nam</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input" disabled value="Nữ" name="gender" ${accountDetail.gender=='Nữ'?'checked':''}>
                                    <label class="form-check-label">Nữ</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input" disabled value="Khác" name="gender" ${accountDetail.gender=='Khác'?'checked':''}>
                                    <label class="form-check-label">Khác</label>
                                </div>                  
                            </div>
                            <label class="mb-2 text-primary text-opacity-50" >Ngày sinh</label>
                            <input type="date" class="form-control mb-3" readonly="" name="birthday" value="${accountDetail.birthdate}">
                            <label class="mb-2 text-primary text-opacity-50" >Chức vụ</label>
                            <select class="form-select" name="roleId" disabled >
                                <option value="${accountDetail.roleName}" >${accountDetail.roleName}</option>
                            </select>

                            <a href="/Account/Update?id=${id}" class="w-100 mt-3 btn btn-primary" ${accountDetail.roleName=='Khách hàng'?'disable':''}>Cập nhật tài khoản</a>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            new DataTable('#example');
        </script>
    </body>

</html>