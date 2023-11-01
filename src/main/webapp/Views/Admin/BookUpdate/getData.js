var book;
var selectedPublisherId = 0;
var selectedLanguageId = 0;
var selectedAuthorIds = [];
var selectedGenreIds = [];
var thumbnailURL = "";

$(document).ready(function() {
    $.ajax({
        url: "/BookUpdateCtrl",
        type: "post",
        data: {loadBook: bookId},
        dataType: "json",
        success: function (data) {
            book = data.book;
            $("input[name='txtBookId'").val(book.id);
            $("input[name='txtTitle'").val(book.title);
            $("textarea[name='txtDescription'").val(book.description.replace(/<br\s?\/?>/g,"\n"));
            $("input[name='txtSalePrice'").val(book.salePrice);
            $("input[name='txtPrice'").val(book.price);
            
            selectedPublisherId = data.book.pubisherId;
            selectedLanguageId = data.book.languageId;
            selectedAuthorIds = data.bookAuthorIds;
            selectedGenreIds = data.bookGenreIds;
            loadPublishers();
            loadLanguages(); 
            loadAuthors(); 
            loadGenres();
            
            thumbnailURL = data.book.thumbnail;
            if (thumbnailURL !== "") {
                $('.upload-thumbnail').html(`<img style="width: 120px; height: 160px; object-fit: contain;" src="/Images/${thumbnailURL}" alt="Uploaded Image">`);
            }
        },
        error: function (xhr) {
        }
    });
});