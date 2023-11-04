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
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-12">
                    <div class="bg-white rounded p-4" >
                        <form action="/Manager/Account/Update" method="POST">
                            <a href="/Manager/Account/Update?id=${id}" class="btn btn-primary mb-3" ${accountDetail.roleName=='Khách hàng'?'disable':''}>Chỉnh sửa tài khoản</a>
                            <br>
                            <a href="/Manager/Account/Delete?id=${id}" onclick="return confirm('Bạn chắc chắc muốn xóa tài khoản này?');" class="btn btn-danger mb-3" style="width: 165px;">Xóa tài khoản</a>
                            <h1 class="text-center mb-3">Thông tin tài khoản</h1>
                            <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                            <input type="text" class="form-control mb-3" readonly="" value=" ${accountDetail.fullName}" name="fullName">
                            <label class="mb-2 text-primary text-opacity-50" readonly="">Số điện thoại</label>
                            <input type="text" class="form-control mb-3" readonly="" value="${accountDetail.phone}" name="phone">
                            <label class="mb-2 text-primary text-opacity-50" readonly="">Địa chỉ Email</label>
                            <input type="email" class="form-control mb-3" readonly="" value=" ${accountDetail.email}" name="email">
                            <label class="mb-2 text-primary text-opacity-50">Tên đăng nhập</label>
                            <input type="text" class="form-control mb-3" readonly="" value="${accountDetail.username}" name="username">

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
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
    </body>
</html>