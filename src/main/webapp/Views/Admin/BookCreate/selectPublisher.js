var publishers = [];
var selectedPublisherId = 0;
const selectPublisherContainer = document.querySelector(".select-publisher-container");
const selectPublisherSelectBtn = selectPublisherContainer.querySelector(".select-btn");
const selectPublisherSearchInp = selectPublisherContainer.querySelector("input");
const selectPublisherOptions = selectPublisherContainer.querySelector(".options");
const selectPublisherContent = selectPublisherContainer.querySelector(".content");

$(document).ready(function() {
   loadPublishers(); 
});

selectPublisherSelectBtn.addEventListener("click", () => {
    selectPublisherContainer.classList.toggle("active");
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectPublisherContent).display === 'block') {
        const isClickInsideSelectDistributorContainer = selectPublisherContainer.contains(event.target);

        if (!isClickInsideSelectDistributorContainer) {
            selectPublisherContainer.classList.toggle("active");
        }
    }
});

function loadPublishers() {
    $.ajax({
        url: "/BookCreateCtrl",
        type: "post",
        data: {loadPublishers: "true"},
        dataType: "json",
        success: function (data) {
            publishers = data;
            addPublisher();
        },
        error: function (xhr) {
        }
    });
}

function addPublisher() {
    publishers.forEach(publisher => {
        let li = '<li onclick="selectPublisher(this);" data-id="' + publisher.id + '">' + publisher.publisher + '</li>';
        selectPublisherOptions.insertAdjacentHTML("beforeend", li);
    });
}

function selectPublisher(selectedLi) {
    selectPublisherSelectBtn.firstElementChild.innerText = selectedLi.innerText;
    selectedPublisherId = $(selectedLi).data("id");
    selectPublisherContainer.classList.toggle("active");
}

selectPublisherSearchInp.addEventListener("keyup", () => {
    let arr = []; 
    let searchedVal = selectPublisherSearchInp.value;
    arr = publishers.filter(data => {
        return data.publisher.toLowerCase().includes(searchedVal.toLowerCase());
    }).map(data => `<li onclick="selectPublisher(this);" data-id=${data.id}">${data.publisher}</li>`).join("");
    selectPublisherOptions.innerHTML = arr;
});