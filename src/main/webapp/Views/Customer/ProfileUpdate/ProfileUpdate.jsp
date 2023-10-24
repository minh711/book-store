<%-- 
    Document   : ProfileUpdate
    Created on : Oct 22, 2023, 1:05:59 PM
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>


        <main class="bg-light">
            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-8">
                    <div class="bg-white p-4" >

                        <form>
                            <form action="/Profile/Update" method="post">
                                <h1 class="text-center mb-3">Thông tin tài khoản</h1>
                                <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                                <input type="text" class="form-control mb-3"  value="${profileDetail.fullName}" name="fullName">
                                <label class="mb-2 text-primary text-opacity-50"  >Số điện thoại</label>
                                <input type="text" class="form-control mb-3" readonly value="${profileDetail.phone}" name="phone">
                                <label class="mb-2 text-primary text-opacity-50" >Địa chỉ Email</label>
                                <input type="email" class="form-control mb-3" readonly value="${profileDetail.email}" name="email">
                                <label class="mb-2 text-primary text-opacity-50">Tên đăng nhập</label>
                                <input type="text" class="form-control mb-3"  value="${profileDetail.username}" name="username">
                                <label class="mb-2 text-primary text-opacity-50" >Mật khẩu</label>
                                <input type="password" class="form-control mb-3" value="" name="password">
                                <label class="mb-2 text-primary text-opacity-50" >Nhập lại mật khẩu</label>
                                <input type="password" class="form-control mb-3" name="resetPWD">
                                <label class="mb-2 text-primary text-opacity-50">Giới tính</label>
                                <div class="d-flex mb-3" >
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input"  value="Nam" name="gender" ${profileDetail.gender=='Nam'?'checked':''}>
                                        <label class="form-check-label">Nam</label>
                                    </div>
                                    <div class="form-check mx-2">
                                        <input type="radio" class="form-check-input"  value="Nữ" name="gender" ${profileDetail.gender=='Nữ'?'checked':''}>
                                        <label class="form-check-label">Nữ</label>
                                    </div>
                                    <div class="form-check mx-2">
                                        <input type="radio" class="form-check-input"  value="Khác" name="gender" ${profileDetail.gender=='Khác'?'checked':''}>
                                        <label class="form-check-label">Khác</label>
                                    </div>                  
                                </div>
                                <label class="mb-2 text-primary text-opacity-50" >Ngày sinh</label>
                                <input type="date" class="form-control mb-3"  name="birthday" value="${profileDetail.birthdate}">

                                <div class="card p-3">
                                    <label class="mb-2">Địa chỉ đã lưu</label>
                                    <div id="addresses"></div>
                                    <hr>
                                    <div>Thêm địa chỉ mới</div>
                                    <div class="row mt-3">
                                        <div class="col-6">
                                            <input type="text" class="form-control" placeholder="Họ và tên" name="fullNameAdd">
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="form-control" placeholder="Số điện thoại" name="phoneAdd">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-10">
                                            <input type="text" class="form-control" placeholder="Địa chỉ" name="addressAdd">
                                        </div>
                                        <button onclick="AddAddress();" class="btn btn-primary col-2 " style="width: 120px;">Thêm</button>
                                    </div>
                                </div>

                                <button class=" mt-3 btn btn-danger w-100" type="submit">Lưu thay đổi</button>
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
            $(document).ready(function () {
                LoadAddress();
            });

            function AddAddress() {
                var customerId =${customerId};
                var fullNameAdd = $("input[name='fullNameAdd']").val();
                var phoneAdd = $("input[name='phoneAdd']").val();
                var addressAdd = $("input[name='addressAdd']").val();
                $.ajax({
                    url: '/Address', // Đường dẫn đến Servlet Java xử lý xóa địa chỉ
                    type: 'post',
                    data: {
                        customerId: customerId,
                        fullNameAdd: fullNameAdd,
                        phoneAdd: phoneAdd,
                        addressAdd: addressAdd
                    },
                    success: function () {
                        LoadAddress();
                    },
                    error: function () {
                        alert('Có lỗi xảy ra khi gửi yêu cầu.');
                    }
                });
            }

            function LoadAddress() {
                $.ajax({
                    url: '/Address',
                    type: 'post',
                    data: {
                        customerId: ${customerId},
                        isLoad: true
                    },
                    success: function (response) {
                        let addresses = $('#addresses');
                        addresses.empty();
                        addresses.append(response);
                    },
                    error: function () {
                        alert('Có lỗi xảy ra khi gửi yêu cầu.');
                    }
                });
            }

            function deleteAddress(button) {
                let addressId = $(button).data('id');
                var confirmation = confirm('Bạn chắc chắn muốn xóa địa chỉ này?');
                if (confirmation) {
                    $.ajax({
                        url: '/Address',
                        type: 'post',
                        data: {
                            deleteAddressId: addressId
                        },
                        success: function () {
                            LoadAddress();
                        },
                        error: function () {
                            alert('Có lỗi xảy ra khi gửi yêu cầu.');
                        }
                    });
                }
            }
        </script>
    </body>

</html>
