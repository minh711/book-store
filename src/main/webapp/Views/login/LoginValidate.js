//// // Lấy ra các trường input
function validateForm() {
    const usernameInput = document.querySelector('input[name="name"]');
    const passwordInput = document.querySelector('input[name="pass"]');
    
    

    if (isEmpty(usernameInput) || isEmpty(passwordInput)) {
        alert('Vui lòng điền đầy đủ thông tin và chọn chức vụ.');
        return false;
    }

    
    // Kiểm tra xem Username không vượt quá 100 ký tự và không chứa các ký tự đặc biệt hoặc khoảng trắng
    if (!isNotExceedMaxLength(usernameInput, 32) || !isUsernameValid(usernameInput.value)) {
        alert('Username không được vượt quá 32 ký tự và chỉ chứa chữ và số.');
        return false;
    }

    // Kiểm tra xem mật khẩu hợp lệ
    if (!isValidPassword(passwordInput.value)) {
        alert('Mật khẩu phải có 8-32 ký tự, chứa ít nhất một chữ cái in hoa, một chữ cái thường, một số và một ký tự đặc biệt.');
        return false;
    }

    
    return true;
    
}


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
    if (password.length < 8 || password.length > 32) {
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


// Hàm kiểm tra xem một trường input có chứa chỉ chữ cái, số, gạch dưới, dấu chấm và dấu gạch ngang không
function containsOnlyValidCharacters(input) {
    const validCharacterPattern = /^[a-zA-Z0-9_\-\.]+$/;
    return validCharacterPattern.test(input.value);
}



// Hàm kiểm tra xem tên đăng nhập không chứa các ký tự đặc biệt hoặc khoảng trắng
function isUsernameValid(username) {
    const usernamePattern = /^[a-zA-Z0-9]+$/; // Chỉ cho phép chữ và số
    return usernamePattern.test(username);
}










