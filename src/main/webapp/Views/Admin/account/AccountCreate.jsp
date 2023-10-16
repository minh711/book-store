<%-- 
    Document   : createAccount
    Created on : Oct 7, 2023, 10:49:13 PM
    Author     : DuyenLTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a href="#" class="text-light nav-link">Chỉnh sửa tài khoản</a>
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="container d-flex justify-content-center align-items-center" style="">
                <div class="col-md-12">
                    <div class="bg-white rounded p-4" >
                        <form action="/Account" method="POST">
                            <h1 class="text-center mb-3">Thông tin tài khoản</h1>
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
                            <button class="btn btn-danger w-100 mt-3">Xóa tài khoản</button>
                            <hr>
                            <button class="btn btn-success w-100" name="btnAddNew" type="submit" value="Submit" onclick="return validateForm()">Tạo tài khoản</button>
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

//                // Kiểm tra xem Email có duy nhất hay không
//                if (!isEmailUnique(emailInput.value)) {
//                    alert('Email đã tồn tại, vui lòng chọn một địa chỉ email khác.');
//                    return;
//                }
                // Sử dụng phương thức submit() để gửi form đến controller
                form.submit();
                alert('Thêm tài khoản thành công');

            }

            // Gắn sự kiện validateForm vào sự kiện submit của form
            const form = document.querySelector('form');
            form.addEventListener('submit', validateForm);
        </script>

    </body>

</html>