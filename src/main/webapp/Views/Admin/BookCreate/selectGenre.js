var genres = [];
var selectedGenreIds = [];
const selectGenreContainer = document.querySelector(".select-genre-container");
const selectGenreSelectBtn = selectGenreContainer.querySelector(".select-btn");
const selectGenreSearchInp = selectGenreContainer.querySelector("input");
const selectGenreOptions = selectGenreContainer.querySelector(".options");
const selectGenreContent = selectGenreContainer.querySelector(".content");
const selectedGenres = document.querySelector(".selectedGenres");

$(document).ready(function() {
    loadGenres(); 
});

selectGenreSelectBtn.addEventListener("click", () => {
    selectGenreContainer.classList.toggle("active");
    selectGenreSearchInp.value = null;
    searchGenre();
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectGenreContent).display === 'block') {
        const isClickInsideSelectGenreContainer = selectGenreContainer.contains(event.target);

        if (!isClickInsideSelectGenreContainer) {
            selectGenreContainer.classList.toggle("active");
        }
    }
});

function loadGenres() {
    $.ajax({
        url: "/BookCreateCtrl",
        type: "post",
        data: {loadGenres: "true"},
        dataType: "json",
        success: function (data) {
            genres = data;
            addGenres();
        },
        error: function (xhr) {
        }
    });
}

function addGenres() {
    genres.forEach(genre => {
        let li = '<li onclick="selectGenre(this);" data-id="' + genre.id + '">' + genre.genre + '</li>';
        selectGenreOptions.insertAdjacentHTML("beforeend", li);
    });
}

function selectGenre(selectedLi) {
    if (!selectedGenreIds.includes($(selectedLi).data("id"))) {
        selectedGenreIds.push($(selectedLi).data("id"));
    }
    console.log(selectedGenreIds);
    selectGenreContainer.classList.toggle("active");
    addGenres();
    loadSelectedGenres();
}

selectGenreSearchInp.addEventListener("keyup", () => {
    searchGenre();
});

function searchGenre() {
    let arr = [];
    let searchedVal = selectGenreSearchInp.value;
    arr = genres
        .filter(data => {
            return data.genre.toLowerCase().includes(searchedVal.toLowerCase()) && !selectedGenreIds.includes(data.id);
        })
        .map(data => `<li onclick="selectGenre(this);" data-id="${data.id}">${data.genre}</li>`)
        .join("");

    if (arr.length === 0 && searchedVal.trim() !== '') {
        selectGenreOptions.innerHTML = '<li>Thêm mới</li>';
    } else {
        selectGenreOptions.innerHTML = arr;
    }
}

function loadSelectedGenres() {
    let arr = genres
        .filter(data => selectedGenreIds.includes(data.id))
        .map(data => `<div class="bg-white rounded-pill p-2 mx-2 my-2" data-id="${data.id}">${data.genre}<i onclick="removeGenre(${data.id});" class="remove-btn mx-2 fa-solid fa-trash"></i></div>`)
        .join("");
    selectedGenres.innerHTML = arr;
}

function removeGenre(id) {
    selectedGenreIds.splice(selectedGenreIds.indexOf(id), 1);
    loadSelectedGenres();
}