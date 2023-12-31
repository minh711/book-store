<%-- 
    Document   : createAccount
    Created on : Oct 7, 2023, 10:49:13 PM
    Author     : DuyenLTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Tạo tài khoản mới</title>
        <jsp:include page="/Views/head.jsp"/>
    </head>

    <body>
        <jsp:include page="/Views/header.jsp"/>

        <main class="bg-light d-flex">
            <jsp:include page="/Views/aside.jsp"/>

            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="
                     col-md-12">
                    <div class="bg-white rounded p-4" >
                        <form action="/Manager/Account/Create" method="POST">
                            <h1 class="text-center mb-3">Tạo tài khoản</h1>
                            <p class=" text-danger">${error}</p>
                            <input type="text" class="form-control mb-3" placeholder="Họ và tên" name="fullName">
                            <input type="text" class="form-control mb-3" placeholder="Số điện thoại" name="phone">
                            <input type="email" class="form-control mb-3" placeholder="Địa chỉ Email" name="email">
                            <input type="text" class="form-control mb-3" placeholder="Tên đăng nhập" name="username">
                            <input type="password" class="form-control mb-3" placeholder="Mật khẩu" name="password">
                            <input type="password" class="form-control mb-3" placeholder="Nhập lại mật khẩu" name="resetPWD">
                            <label class="mb-2">Giới tính</label>
                            <div class="d-flex mb-3">
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input" value="Nam" name="gender">
                                    <label class="form-check-label">Nam</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Nữ" name="gender">
                                    <label class="form-check-label">Nữ</label>
                                </div>
                                <div class="form-check mx-2">
                                    <input type="radio" class="form-check-input"  value="Khác" name="gender">
                                    <label class="form-check-label">Khác</label>
                                </div>                  
                            </div>
                            <label class="mb-2">Ngày sinh</label>
                            <input type="date" class="form-control mb-3" name="birthday">
                            <select class="form-select" name="roleId">
                                <option value="0">Chọn Chức vụ</option>
                                <option value="2">Quản lý sách</option>
                                <option value="3">Quản lý Đơn hàng</option>
                            </select>
                            <hr>
                            <button class="btn btn-success w-100" name="btnAddNew" type="submit" value="Submit" onclick="return validateForm()">Tạo tài khoản</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/Views/footer.jsp"/>

        <jsp:include page="/Views/foot.jsp"/>
        <script>
            // Lấy ra các trường input
            const fullNameInput = document.querySelector('input[name="fullName"]');
            const phoneInput = document.querySelector('input[name="phone"]');
            const emailInput = document.querySelector('input[name="email"]');
            const usernameInput = document.querySelector('input[name="username"]');
            const passwordInput = document.querySelector('input[name="password"]');
            const resetPasswordInput = document.querySelector('input[name="resetPWD"]');
            const genderInputs = document.querySelectorAll('input[name="gender"]');
            const birthdayInput = document.querySelector('input[name="birthday"]');
            const roleIdSelect = document.querySelector('select[name="roleId"]');

            // Hàm kiểm tra xem một trường input có rỗng hay không
            function isEmpty(input) {
                return input.value.trim() === '';
            }
            // Hàm kiểm tra xem một chuỗi không vượt quá độ dài cho trước
            function isNotExceedMaxLength(input, maxLength) {
                return input.value.length <= maxLength;
            }

            //kiểm tra độ mạnh của mật khẩu
            function isValidPassword(password) {
                // Kiểm tra độ dài của mật khẩu (8-50 ký tự)
                if (password.length < 8 || password.length > 50) {
                    return false;
                }

                // Kiểm tra xem mật khẩu có chứa ít nhất một chữ cái in hoa, một chữ cái thường, một số và một ký tự đặc biệt hay không
                const uppercasePattern = /[A-Z]/;
                const lowercasePattern = /[a-z]/;
                const digitPattern = /\d/;
                const specialCharPattern = /[!@#$%^&*()_+[\]{};':"\\|,.<>?]/;

                if (
                        !uppercasePattern.test(password) ||
                        !lowercasePattern.test(password) ||
                        !digitPattern.test(password) ||
                        !specialCharPattern.test(password)
                        ) {
                    return false;
                }

                return true;
            }

            // Hàm kiểm tra xem một chuỗi có chứa chỉ chữ số không
            function containsOnlyDigits(input) {
                const digitPattern = /^\d+$/;
                return digitPattern.test(input.value);
            }

            // Hàm kiểm tra xem một số điện thoại hợp lệ
            function isValidPhoneNumber(phone) {
                // Thực hiện kiểm tra dựa trên quy ước của số điện thoại, ví dụ: 0987654321
                const phonePattern = /^0\d{9,10}$/;
                return phonePattern.test(phone);
            }

            // Hàm kiểm tra xem một trường input có chứa chỉ chữ cái, số, gạch dưới, dấu chấm và dấu gạch ngang không
            function containsOnlyValidCharacters(input) {
                const validCharacterPattern = /^[a-zA-Z0-9_\-\.]+$/;
                return validCharacterPattern.test(input.value);
            }

            // Hàm kiểm tra xem một email có hợp lệ theo yêu cầu đã nêu
            function isValidEmail(email) {
                const emailPattern = /^[a-zA-Z0-9_\-\.]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$/;
                return emailPattern.test(email);
            }

            // Hàm kiểm tra xem tên đăng nhập không chứa các ký tự đặc biệt hoặc khoảng trắng
            function isUsernameValid(username) {
                const usernamePattern = /^[a-zA-Z0-9]+$/; // Chỉ cho phép chữ và số
                return usernamePattern.test(username);
            }

            // Hàm validate toàn bộ form khi người dùng nhấn nút gửi (submit)
            function validateForm(event) {
                event.preventDefault(); // Ngăn chặn form gửi đi trước khi kiểm tra

                // Kiểm tra từng trường input
                if (isEmpty(fullNameInput) || isEmpty(phoneInput) || isEmpty(emailInput) || isEmpty(usernameInput) ||
                        isEmpty(passwordInput) || isEmpty(resetPasswordInput) || genderInputs.length === 0 || !birthdayInput.value || roleIdSelect.value === 'Chọn Chức vụ') {
                    alert('Vui lòng điền đầy đủ thông tin và chọn chức vụ.');
                    return;
                }

                // Kiểm tra xem Full name không vượt quá 100 ký tự
                if (!isNotExceedMaxLength(fullNameInput, 100)) {
                    alert('Full name không được vượt quá 100 ký tự.');
                    return;
                }

                // Kiểm tra số điện thoại hợp lệ
                if (!isValidPhoneNumber(phoneInput.value)) {
                    alert('Số điện thoại phải có từ 10 đến 11 chữ số và bắt đầu bằng số 0.');
                    return;
                }

                // Kiểm tra email hợp lệ
                if (!isValidEmail(emailInput.value)) {
                    alert('Vui lòng nhập một địa chỉ email hợp lệ.');
                    return;
                }

                // Kiểm tra xem Username không vượt quá 100 ký tự và không chứa các ký tự đặc biệt hoặc khoảng trắng
                if (!isNotExceedMaxLength(usernameInput, 100) || !isUsernameValid(usernameInput.value)) {
                    alert('Username không được vượt quá 100 ký tự và chỉ chứa chữ và số.');
                    return;
                }

                // Kiểm tra xem mật khẩu hợp lệ
                if (!isValidPassword(passwordInput.value)) {
                    alert('Mật khẩu phải có 8-50 ký tự, chứa ít nhất một chữ cái in hoa, một chữ cái thường, một số và một ký tự đặc biệt.');
                    return;
                }

                // Kiểm tra xem mật khẩu nhập lại hợp lệ
                if (passwordInput.value !== resetPasswordInput.value) {
                    alert('Mật khẩu và Nhập lại mật khẩu không khớp nhau.');
                    return;
                }
                // Sử dụng phương thức submit() để gửi form đến controller
                form.submit();
               
            }

            // Gắn sự kiện validateForm vào sự kiện submit của form
            const form = document.querySelector('form');
            form.addEventListener('submit', validateForm);
        </script>

    </body>

</html>