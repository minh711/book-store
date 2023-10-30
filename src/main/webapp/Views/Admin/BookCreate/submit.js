$("#submit").submit(function(e){
    e.preventDefault();

    let form = $("#submit");

    // Form validation
    let isValid = validateSubmitBook();

    if (isValid) {
        let formData = new FormData();
        
        formData.append('txtLanguageId', selectedLanguageId);
        formData.append('txtPublisherId', selectedPublisherId);

        for (let i = 0; i < selectedAuthorIds.length; i++) {
            formData.append('selectedAuthorIds', selectedAuthorIds[i]);
        }

        for (let i = 0; i < selectedGenreIds.length; i++) {
            formData.append('selectedGenreIds', selectedGenreIds[i]);
        }
        
        formData.append('txtBookId', $('input[name="txtBookId"]').val());
        formData.append('txtTitle', $('input[name="txtTitle"]').val());
        formData.append('txtDescription', $('textarea[name="txtDescription"]').val());
        formData.append('submit', $('input[name="submit"]').val());

        let thumbnailInput = document.getElementById('upload-thumbnail-input');
        let picturesInput = document.getElementById('upload-input');

        if (thumbnailInput.files.length > 0) {
            formData.append('thumbnail', thumbnailInput.files[0]);
        }

        if (picturesInput.files.length > 0) {
            for (let i = 0; i < picturesInput.files.length; i++) {
                formData.append('pictures', picturesInput.files[i]);
            }
        }
        
        $.ajax({
            type: "post",
            enctype: "multipart/form-data",
            url: "/BookCreateCtrl",
            data: formData,
            traditional: true,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data === "duplicateId") {
                    $("#errId").text("Đã xảy ra lỗi. ID này đã tồn tại.");
                    $('html, body').animate({
                        scrollTop: $("#errId").offset().top
                    }, 100);
                }
            }
        });
    }
});

function validateSubmitBook() {
    return true;
}