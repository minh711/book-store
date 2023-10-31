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

    $('#upload-input').change(event => {
        if(event.target.files) {
            $('.upload-img').empty();
            let filesAmount = event.target.files.length;
            for (let i = 0; i < filesAmount; i++) {
                let reader = new FileReader();
                reader.onload = function(event) {
                    let html = `
                        <div id="uploadedImage${i}" class="upload-img-item mx-2 my-3" style="width: 120px; position: relative;">
                            <img style="width: 120px; height: 160px; object-fit: contain;" src="${event.target.result}">
                        </div>
                    `;
                    $('.upload-img').append(html);
                };
                reader.readAsDataURL(event.target.files[i]);
            }
        }
    });
});