$(document).ready(function () {
    loadDistributors();
    loadBooks();
    loadHistory();
});

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

function loadDistributors() {
    $.ajax({
        url: "/DistributorCtrl",
        type: "get",
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
}

selectDistributorSearchInp.addEventListener("keyup", () => {
    let arr = []; 
    let searchedVal = selectDistributorSearchInp.value;
    arr = distributors.filter(data => {
        return data.distributor.toLowerCase().includes(searchedVal.toLowerCase());
    }).map(data => `<li onclick="updateDistributor(this); data-id=${data.id}">${data.distributor}</li>`).join("");
    selectDistributorOptions.innerHTML = arr;
});

selectDistributorSelectBtn.addEventListener("click", () => {
    selectDistributorContainer.classList.toggle("active");
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

// Select Book Container
var books = [];
const selectBookContainer = document.querySelector(".select-book-container");
const selectBookSelectBtn = selectBookContainer.querySelector(".select-btn");
const selectBookSearchInp = selectBookContainer.querySelector("input");
const selectBookOptions = selectBookContainer.querySelector(".options");
const selectBookContent = selectBookContainer.querySelector(".content");

function loadBooks() {
    $.ajax({
        url: "/BookController",
        type: "get",
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
    let arr = []; 
    let searchedVal = selectBookSearchInp.value;
    arr = books.filter(data => {
        return data.title.toLowerCase().includes(searchedVal.toLowerCase()) || data.id.toString().includes(searchedVal);
    }).map(data => `<li onclick="updateBook(this); data-id="${data.id}""><img class="thumbnail" src="/Images/${data.thumnail}">#${data.id} | ${data.title}</li>`).join("");
    selectBookOptions.innerHTML = arr;
});

selectBookSelectBtn.addEventListener("click", () => {
    selectBookContainer.classList.toggle("active");
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
        url: "/BookTransactionCtrl",
        type: "get",
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
            url: "/BookTransactionCtrl",
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
        url: "/BookTransactionCtrl",
        type: "post",
        data: {bookId: bookId, distributorId: distributorId, quantity: quantity, total: total},
        success: function () {
            loadHistory();
        },
        error: function (xhr) {}
    });
}