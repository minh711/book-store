var distributors;
const wrapper = document.querySelector(".wrapper");
const selectBtn = wrapper.querySelector(".select-btn");
const options = wrapper.querySelector(".options");

function loadDistributors() {
    $.ajax({
        url: "/DistributorCtrl",
        type: "get",
        dataType: "json",
        success: function (data) {
            distributors = data;
            addCountry();
        },
        error: function (xhr) {
        }
    });
}

function addCountry() {
    distributors.forEach(distributor => {
        let li = '<li onclick="updateName(this);">' + distributor.distributor + '</li>';
        options.insertAdjacentHTML("beforeend", li);
    });
}

function updateName(selectedLi) {
    selectBtn.firstElementChild.innerText = selectedLi.innerText;
}

selectBtn.addEventListener("click", () => {
    wrapper.classList.toggle("active");
});

$(document).ready(function() {
    loadDistributors();
});




