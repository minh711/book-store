
//get book attributes from BookSearch servlet
$(document).ready(function () {
    getOptions("author");
    getOptions("genre");
    getOptions("language");
    getOptions("publisher");
});

function getOptions(optionType) {
    $.ajax({
        url: "/BookSelectType",
        type: "GET",
        data: {optionType: optionType},
        success: function (data) {
            $("#" + optionType + "Select").append(data);
        }
    });
}

//send to servlet when user click on a type in list
$(document).ready(function () {
    $("#authorSelect").change(function () {

        var selectedAuthor = $(this).val();
        $.ajax({
            url: "/BookSelectType",
            type: "POST",
            data: {author: selectedAuthor},
            success: function (data) {
                displayBooks(data);
            }
        });
    });
});
$(document).ready(function () {
    $("#genreSelect").change(function () {
        var selectedGenre = $(this).val();
        $.ajax({
            url: "/BookSelectType",
            type: "POST",
            data: {genre: selectedGenre},
            success: function (data) {
                displayBooks(data);
            }
        });
    });
});
$(document).ready(function () {
    $("#languageSelect").change(function () {
        var selectedLanguage = $(this).val();
        $.ajax({
            url: "/BookSelectType",
            type: "POST",
            data: {language: selectedLanguage},
            success: function (data) {
                displayBooks(data);
            }
        });
    });
});
$(document).ready(function () {
    $("#publisherSelect").change(function () {
        var selectedPublisher = $(this).val();
        $.ajax({
            url: "/BookSelectType",
            type: "POST",
            data: {publisher: selectedPublisher},
            success: function (data) {
                displayBooks(data);
            }
        });
    });
});

//show list after processing in servlet
function displayBooks(data) {
    var bookDetails = $("#bookDetails");
    bookDetails.empty();
    var books = JSON.parse(JSON.stringify(data));
    $.each(books, function (index, book) {
        var bookInfo = "<p>Title: " + book.title + "</p><p>Publisher: " + book.publisher + "</p><p>Language: " + book.language + "</p>";
        bookDetails.append("<div class='book-info'>" + bookInfo + "</div>");
    });
    $("#SortByBestSeller").click(function () {

        books.sort(function (a, b) {
            return b.soleTotal - a.soleTotal;
        });
        displayBooks(books);
    });
    $("#SortByBestSale").click(function () {

        books.sort(function (a, b) {
            return b.discount - a.discount;
        });
        displayBooks(books);
    });
    $("#SortByHighestPrice").click(function () {

        books.sort(function (a, b) {
            return b.price - a.price;
        });
        displayBooks(books);
    });
    $("#SortByLowestPrice").click(function () {

        books.sort(function (a, b) {
            return a.price - b.price;
        });
        displayBooks(books);
    });
}