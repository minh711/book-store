var publishers = [];
const selectPublisherContainer = document.querySelector(".select-publisher-container");
const selectPublisherSelectBtn = selectPublisherContainer.querySelector(".select-btn");
const selectPublisherSearchInp = selectPublisherContainer.querySelector("input");
const selectPublisherOptions = selectPublisherContainer.querySelector(".options");
const selectPublisherContent = selectPublisherContainer.querySelector(".content");

$(document).ready(function() {
   
});

selectPublisherSelectBtn.addEventListener("click", () => {
    selectPublisherContainer.classList.toggle("active");
    selectPublisherSearchInp.value = null;
    searchPublisher();
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
        url: "/BookUpdateCtrl",
        type: "post",
        data: {loadPublishers: "true"},
        dataType: "json",
        success: function (data) {
            publishers = data;
            addPublisher();
            if (selectedPublisherId !== 0) {
                let publisher = "";
                for (let i = 0; i < publishers.length; i++) {
                    if (publishers[i].id === selectedPublisherId) {
                        publisher = publishers[i].publisher;
                        selectPublisherSelectBtn.firstElementChild.innerText = publisher;
                        break;
                    }
                }
            }
        },
        error: function (xhr) {
        }
    });
}

function addPublisher() {
    $(selectPublisherOptions).empty();
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
    searchPublisher();
});

function searchPublisher() {
    let arr = []; 
    let searchedVal = selectPublisherSearchInp.value.trim();
    arr = publishers
        .filter(data => {
            return data.publisher.toLowerCase().includes(searchedVal.toLowerCase());
        })
        .map(data => `<li onclick="selectPublisher(this);" data-id="${data.id}">${data.publisher}</li>`)
        .join("");

    let isUnique = true;
    for (const item of publishers) {
        if (item.publisher.toLowerCase() === searchedVal.toLowerCase().trim()) {
            isUnique = false;
            break; 
        }
    }
    if (isUnique && searchedVal !== "") {
        selectPublisherOptions.innerHTML = ""; 
        selectPublisherOptions.innerHTML = arr;
        selectPublisherOptions.insertAdjacentHTML('afterbegin', `<li onclick="addNewPublisher('${searchedVal}');">Thêm nhà xuất bản mới <span class="fw-bold mx-2">${searchedVal}</span></li>`);
    } else {
        selectPublisherOptions.innerHTML = "";
        selectPublisherOptions.innerHTML = arr;
    }
}

function addNewPublisher(newPublisher) {
    $.ajax({
        url: "/BookUpdateCtrl",
        type: "post",
        data: {addNewPublisher: "true", newPublisher},
        success: function () {
            loadPublishers();
            selectPublisherSearchInp.value = newPublisher;
            searchPublisher();
        },
        error: function (xhr) {
        }
    });
}