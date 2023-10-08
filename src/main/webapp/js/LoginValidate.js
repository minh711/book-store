
const NameRegex = /^[a-zA-Z]{2,32}$/;
const usernameRegex = /^[a-zA-Z][a-zA-Z0-9]{4,32}$/;
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=[\]{};':"|,./<>?])[a-zA-Z\d!@#$%^&*()_+\-=[\]{};':"|,./<>?]{,32}$/;
const phoneRegex = /^(0[1-9][0-9]{8,9})$/;

function vali() {


    const name = document.getElementByName('name');
    const pass = document.getElementsByName('pass');
    const form = document.getElementById('form');
    const error1 = document.getElementById('messName');
    const error2 = document.getElementById('messPass');

    form.addEventListener('submit', (e) => {

        if (!name.match(usernameRegex)) {
            error1.innerText = ('Tên nên dài từ 4 đến 32 ký tự và bắt đầu bằng chữ');

        }

        if (!pass.match(passwordRegex)) {
            error2.innerText = ('mật khẩu nên dài ít hơn 32 ký tự');

        }



    });

}

function valiSign() {


    const name = document.getElementByName('name');
    const pass = document.getElementsByName('pass');
    const form = document.getElementById('form');
    const error1 = document.getElementById('messName');
    const error2 = document.getElementById('messPass');

    form.addEventListener('submit', (e) => {

        if (!name.match(usernameRegex)) {
            error1.innerText = ('Tên nên dài từ 4 đến 20 ký tự và bắt đầu bằng chữ');

        }

        if (!pass.match(passwordRegex)) {
            error2.innerText = ('mật khẩu nên dài ít hơn 20 ký tự');

        }



    });


}


    