
console.log('a')
// Hàm validate toàn bộ form khi người dùng nhấn nút gửi (submit)
function validateFormReEmail() {
    // Lấy ra các trường input

    const emailInput = document.querySelector('input[name="email"]');



    // Kiểm tra email hợp lệ
    if (!isValidEmail(emailInput.value)) {

        var errorMessage = "Vui lòng nhập một địa chỉ email hợp lệ.";
        document.querySelector(".error-message").textContent = errorMessage;
        return false;
    }



    return true;
}



// Hàm kiểm tra xem một email có hợp lệ theo yêu cầu đã nêu
function isValidEmail(email) {
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailPattern.test(email);
}





