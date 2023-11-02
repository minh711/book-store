var genres = [];
const selectGenreContainer = document.querySelector(".select-genre-container");
const selectGenreSelectBtn = selectGenreContainer.querySelector(".select-btn");
const selectGenreSearchInp = selectGenreContainer.querySelector("input");
const selectGenreOptions = selectGenreContainer.querySelector(".options");
const selectGenreContent = selectGenreContainer.querySelector(".content");
const selectedGenres = document.querySelector(".selectedGenres");

$(document).ready(function() {
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
        url: "/Manager/Book/Update",
        type: "post",
        data: {loadGenres: "true"},
        dataType: "json",
        success: function (data) {
            genres = data;
            addGenres();
            loadSelectedGenres();
        },
        error: function (xhr) {
        }
    });
}

function addGenres() {
    $(selectGenreOptions).empty();
    genres.forEach(genre => {
        if (!selectedGenreIds.includes(genre.id)) {
            let li = '<li onclick="selectGenre(this);" data-id="' + genre.id + '">' + genre.genre + '</li>';
            selectGenreOptions.insertAdjacentHTML("beforeend", li);
        }
    });
}

function selectGenre(selectedLi) {
    let selectedGenreId = $(selectedLi).data("id");
    if (!selectedGenreIds.includes(selectedGenreId)) {
        selectedGenreIds.push(selectedGenreId);
        $.ajax({
            url: "/Manager/Book/Update",
            type: "post",
            data: {addNewBookGenre: selectedGenreId, bookId: bookId},
            dataType: "json",
            success: function () {
            },
            error: function (xhr) {
        }
    });
    }
    selectGenreContainer.classList.toggle("active");
    addGenres();
    loadSelectedGenres();
}

selectGenreSearchInp.addEventListener("keyup", () => {
    searchGenre();
});

function searchGenre() {
    let arr = [];
    let searchedVal = selectGenreSearchInp.value.trim();

    arr = genres
        .filter(data => {
            return data.genre.toLowerCase().includes(searchedVal.toLowerCase()) && !selectedGenreIds.includes(data.id);
        })
        .map(data => `<li onclick="selectGenre(this);" data-id="${data.id}">${data.genre}</li>`)
        .join("");

    let isUnique = true;
    for (const item of genres) {
        if (item.genre.toLowerCase() === searchedVal.toLowerCase().trim()) {
            isUnique = false;
            break; 
        }
    }
    if (isUnique && searchedVal !== "") {
        selectGenreOptions.innerHTML = ""; 
        selectGenreOptions.innerHTML = arr;
        selectGenreOptions.insertAdjacentHTML('afterbegin', `<li onclick="addNewGenre('${searchedVal}');">Thêm thể loại mới <span class="fw-bold mx-2">${searchedVal}</span></li>`);
    } else {
        selectGenreOptions.innerHTML = "";
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
    $.ajax({
        url: "/Manager/Book/Update",
        type: "post",
        data: {deleteBookGenre: id, bookId: bookId},
        dataType: "json",
        success: function () {
        },
        error: function (xhr) {
        }
    });
    loadSelectedGenres();
}

function addNewGenre(newGenre) {
    $.ajax({
        url: "/Manager/Book/Update",
        type: "post",
        data: {addNewGenre: "true", newGenre},
        success: function () {
            loadGenres();
            selectGenreSearchInp.value = newGenre;
            searchGenre();
        },
        error: function (xhr) {
        }
    });
}