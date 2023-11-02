const fullNameInput = document.querySelector('input[name="fullName"]');
            const phoneInput = document.querySelector('input[name="phone"]');
            const emailInput = document.querySelector('input[name="email"]');
            const usernameInput = document.querySelector('input[name="username"]');
            const passwordInput = document.querySelector('input[name="password"]');
            const resetPasswordInput = document.querySelector('input[name="resetPWD"]');
            const genderInputs = document.querySelectorAll('input[name="gender"]');
            const birthdayInput = document.querySelector('input[name="birthday"]');

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

               
//                // Kiểm tra từng trường input
                if (isEmpty(fullNameInput) || isEmpty(phoneInput) || isEmpty(emailInput) || isEmpty(usernameInput) ||
                        genderInputs.length === 0 || !birthdayInput.value ) {
                    alert('Vui lòng điền đầy đủ thông tin.');
                    return;
                }
//                //kiểm tra mật khẩu và mật khẩu xác nhận (nếu có) 
                if(!isEmpty(passwordInput)&&isEmpty(resetPasswordInput)){
                    alert('Vui lòng nhập lại mật khẩu để xác nhận.');
                    return;
                }
                if(isEmpty(passwordInput)&&!isEmpty(resetPasswordInput)){
                    alert('Vui lòng nhập mật khẩu mới trước khi nhập lại mật khẩu xác nhận.');
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
                if(!isEmpty(passwordInput)){
                if (!isValidPassword(passwordInput.value)) {
                    alert('Mật khẩu phải có 8-50 ký tự, chứa ít nhất một chữ cái in hoa, một chữ cái thường, một số và một ký tự đặc biệt.');
                    return;
                }
            }
                if(!isEmpty(passwordInput)&&!isEmpty(resetPasswordInput)){
                // Kiểm tra xem mật khẩu nhập lại hợp lệ
                if (passwordInput.value !== resetPasswordInput.value) {
                    alert('Mật khẩu và Nhập lại mật khẩu không khớp nhau.');
                    return;
                }
            }
                // Sử dụng phương thức submit() để gửi form đến controller
                form.submit();
                alert('Cập nhật tài khoản thành công');
            }

            // Gắn sự kiện validateForm vào sự kiện submit của form
            const form = document.querySelector('form');
            if (form !== null) {
                form.addEventListener('submit', validateForm);
            }