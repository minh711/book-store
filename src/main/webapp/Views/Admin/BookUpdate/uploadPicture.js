$(document).ready(function() {
    
    $('.upload-thumbnail-area').click(function() {
        $('#upload-thumbnail-input').trigger('click');
    });

    $('.upload-area').click(function() {
        $('#upload-input').trigger('click');
    });
    
    $('#upload-thumbnail-input').change(event => {
        const input = event.target;
        const $uploadThumbnail = $('.upload-thumbnail');
    
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $uploadThumbnail.html(`<img style="width: 120px; height: 160px; object-fit: contain;" src="${e.target.result}" alt="Uploaded Image">`);
            };
            reader.readAsDataURL(input.files[0]);
        }
    });

    $('#upload-input').change(function () {
        if (pictureValidate()) {
            let fileContent = new FormData();
            let files = $('#upload-input')[0].files;
            for (let i = 0; i < files.length; i++) {
                fileContent.append("files", files[i]);
            }
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "/BookPictureUploadCtrl",
                data: fileContent,
                traditional: true,
                processData: false,
                contentType: false,
                success: function () {
                    $('#upload-input').val('');
                    loadBookPictures();
                }
            });
        } 
    });

    loadBookPictures();
    
    $("#btn-select-all").prop("disabled", false);
    $("#btn-unselect-all").prop("disabled", true);
    $("#btn-delete-selected").prop("disabled", true);
       
    updateSelectBtnsVisibility();
});

$(document).on('change', '.delete-pic-checkbox', function () {
    if ($(".delete-pic-checkbox:checked").length === $(".delete-pic-checkbox").length) {
        $("#btn-select-all").prop("disabled", true);
        $("#btn-unselect-all").prop("disabled", false);
        $("#btn-delete-selected").prop("disabled", false);
    } else if ($(".delete-pic-checkbox:checked").length === 0) { 
        $("#btn-unselect-all").prop("disabled", true);
        $("#btn-delete-selected").prop("disabled", true);
    } else {
        $("#btn-select-all").prop("disabled", false);
        $("#btn-unselect-all").prop("disabled", false);
        $("#btn-delete-selected").prop("disabled", false);
    }
});

function loadBookPictures() {
    $.ajax({
        url: "/BookPictureCtrl",
        type: "get",
        success: function (data) {
            let bookPicturesContainer = $("#bookPictures");
            bookPicturesContainer.empty();
            bookPicturesContainer.append(data);
            updateSelectBtnsVisibility();
        },
        error: function (xhr) {}
    });
}

function updateSelectBtnsVisibility() {
    if ($(".delete-pic-checkbox").length > 0) {
        $('#select-btns').removeClass("d-none"); 
    } else {
        $('#select-btns').addClass("d-none"); 
    }
}

function selectAll() {
    $(".delete-pic-checkbox").prop("checked", true);
    $("#btn-select-all").prop("disabled", true);
    $("#btn-unselect-all").prop("disabled", false);
    $("#btn-delete-selected").prop("disabled", false);
}

function unselectAll() {
    $(".delete-pic-checkbox").prop("checked", false);
    $("#btn-select-all").prop("disabled", false);
    $("#btn-unselect-all").prop("disabled", true);
    $("#btn-delete-selected").prop("disabled", true);
}

function pictureValidate() {
    let pics = $("#upload-input")[0].files;
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    let totalSize = 0;
    const maxTotalSize = 50 * 1024 * 1024; // 50MB

    let currentAmount =  $(".delete-pic-checkbox").length;

    if (pics.length === 0) {
        $("#errPictures").text("Vui lòng chọn một hoặc nhiều ảnh minh họa.");
        return false;
    } else if ((pics.length + currentAmount) > 5) {
        $("#errPictures").text("Vui lòng chọn không quá 5 ảnh minh họa.");
        return false;
    }

    for (let i = 0; i < pics.length; i++) {
        let fileName = pics[i].name;
        if (!hasExtension(fileName, ['.jpg', '.jpeg', '.png'])) {
            $("#errPictures").text("Vui lòng chọn file hình ảnh.");
            return false;
        }
        
        let fileSize = pics[i].size; // Size in bytes

        if (fileSize > maxSize) {
            $("#errPictures").text("Kích thước file quá lớn. Vui lòng chọn file có kích thước nhỏ hơn 5MB.");
            return false;
        }
        
        totalSize += fileSize;
        if (totalSize > maxTotalSize) {
            $("#errPictures").text("Tổng kích thước ảnh vượt quá 50MB. Vui lòng chọn ít ảnh hơn hoặc giảm kích thước của ảnh.");
            return false;
        }
    }
    
    return true;
}

function hasExtension(fileName, exts) {
    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
}

function deleteBookPicture(button) {
    let bookPictureId = $(button).data("id");
    
    if (confirm('Xác nhận xóa hình ảnh?')) {
        $.ajax({
            url: "/BookPictureCtrl",
            type: "post",
            data: {deletePic: bookPictureId},
            success: function () {
                loadBookPictures();
            },
            error: function (xhr) {}
        });
    } else return;
}

function deleteSelected() {
    let selectedIds = [];
    
    $(".delete-pic-checkbox:checked").each(function () {
        selectedIds.push($(this).data("id"));
    });

    if (confirm('Xác nhận xóa các hình ảnh đã chọn?')) {
        $.ajax({
            url: "/BookPictureCtrl",
            type: "post", 
            data: {deleteSelected: selectedIds},
            traditional: true,
            success: function () {
                loadBookPictures();
            },
            error: function (xhr) {}
        });
    } else return;
}