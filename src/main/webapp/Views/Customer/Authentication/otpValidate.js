


function OTPCheck(){
    
    const OTPInput = document.getElementById("inputOtp");
    
    var regex = /^\d{1,6}$/;



    if (!regex.test(OTPInput.value)) {
        
         var errorMessage = "vui lòng nhập đúng OTP";
        document.querySelector(".error-message").textContent = errorMessage;
        return false;
    }

    
    return true;
    
    
    
}




