
document.addEventListener("DOMContentLoaded", function () {

    // Get the currentStatus value from your database or JSP scriptlet.
    const currentStatus = document.getElementById("currentStatus").value;
    const currentStatusName = document.getElementById("currentStatusName");
    // Define the progress step elements.
    const inProcessing = document.querySelector(".inProcessing");
    const inPackaging = document.querySelector(".inPackaging");
    const inDelivery = document.querySelector(".inDelivery");
    const complete = document.querySelector(".complete");
    const finalStage = document.querySelector(".finalStage");


    //define the progress step in progress bar
    const changeStatusButton = document.getElementById("changeStatusButton");
    const processingStep = document.getElementById("inProcessing");
    const packagingStep = document.getElementById("inPackaging");
    const deliveryStep = document.getElementById("inDelivery");
    const completeStep = document.getElementById("complete");
    const finalStep = document.getElementById("finalStage");
    const previousStatus = document.getElementById("previousStatus").value;
    const orderID = document.getElementById("orderID").value;
    console.log("Previous Status: " + previousStatus);
    console.log("current Status: " + currentStatus);
    console.log("current orderID: " + orderID);


    // Function to update progress based on currentStatus.

    function cleanStatus() {
        inProcessing.style.display = "none";
        inPackaging.style.display = "none";
        inDelivery.style.display = "none";
        complete.style.display = "none";
        finalStage.style.display = "none";
        processingStep.style.display = "none";
        packagingStep.style.display = "none";
        deliveryStep.style.display = "none";
        completeStep.style.display = "none";
        finalStep.style.display = "none";
        changeStatusButton.style.display = "none";
    }

    function updateProgress() {

        if (currentStatus === "1") {
            cleanStatus();
            changeStatusButton.style.display = "block";
            inProcessing.style.display = "block";
            inPackaging.style.display = "block";
            inDelivery.style.display = "block";
            processingStep.style.display = "block";
            packagingStep.style.display = "block";
            deliveryStep.style.display = "block";
            complete.style.display = "block";
            completeStep.style.display = "block";
            processingStep.classList.add("active");

            inProcessing.classList.remove("text-secondary");
            inProcessing.classList.add("text-success");
        } else if (currentStatus === "2") {
            cleanStatus();
            inProcessing.style.display = "block";
            inPackaging.style.display = "block";
            inDelivery.style.display = "block";
            processingStep.style.display = "block";
            packagingStep.style.display = "block";
            deliveryStep.style.display = "block";
            complete.style.display = "block";
            completeStep.style.display = "block";
            processingStep.classList.add("active");
            packagingStep.classList.add("active");

            inProcessing.classList.remove("text-secondary");
            inProcessing.classList.add("text-success");
            inPackaging.classList.remove("text-secondary");
            inPackaging.classList.add("text-success");
        } else if (currentStatus === "3") {
            cleanStatus();
            inProcessing.style.display = "block";
            inPackaging.style.display = "block";
            inDelivery.style.display = "block";
            processingStep.style.display = "block";
            packagingStep.style.display = "block";
            deliveryStep.style.display = "block";
            complete.style.display = "block";
            completeStep.style.display = "block";
            processingStep.classList.add("active");
            packagingStep.classList.add("active");
            deliveryStep.classList.add("active");

            inProcessing.classList.remove("text-secondary");
            inProcessing.classList.add("text-success");
            inPackaging.classList.remove("text-secondary");
            inPackaging.classList.add("text-success");
            inDelivery.classList.remove("text-secondary");
            inDelivery.classList.add("text-success");
        } else if (currentStatus === "4") {
            console.log("da toi day");
            cleanStatus();
            //the below line does not work
            inProcessing.style.display = "block";
            processingStep.style.display = "block";
            processingStep.classList.add("active");
            inPackaging.style.display = "block";
            packagingStep.style.display = "block";
            packagingStep.classList.add("active");
            inDelivery.style.display = "block";
            deliveryStep.style.display = "block";
            deliveryStep.classList.add("active");
            complete.style.display = "block";
            completeStep.style.display = "block";
            completeStep.classList.add("active");

            inProcessing.classList.remove("text-secondary");
            inProcessing.classList.add("text-success");
            inPackaging.classList.remove("text-secondary");
            inPackaging.classList.add("text-success");
            inDelivery.classList.remove("text-secondary");
            inDelivery.classList.add("text-success");
            complete.classList.remove("text-secondary");
            complete.classList.add("text-success");


        } else if (currentStatus === "5") {
            currentStatusName.classList.remove("text-success");
            currentStatusName.classList.add("text-danger");
            if (previousStatus === "1") {
                cleanStatus();
                inProcessing.style.display = "block";
                processingStep.style.display = "block";
                processingStep.classList.add("active");
                finalStage.style.display = "block";
                finalStep.style.display = "block";
                finalStep.classList.add("error");
                inPackaging.style.display = "block";
                packagingStep.style.display = "block";
                packagingStep.classList.add("error");
                inDelivery.style.display = "block";
                deliveryStep.style.display = "block";
                deliveryStep.classList.add("error")
                completeStep.classList.add("error");
                inProcessing.classList.remove("text-secondary");
                inProcessing.classList.add("text-success");
                inPackaging.classList.remove("text-secondary");
                inPackaging.classList.add("text-danger");
                inDelivery.classList.remove("text-secondary");
                inDelivery.classList.add("text-danger");
            } else if (previousStatus === "2") {
                cleanStatus();
                inProcessing.style.display = "block";
                processingStep.style.display = "block";
                processingStep.classList.add("active");
                inPackaging.style.display = "block";
                packagingStep.style.display = "block";
                packagingStep.classList.add("active");
                inDelivery.style.display = "block";
                deliveryStep.style.display = "block";
                deliveryStep.classList.add("error");
                finalStage.style.display = "block";
                finalStep.style.display = "block";
                finalStep.classList.add("error");
                completeStep.classList.add("error");
                inProcessing.classList.remove("text-secondary");
                inProcessing.classList.add("text-success");
                inPackaging.classList.remove("text-secondary");
                inPackaging.classList.add("text-success");
                inDelivery.classList.remove("text-secondary");
                inDelivery.classList.add("text-danger");
            } else if (previousStatus === "3") {
                cleanStatus();
                inProcessing.style.display = "block";
                processingStep.style.display = "block";
                processingStep.classList.add("active");
                inPackaging.style.display = "block";
                packagingStep.style.display = "block";
                packagingStep.classList.add("active");
                inDelivery.style.display = "block";
                deliveryStep.style.display = "block";
                deliveryStep.classList.add("active");
                finalStage.style.display = "block";
                finalStep.style.display = "block";
                finalStep.classList.add("error");
                completeStep.classList.add("error");
                inProcessing.classList.remove("text-secondary");
                inProcessing.classList.add("text-success");
                inPackaging.classList.remove("text-secondary");
                inPackaging.classList.add("text-success");
                inDelivery.classList.remove("text-secondary");
                inDelivery.classList.add("text-success");
            }
        }
    }

    updateProgress();
    const priceElements = document.querySelectorAll(".price");
    const subtotalElements = document.querySelectorAll(".subtotal");
    const totalElements = document.querySelectorAll(".total");
    const formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "VND",
    });
    priceElements.forEach(function (element) {
        const value = parseFloat(element.textContent);
        var valueString = formatter.format(value);
        element.textContent = valueString.replace('₫', '') + 'đ';
    });
    subtotalElements.forEach(function (element) {
        const value = parseFloat(element.textContent);
        var valueString = formatter.format(value);
        element.textContent = valueString.replace('₫', '') + 'đ';
    });
    totalElements.forEach(function (element) {
        const value = parseFloat(element.textContent);
        var valueString = formatter.format(value);
        element.textContent = valueString.replace('₫', '') + 'đ';
    });
    // Toggle display based on paymentMethod value
    const paymentMethod = document.getElementById("paymentMethod");
    const bankingDetails = document.getElementById("bankingDetails");
    const CodDetails = document.getElementById("CodDetails");
    if (paymentMethod.value === "true") {
        // Payment via banking (display bankingDetails)
        bankingDetails.style.display = "block";
        CodDetails.style.display = "none";
    } else {
        // Payment on delivery (display CodDetails)
        bankingDetails.style.display = "none";
        CodDetails.style.display = "block";
    }
});
function validateForm() {
    var currentStatus = document.getElementById("currentStatus").value;

    if (currentStatus !== "1") {
        alert("Đơn hàng của bạn đang trong quá trình gửi. Không thể hủy!");
        return false;
    }

    // If currentStatus is 1, the form will be submitted.
    if (currentStatus === "1") {
        var confirmation = confirm("Bạn có thật sự muốn hủy đơn hàng?");
        if (confirmation) {
            return true;  // User confirmed, allow form submission.
        } else {
            return false; // User canceled, prevent form submission.
        }
    }
}



