$(document).ready(function () {
    $('#pics').val(''); // clear the input

    $('#pics').change(function () {
        if (formValidate()) {
            $('#form-pics').submit();
        } else {
            $('#pics').val('');
        }
    });
});

function formValidate() {
    let pics = $("#pics")[0].files;

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
    }

    return true;
}

function hasExtension(fileName, exts) {
    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
}