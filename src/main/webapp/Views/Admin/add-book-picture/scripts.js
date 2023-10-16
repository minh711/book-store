loadBookPictures();

$(document).ready(function () {
    $('#pics').val(''); // clear the input

    $('#pics').change(function () {
        if (pictureValidate()) {
            let fileContent = new FormData();
            let files = $('#pics')[0].files;
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
                    $('#pics').val('');
                    loadBookPictures();
                }
            });
        } else {
            $('#pics').val('');
        }
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
    
    updateSelectBtnsVisibility();
});

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
    let pics = $("#pics")[0].files;
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    let totalSize = 0;
    const maxTotalSize = 50 * 1024 * 1024; // 50MB

    if (pics.length === 0) {
        alert("Vui lòng chọn một hoặc nhiều ảnh!");
        return false;
    }

    for (let i = 0; i < pics.length; i++) {
        let fileName = pics[i].name;
        if (!hasExtension(fileName, ['.jpg', '.jpeg', '.png'])) {
            alert("Vui lòng chọn file hình ảnh!");
            return false;
        }
        
        let fileSize = pics[i].size; // Size in bytes

        if (fileSize > maxSize) {
            alert("Kích thước file quá lớn. Vui lòng chọn file có kích thước nhỏ hơn 5MB.");
            return false;
        }
        
        totalSize += fileSize;
        console.log(totalSize);
        if (totalSize > maxTotalSize) {
            console.log('yes');
            alert("Tổng kích thước ảnh vượt quá 50MB. Vui lòng chọn ít ảnh hơn hoặc giảm kích thước của ảnh.");
            return false;
        }
    }
    
    return true;
}

function hasExtension(fileName, exts) {
    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
}

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

function updateSelectBtnsVisibility() {
    if ($(".delete-pic-checkbox").length > 0) {
        $('#select-btns').removeClass("d-none"); 
    } else {
        $('#select-btns').addClass("d-none"); 
    }
}
