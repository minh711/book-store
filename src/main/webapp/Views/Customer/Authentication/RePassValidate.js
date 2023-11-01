
console.log('a');
// Hàm validate toàn bộ form khi người dùng nhấn nút gửi (submit)
function validateFormRePass() {
   // Lấy ra các trường input
 
 
 
const passwordInput = document.querySelector('input[name="Repass"]');
const resetPasswordInput = document.querySelector('input[name="Cepass"]');
  

  

    // Kiểm tra xem mật khẩu hợp lệ
    if (!isValidPassword(passwordInput.value)) {
       
         var errorMessage = "Mật khẩu phải có 8-32 ký tự, chứa ít nhất một chữ cái in hoa, một chữ cái thường, một số và một ký tự đặc biệt.";
        document.querySelector(".error-message").textContent = errorMessage;
        return false;
    }

    // Kiểm tra xem mật khẩu nhập lại hợp lệ
    if (passwordInput.value !== resetPasswordInput.value) {
        
        var errorMessage = "Mật khẩu và Nhập lại mật khẩu không khớp nhau.";
        document.querySelector(".error-message").textContent = errorMessage;
        return false;
    }


    return true;
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



   
 



