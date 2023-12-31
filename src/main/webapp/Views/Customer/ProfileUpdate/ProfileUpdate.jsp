<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Thông tin cá nhân</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light">
            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-8">
                    <div class="bg-white p-4" >
                        <c:if test="${profileDetail.roleName.equals('Khách hàng')}">
                        <form action="/Profile/Update?id=${customerId}" method="post">
                            <h1 class="text-center mb-3">Thông tin tài khoản</h1>
                            <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                            <input type="text" class="form-control mb-3"  value="${profileDetail.fullName}" name="fullName">
                            
                            <label class="mb-2 text-primary text-opacity-50"  >Số điện thoại</label>
                            <input type="text" class="form-control mb-3" value="${profileDetail.phone}" name="phone">
                            
                            <label class="mb-2 text-primary text-opacity-50" >Địa chỉ Email</label>
                            <input type="email" class="form-control mb-3"  value="${profileDetail.email}" name="email">
                            
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
                                    
                                    <button onclick="return validateAddress();" id="AddButton" class="btn btn-primary col-2 " style="width: 120px;">Thêm</button>
                                </div>
                            </div>

                            <button class=" mt-3 btn btn-danger w-100" type="submit" onclick="return validateForm()">Lưu thay đổi</button>
                        </form>
                        </c:if>

                        <c:if test="${profileDetail.roleName.equals('Quản lí Sách') || profileDetail.roleName.equals('Quản lí Đơn')}">
                            <form action="/Profile/Update?id=${customerId}" method="post">
                                <h1 class="text-center mb-3">Thông tin tài khoản</h1>
                                
                                <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                                <input type="text" class="form-control mb-3" readonly value="${profileDetail.fullName}" name="fullName">
                                
                                <label class="mb-2 text-primary text-opacity-50"  >Số điện thoại</label>
                                <input type="text" class="form-control mb-3" readonly value="${profileDetail.phone}" name="phone">
                                
                                <label class="mb-2 text-primary text-opacity-50" >Địa chỉ Email</label>
                                <input type="email" class="form-control mb-3" readonly value="${profileDetail.email}" name="email">
                                
                                <label class="mb-2 text-primary text-opacity-50">Tên đăng nhập</label>
                                <input type="text" class="form-control mb-3" readonly value="${profileDetail.username}" name="username">
                                
                                <label class="mb-2 text-primary text-opacity-50" >Mật khẩu</label>
                                <input type="password" class="form-control mb-3" value="" name="password">
                                
                                <label class="mb-2 text-primary text-opacity-50" >Nhập lại mật khẩu</label>
                                <input type="password" class="form-control mb-3" name="resetPWD">
                                
                                <label class="mb-2 text-primary text-opacity-50">Giới tính</label>
                                <div class="d-flex mb-3"   >
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" disabled value="Nam" name="gender" ${profileDetail.gender=='Nam'?'checked':''}>
                                        <label class="form-check-label">Nam</label>
                                    </div>
                                    
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" disabled value="Nữ" name="gender" ${profileDetail.gender=='Nữ'?'checked':''}>
                                        <label class="form-check-label">Nữ</label>
                                    </div>
                                    
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" disabled value="Khác" name="gender" ${profileDetail.gender=='Khác'?'checked':''}>
                                        <label class="form-check-label">Khác</label>
                                    </div>                  
                                </div>
                                
                                <label class="mb-2 text-primary text-opacity-50" >Ngày sinh</label>
                                <input type="date" class="form-control mb-3" readonly name="birthday" value="${profileDetail.birthdate}">
                                
                                <button class=" mt-3 btn btn-danger w-100" type="submit" onclick="return validateForm()">Lưu thay đổi</button>
                            </form>
                        </c:if>
                        
                        <c:if test="${profileDetail.roleName.equals('Admin')}">
                            <form action="/Profile/Update?id=${customerId}" method="post">
                                <h1 class="text-center mb-3">Thông tin tài khoản</h1>

                                <label class="mb-2 text-primary text-opacity-50" >Họ và tên</label>
                                <input type="text" class="form-control mb-3" value="${profileDetail.fullName}" name="fullName">

                                <label class="mb-2 text-primary text-opacity-50"  >Số điện thoại</label>
                                <input type="text" class="form-control mb-3" value="${profileDetail.phone}" name="phone">

                                <label class="mb-2 text-primary text-opacity-50" >Địa chỉ Email</label>
                                <input type="email" class="form-control mb-3" value="${profileDetail.email}" name="email">

                                <label class="mb-2 text-primary text-opacity-50">Tên đăng nhập</label>
                                <input type="text" class="form-control mb-3" readonly value="${profileDetail.username}" name="username">

                                <label class="mb-2 text-primary text-opacity-50" >Mật khẩu</label>
                                <input type="password" class="form-control mb-3" value="" name="password">

                                <label class="mb-2 text-primary text-opacity-50" >Nhập lại mật khẩu</label>
                                <input type="password" class="form-control mb-3" name="resetPWD">

                                <label class="mb-2 text-primary text-opacity-50">Giới tính</label>
                                <div class="d-flex mb-3"   >
                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" value="Nam" name="gender" ${profileDetail.gender=='Nam'?'checked':''}>
                                        <label class="form-check-label">Nam</label>
                                    </div>

                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" value="Nữ" name="gender" ${profileDetail.gender=='Nữ'?'checked':''}>
                                        <label class="form-check-label">Nữ</label>
                                    </div>

                                    <div class="form-check mx-2" >
                                        <input type="radio" class="form-check-input" value="Khác" name="gender" ${profileDetail.gender=='Khác'?'checked':''}>
                                        <label class="form-check-label">Khác</label>
                                    </div>                  
                                </div>

                                <label class="mb-2 text-primary text-opacity-50" >Ngày sinh</label>
                                <input type="date" class="form-control mb-3" name="birthday" value="${profileDetail.birthdate}">

                                <button class=" mt-3 btn btn-danger w-100" type="submit" onclick="return validateForm()">Lưu thay đổi</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </main>
        
        <jsp:include page="/Views/footer.jsp"/>
        
        <jsp:include page="/Views/foot.jsp"/>
        <script src="${pageContext.request.contextPath}/Views/Customer/ProfileUpdate/script.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {                                                                                                                                                                                                              // @author DuyenLTM
                LoadAddress();
            });

            const fullNameAdd = document.querySelector('input[name="fullNameAdd"]');
            const phoneAdd = document.querySelector('input[name="phoneAdd"]');
            const addressAdd = document.querySelector('input[name="addressAdd"]');

            // Hàm kiểm tra xem một trường input có rỗng hay không
            function isEmpty(input) {
                return input.value.trim() === '';
            }
            // Hàm kiểm tra xem một chuỗi không vượt quá độ dài cho trước
            function isNotExceedMaxLength(input, maxLength) {
                return input.value.length <= maxLength;
            }
            // Hàm kiểm tra xem một số điện thoại hợp lệ
            function isValidPhoneNumber(phone) {
                // Thực hiện kiểm tra dựa trên quy ước của số điện thoại, ví dụ: 0987654321
                const phonePattern = /^0\d{9,10}$/;
                return phonePattern.test(phone);
            }
            //-----------------------------------------------------------------------------------------
            function validateAddress(event) {
                event.preventDefault();
                // Hàm validate toàn bộ form khi người dùng nhấn nút gửi (submit)

                // Kiểm tra từng trường input
                if (isEmpty(fullNameAdd) || isEmpty(phoneAdd) || isEmpty(addressAdd)) {
                    alert('Vui lòng điền đầy đủ thông tin khi thêm địa chỉ');
                    return;
                }

                // Kiểm tra xem Full name không vượt quá 100 ký tự
                if (!isNotExceedMaxLength(fullNameAdd, 100)) {
                    alert('Full name không được vượt quá 100 ký tự.');
                    return;
                }

                // Kiểm tra số điện thoại hợp lệ
                if (!isValidPhoneNumber(phoneAdd.value)) {
                    alert('Số điện thoại phải có từ 10 đến 11 chữ số và bắt đầu bằng số 0.');
                    return;
                }

                // Kiểm tra xem địa chỉ không vượt quá 500 ký tự
                if (!isNotExceedMaxLength(addressAdd, 500)) {
                    alert('Địa chỉ không được vượt quá 500 ký tự.');
                    return;
                }
                AddAddress();
                fullNameAdd.value = '';
                phoneAdd.value = '';
                addressAdd.value = '';
            }

//
//            // Gắn sự kiện validateForm vào sự kiện submit của form
            const AddButton = document.getElementById('AddButton');
            if (AddButton !== null) {
                AddButton.addEventListener('click', validateAddress);
            }

//-------------------------------------------------------------------------------------------
            function AddAddress() {
                var customerId =${customerId};
                var fullNameAdd = $("input[name='fullNameAdd']").val();
                var phoneAdd = $("input[name='phoneAdd']").val();
                var addressAdd = $("input[name='addressAdd']").val();


                $.ajax({
                    url: '/Address', 
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
            }                                                                                                                                                                                                                                            // @author DuyenLTM
        </script>
    </body>
</html>
