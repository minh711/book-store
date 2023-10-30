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
        url: "/BookCreateCtrl",
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
    let arr = []; 
    let searchedVal = selectLanguageSearchInp.value;
    arr = languages.filter(data => {
        return data.language.toLowerCase().includes(searchedVal.toLowerCase());
    }).map(data => `<li onclick="selectLanguage(this);" data-id=${data.id}">${data.language}</li>`).join("");
    selectLanguageOptions.innerHTML = arr;
});