var authors = [];
var selectedAuthorIds = [];
const selectAuthorContainer = document.querySelector(".select-author-container");
const selectAuthorSelectBtn = selectAuthorContainer.querySelector(".select-btn");
const selectAuthorSearchInp = selectAuthorContainer.querySelector("input");
const selectAuthorOptions = selectAuthorContainer.querySelector(".options");
const selectAuthorContent = selectAuthorContainer.querySelector(".content");
const selectedAuthors = document.querySelector(".selectedAuthors");

$(document).ready(function() {
    loadAuthors(); 
});

selectAuthorSelectBtn.addEventListener("click", () => {
    selectAuthorContainer.classList.toggle("active");
    selectAuthorSearchInp.value = null;
    searchAuthor();
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectAuthorContent).display === 'block') {
        const isClickInsideSelectAuthorContainer = selectAuthorContainer.contains(event.target);

        if (!isClickInsideSelectAuthorContainer) {
            selectAuthorContainer.classList.toggle("active");
        }
    }
});

function loadAuthors() {
    $.ajax({
        url: "/BookCreateCtrl",
        type: "post",
        data: {loadAuthors: "true"},
        dataType: "json",
        success: function (data) {
            authors = data;
            addAuthors();
        },
        error: function (xhr) {
        }
    });
}

function addAuthors() {
    $(selectAuthorOptions).empty();
    authors.forEach(author => {
        if (!selectedAuthorIds.includes(author.id)) {
            let li = '<li onclick="selectAuthor(this);" data-id="' + author.id + '">' + author.author + '</li>';
            selectAuthorOptions.insertAdjacentHTML("beforeend", li);
        }
    });
}

function selectAuthor(selectedLi) {
    if (!selectedAuthorIds.includes($(selectedLi).data("id"))) {
        selectedAuthorIds.push($(selectedLi).data("id"));
    }
    console.log(selectedAuthorIds);
    selectAuthorContainer.classList.toggle("active");
    addAuthors();
    loadSelectedAuthors();
}

selectAuthorSearchInp.addEventListener("keyup", () => {
    searchAuthor();
});

function searchAuthor() {
    let arr = [];
    let searchedVal = selectAuthorSearchInp.value;
    arr = authors
        .filter(data => {
            return data.author.toLowerCase().includes(searchedVal.toLowerCase()) && !selectedAuthorIds.includes(data.id);
        })
        .map(data => `<li onclick="selectAuthor(this);" data-id="${data.id}">${data.author}</li>`)
        .join("");

    if (arr.length === 0 && searchedVal.trim() !== '') {
        selectAuthorOptions.innerHTML = '<li>Thêm mới</li>';
    } else {
        selectAuthorOptions.innerHTML = arr;
    }
}

function loadSelectedAuthors() {
    let arr = authors
        .filter(data => selectedAuthorIds.includes(data.id))
        .map(data => `<div class="bg-white rounded-pill p-2 mx-2 my-2" data-id="${data.id}">${data.author}<i onclick="removeAuthor(${data.id});" class="remove-btn mx-2 fa-solid fa-trash"></i></div>`)
        .join("");
    selectedAuthors.innerHTML = arr;
}

function removeAuthor(id) {
    selectedAuthorIds.splice(selectedAuthorIds.indexOf(id), 1);
    loadSelectedAuthors();
}