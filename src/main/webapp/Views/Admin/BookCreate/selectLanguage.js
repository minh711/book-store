var languages = [];
var selectedLanguageId = 0;
const selectLanguageContainer = document.querySelector(".select-language-container");
const selectLanguageSelectBtn = selectLanguageContainer.querySelector(".select-btn");
const selectLanguageSearchInp = selectLanguageContainer.querySelector("input");
const selectLanguageOptions = selectLanguageContainer.querySelector(".options");
const selectLanguageContent = selectLanguageContainer.querySelector(".content");

$(document).ready(function() {
   loadLanguages(); 
});

selectLanguageSelectBtn.addEventListener("click", () => {
    selectLanguageContainer.classList.toggle("active");
    selectLanguageSearchInp.value = null;
    searchLanguage();
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectLanguageContent).display === 'block') {
        const isClickInsideSelectDistributorContainer = selectLanguageContainer.contains(event.target);

        if (!isClickInsideSelectDistributorContainer) {
            selectLanguageContainer.classList.toggle("active");
        }
    }
});

function loadLanguages() {
    $.ajax({
        url: "/Manager/Book/Create",
        type: "post",
        data: {loadLanguages: "true"},
        dataType: "json",
        success: function (data) {
            languages = data;
            addLanguages();
        },
        error: function (xhr) {
        }
    });
}

function addLanguages() {
    $(selectLanguageOptions).empty();
    languages.forEach(language => {
        let li = '<li onclick="selectLanguage(this);" data-id="' + language.id + '">' + language.language + '</li>';
        selectLanguageOptions.insertAdjacentHTML("beforeend", li);
    });
}

function selectLanguage(selectedLi) {
    selectLanguageSelectBtn.firstElementChild.innerText = selectedLi.innerText;
    selectedLanguageId = $(selectedLi).data("id");
    selectLanguageContainer.classList.toggle("active");
}

selectLanguageSearchInp.addEventListener("keyup", () => {
    searchLanguage();
});

function searchLanguage() {
    let arr = []; 
    let searchedVal = selectLanguageSearchInp.value.trim();
    
    arr = languages
        .filter(data => {
            return data.language.toLowerCase().includes(searchedVal.toLowerCase());
        })
        .map(data => `<li onclick="selectLanguage(this);" data-id="${data.id}">${data.language}</li>`)
        .join("");

    let isUnique = true;
    for (const item of languages) {
        if (item.language.toLowerCase() === searchedVal.toLowerCase().trim()) {
            isUnique = false;
            break; 
        }
    }
    if (isUnique && searchedVal !== "") {
        selectLanguageOptions.innerHTML = ""; 
        selectLanguageOptions.innerHTML = arr;
        selectLanguageOptions.insertAdjacentHTML('afterbegin', `<li onclick="addNewLanguage('${searchedVal}');">Thêm ngôn ngữ mới <span class="fw-bold mx-2">${searchedVal}</span></li>`);
    } else {
        selectLanguageOptions.innerHTML = "";
        selectLanguageOptions.innerHTML = arr;
    }
}

function addNewLanguage(newLanguage) {
    $.ajax({
        url: "/Manager/Book/Create",
        type: "post",
        data: {addNewLanguage: "true", newLanguage},
        success: function () {
            loadLanguages();
            selectLanguageSearchInp.value = newLanguage;
            searchLanguage();
        },
        error: function (xhr) {
        }
    });
}