// Initilization
var distributorId;
var bookId;
const quantityInp = $("input[name='quantity']");
const totalInp = $("input[name='total']");

const historyTable = new DataTable('#historyTable');

// Select Distributor Container
var distributors = [];
const selectDistributorContainer = document.querySelector(".select-distributor-container");
const selectDistributorSelectBtn = selectDistributorContainer.querySelector(".select-btn");
const selectDistributorSearchInp = selectDistributorContainer.querySelector("input");
const selectDistributorOptions = selectDistributorContainer.querySelector(".options");
const selectDistributorContent = selectDistributorContainer.querySelector(".content");

// Select Book Container
var books = [];
const selectBookContainer = document.querySelector(".select-book-container");
const selectBookSelectBtn = selectBookContainer.querySelector(".select-btn");
const selectBookSearchInp = selectBookContainer.querySelector("input");
const selectBookOptions = selectBookContainer.querySelector(".options");
const selectBookContent = selectBookContainer.querySelector(".content");

$(document).ready(function () {
    loadDistributors();
    loadBooks();
    loadHistory();
});

function loadDistributors() {
    $.ajax({
        url: "/Manager/Book/Transaction",
        type: "post",
        data: {isLoadDistributors: true},
        dataType: "json",
        success: function (data) {
            distributors = data;
            addDistributor();
        },
        error: function (xhr) {
        }
    });
}

function addDistributor() {
    distributors.forEach(distributor => {
        let li = '<li onclick="updateDistributor(this);" data-id="' + distributor.id + '">' + distributor.distributor + '</li>';
        selectDistributorOptions.insertAdjacentHTML("beforeend", li);
    });
}

function updateDistributor(selectedLi) {
    selectDistributorSelectBtn.firstElementChild.innerText = selectedLi.innerText;
    distributorId = $(selectedLi).data("id");
    
    selectDistributorContainer.classList.toggle("active");
    addDistributor();
}



selectDistributorSearchInp.addEventListener("keyup", () => {
    searchDistributor();
});

function searchDistributor() {
    let arr = [];
    let searchedVal = selectDistributorSearchInp.value.trim();
    arr = distributors
        .filter(data => {
            return data.distributor.toLowerCase().includes(searchedVal.toLowerCase());
        })
        .map(data => `<li onclick="updateDistributor(this);" data-id="${data.id}">${data.distributor}</li>`)
        .join("");
    
    let isUnique = true;
    for (const item of distributors) {
        if (item.distributor.toLowerCase() === searchedVal.toLowerCase().trim()) {
            isUnique = false;
            break;
        }
    }
    if (isUnique && searchedVal !== "") {
        selectDistributorOptions.innerHTML = "";
        selectDistributorOptions.innerHTML = arr;
        selectDistributorOptions.insertAdjacentHTML('afterbegin', `<li onclick="addNewDistributor('${searchedVal}');">Thêm nhà phân phối mới mới <span class="fw-bold mx-2">${searchedVal}</span></li>`);
    } else {
        selectDistributorOptions.innerHTML = "";
        selectDistributorOptions.innerHTML = arr;
    }
}

function addNewDistributor(newDistributor) {
    $.ajax({
        url: "/Manager/Book/Transaction",
        type: "post",
        data: {addDistributor: newDistributor.trim()},
        success: function () {
            loadDistributors();
            selectDistributorSearchInp.value = newDistributor;
            searchDistributor();
        },
        error: function (xhr) {
        }
    });
}

selectDistributorSelectBtn.addEventListener("click", () => {
    selectDistributorContainer.classList.toggle("active");
    selectDistributorSearchInp.value = null;
    searchDistributor();
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectDistributorContent).display === 'block') {
        const isClickInsideSelectDistributorContainer = selectDistributorContainer.contains(event.target);

        if (!isClickInsideSelectDistributorContainer) {
            selectDistributorContainer.classList.toggle("active");
        }
    }
});
// End Select Distributor Container

function loadBooks() {
    $.ajax({
        url: "/Manager/Book/Transaction",
        type: "post",
        data: {isLoadBooks: true},
        dataType: "json",
        success: function (data) {
            books = data;
            addBook();
        },
        error: function (xhr) {
        }
    });
}

function addBook() {
    books.forEach(book => {
        let li = '<li onclick="updateBook(this);" data-id="' + book.id + '"><img class="thumbnail" src="/Images/' + book.thumbnail + '">' + '#' + book.id + ' | ' + book.title + '</li>';
        selectBookOptions.insertAdjacentHTML("beforeend", li);
    });
}

function updateBook(selectedLi) {
    selectBookSelectBtn.firstElementChild.innerText = selectedLi.innerText;
    bookId = $(selectedLi).data("id");
    selectBookContainer.classList.toggle("active");
}

selectBookSearchInp.addEventListener("keyup", () => {
    searchBook();
});

function searchBook() {
    let arr = [];
    let searchedVal = selectBookSearchInp.value;
    arr = books.filter(data => {
        return data.title.toLowerCase().includes(searchedVal.toLowerCase()) || data.id.toString().includes(searchedVal);
    }).map(data => `<li onclick="updateBook(this);" data-id="${data.id}""><img class="thumbnail" src="/Images/${data.thumbnail}">#${data.id} | ${data.title}</li>`).join("");
    selectBookOptions.innerHTML = arr;
}

selectBookSelectBtn.addEventListener("click", () => {
    selectBookContainer.classList.toggle("active");
    selectBookSearchInp.value = null;
    searchBook();
});

document.addEventListener('click', function(event) {
    if (window.getComputedStyle(selectBookContent).display === 'block') {
        const isClickInsideSelectBookContainer = selectBookContainer.contains(event.target);

        if (!isClickInsideSelectBookContainer) {
            selectBookContainer.classList.toggle("active");
        }
    }
});
// End Select Book Container

// History
function loadHistory() {
    $.ajax({
        url: "/Manager/Book/Transaction",
        type: "post",
        data: {isLoadHistory: true},
        dataType: "json",
        success: function (data) {
            let history = $("#history");
            history.empty();
            history.append(data);
            
            historyTable.clear().draw(); 

            data.forEach(function (item) {
                historyTable.row.add([
                    '<img class="thumbnail" src="/Images' + item.thumbnail + '">', 
                    item.bookId, 
                    item.title, 
                    item.quantity,
                    item.total,
                    item.date, 
                    item.executor,
                    item.distributor,
                    '<div class="btn btn-link" onclick="return revert(this);" data-id="' + item.id + '">Hoàn tác</div>'
                ]);
            });

            historyTable.draw();
        },
        error: function (xhr) {}
    });
}

function revert(button) {
    let id = $(button).data("id");
    if (confirm('Xác nhận hoàn tác?')) {
        $.ajax({
            url: "/Manager/Book/Transaction",
            type: "post",
            data: {deleteId: id},
            success: function () {
                loadHistory();
            },
            error: function (xhr) {}
        });
    } else return;
}
// End History

function addNew() {
    quantity = quantityInp.val();
    total = totalInp.val();
    $.ajax({
        url: "/Manager/Book/Transaction",
        type: "post",
        data: {bookId: bookId, distributorId: distributorId, quantity: quantity, total: total},
        success: function () {
            loadHistory();
        },
        error: function (xhr) {}
    });
}