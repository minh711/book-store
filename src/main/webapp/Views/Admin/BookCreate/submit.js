var formatedDescription = "";

// Prevent submit form on enter
$('input').keypress(function(e) {
    if (e.which === 13) {
        return false;
    }
});

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
        formData.append('txtDescription', formatedDescription);
        formData.append('txtPrice', $('input[name="txtPrice"]').val()); 
        formData.append('txtSalePrice', $('input[name="txtSalePrice"]').val()); 
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
                    $("#errId").text("Đã xảy ra lỗi. Mã sách này đã tồn tại.");
                }
            }
        });
    }
});

function validateSubmitBook() {
    // Declaration
    // Values
    let bookId = $('input[name="txtBookId"]').val();
    let title = $('input[name="txtTitle"]').val();
    let description = $('textarea[name="txtDescription"]').val();
    let price = $('input[name="txtPrice"]').val();
    let salePrice = $('input[name="txtSalePrice"]').val();
    
    // Objects
    let thumbnailInput = $("#upload-thumbnail-input")[0].files;
    let picturesInput = $("#upload-input")[0].files;
    
    // Error message objects
    let errId = $("#errId");
    let errTitle = $("#errTitle");
    let errDescription = $("#errDescription");
    let errSalePrice = $("#errSalePrice");
    let errPrice = $("#errPrice");
    let errPublisher = $("#errPublisher");
    let errAuthor = $("#errAuthor");
    let errGenre = $("#errGenre");
    let errLanguage = $("#errLanguage");
    let errThumbnail = $("#errThumbnail");
    let errPictures = $("#errPictures");

    let isInvalid = false;
    
    // Clear error message
    errId.text("");
    errTitle.text("");
    errDescription.text("");
    errSalePrice.text("");
    errPrice.text("");
    errPublisher.text("");
    errAuthor.text("");
    errGenre.text("");
    errLanguage.text("");
    errThumbnail.text("");
    errPictures.text("");
    
    // ID validation 
    if (bookId === "") {
        errId.text("Vui lòng nhập mã sách.");
        isInvalid = true;
    } else if (bookId <= 0) {
        errId.text("Mã sách phải là số nguyên dương.");
        isInvalid = true;
    } else if (bookId > 2147483647) {
        errId.text("Số quá lớn.");
        isInvalid = true;
    }
    
    // Title validation
    if (title.length <= 0 || title.length > 100) {
        if (title.length === 0) {
            errTitle.text("Vui lòng nhập tên sách.");
        } else {
            errTitle.text("Độ dài tên sách không quá 100 ký tự, hiện tại: " + title.length + ".");
        }
        isInvalid = true;
    }
    
    // Description validation 
    formatedDescription = description.trim().replace(/\r\n|\r|\n/g, "<br/>");
    if (formatedDescription.length <= 0 || formatedDescription.length > 2000) {
        if (formatedDescription.length === 0) {
            errDescription.text("Vui lòng nhập mô tả.");
        } else {
            errDescription.text("Độ dài mô tả không quá 2000 ký tự, hiện tại: " + formatedDescription.length + ".");
        }
        isInvalid = true;
    } 
    
    // Price and Sale Price validation 
    if (salePrice === "") {
        errSalePrice.text("Vui lòng nhập giá tiền.");
        isInvalid = true;
    } else if (salePrice <= 0) {
        errSalePrice.text("Giá tiền phải là số nguyên dương.");
        isInvalid = true;
    } else if (salePrice > price) {
        errSalePrice.text("Giá giảm không được lớn hơn giá gốc.");
    }
    
    if (price === "") {
        errPrice.text("Vui lòng nhập giá tiền.");
        isInvalid = true;
    } else if (price <= 0) {
        errPrice.text("Giá tiền phải là số nguyên dương.");
        isInvalid = true;
    }
    
    // Publisher validation
    if (selectedPublisherId === 0) {
        errPublisher.text("Vui lòng chọn một nhà xuất bản.");
    }
    
    // Author validation
    if (selectedAuthorIds.length === 0) {
        errAuthor.text("Vui lòng chọn một hoặc nhiều tác giả.");
    }
    
    // Genre validation
    if (selectedGenreIds.length === 0) {
        errGenre.text("Vui lòng chọn một hoặc nhiều thể loại.");
    }
    
    // Language validation
    if (selectedLanguageId === 0) {
        errLanguage.text("Vui lòng chọn một ngôn ngữ.");
    }
    
    // Upload picture validation
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    let totalSize = 0;
    const maxTotalSize = 50 * 1024 * 1024; // 50MB
    
    // Thumbnail validation
    if (thumbnailInput.length === 0) {
        errThumbnail.text("Vui lòng chọn ảnh thu nhỏ.");
        isInvalid = true;
    } else {
        let thumbnailFileName = thumbnailInput[0].name;
        if (!hasExtension(thumbnailFileName, ['.jpg', '.jpeg', '.png', '.jfif'])) {
            errThumbnail.text("Vui lòng chọn file hình ảnh.");
            isInvalid = true;
        }

        let thumbnailFileSize = thumbnailInput[0].size; // Size in bytes
        if (thumbnailFileSize > maxSize) {
            errThumbnail.text("Kích thước file quá lớn. Vui lòng chọn file có kích thước nhỏ hơn 5MB.");
            isInvalid = true;
        }
    }
    
    // Pictures validation
    if (picturesInput.length === 0) {
        errPictures.text("Vui lòng chọn một hoặc nhiều ảnh minh họa.");
        isInvalid = true;
    } else if (picturesInput.length > 5) {
        errPictures.text("Vui lòng chọn không quá 5 ảnh minh họa.");
        isInvalid = true;
    } else {
        for (let i = 0; i < picturesInput.length; i++) {
            let fileName = picturesInput[i].name;
            if (!hasExtension(fileName, ['.jpg', '.jpeg', '.png', '.jfif'])) {
                errPictures.text("Vui lòng chọn file hình ảnh!");
                isInvalid = true;
            }
            
            let fileSize = picturesInput[i].size; // Size in bytes
            if (fileSize > maxSize) {
                errPictures.text("Kích thước file quá lớn. Vui lòng chọn file có kích thước nhỏ hơn 5MB.");
                isInvalid = true;
            }

            totalSize += fileSize;
            if (totalSize > maxTotalSize) {
                errPictures.text("Tổng kích thước ảnh vượt quá 50MB. Vui lòng chọn ít ảnh hơn hoặc giảm kích thước của ảnh.");
                isInvalid = true;
            }
        }
    }

    if (isInvalid) {
        return false;
    } 
    return true;
}

function hasExtension(fileName, exts) {
    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
}