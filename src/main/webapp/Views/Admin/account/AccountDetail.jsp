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
        <header class="d-flex justify-content-between" style="padding: 10px;">
            <div class="d-flex align-items-center justify-content-between">
                <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <a class="text-dark text-center nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-bell mx-2"></i><br>
                        Thông báo <span class="text-danger">(3)</span>
                    </a>
                    <div class="dropdown">
                        <a class="text-dark nav-link dropdown-toggle" type="button" id="dropdownMenuButton1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Xin chào,<br>Nguyễn Văn B
                        </a>
                        <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item p-2" href="#">Đơn hàng</a></li>
                            <li><a class="dropdown-item p-2" href="#">Thông tin tài khoản</a></li>
                            <li><a class="dropdown-item p-2" href="#">Đăng xuất <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <main class="bg-light d-flex">
            <aside>
                <div class="flex-shrink-0 p-3" style="width: 280px;">
                    <a href="#"
                       class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                        Bộ phận Quản lý Nhân sự
                    </a>
                    <ul class="list-unstyled ps-0">
                        <li class="mb-1">
                            <a class="text-dark nav-link">Danh sách tài khoản</a>
                        </li>
                        <li class="mb-1 bg-primary rounded">
                            <a href="${pageContext.request.contextPath}/Views/account-update/AccountUpdate.jsp" class="text-light nav-link">Chỉnh sửa tài khoản</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-12">
                    <div class="bg-white rounded p-4" >
                        <form action="/AccountDetail" method="POST">
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
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-4">
                        <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="" style="height: 40px;">
                        <div>
                            <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                        </div>
                    </div>
                    <div class="col-md-4 p-4">
                        <div class="d-flex">
                            <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                            <div>
                                business@oceanbook.com
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex justify-content-between p-4">
                        <i class="fa-brands fa-facebook"></i>
                        <i class="fa-brands fa-facebook-messenger"></i>
                        <i class="fa-brands fa-youtube"></i>
                    </div>
                </div>
            </div>
        </footer>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            new DataTable('#example');
        </script>


    </body>

</html>