var originalCount = 15; // Thời gian countdown ban đầu (60 giây)
var count = originalCount; // Số giây còn lại
var display = document.getElementById('time'); // Thẻ hiển thị thời gian
var intervalId;

function startTimer(duration, display) {
    var timer = duration, minutes, seconds;

    intervalId = setInterval(function () {
        minutes = parseInt(timer / 30, 10);
        seconds = parseInt(timer % 30, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent ="Trong "+ minutes + ":" + seconds;

        if (--timer < 0) {
            clearInterval(intervalId);
            document.getElementById('reSend').disabled = false; // Mở khóa nút "reSend"
            timer = duration;
        }
    }, 1000);
}

document.getElementById('reSend').addEventListener('click', function () {
    clearInterval(intervalId); // Dừng countdown (nếu đang chạy)
    count = originalCount; // Reset lại thời gian countdown
    startTimer(count, display);
    document.getElementById('reSend').disabled = true; // Khóa nút "reSend" khi countdown bắt đầu
});


document.getElementById('reSend').disabled = true;

// Gọi hàm startTimer để bắt đầu countdown khi trang được tải
startTimer(count, display);




 
 


function OTPCheck(){
    
    const OTPInput = document.getElementById("inputOtp");
    
    var regex = /^\d{6}$/;



    if (!regex.test(OTPInput.value)) {
        
         var errorMessage = "vui lòng nhập sáu chữ số";
        document.querySelector(".error-message").textContent = errorMessage;
        return false;
    }

    
    return true;
    
    
    
}




