
const name = document.getElementByName('name');
const pass = document.getElementsByName('pass');
const form = document.getElementById('form');
const error = document.getElementById('mess');

form.addEventListener('submit', (e) => {
    let messages = [];
    const usernameRegex = /^[a-zA-Z][a-zA-Z0-9]{4,19}$/;
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=[\]{};':"|,./<>?])[a-zA-Z\d!@#$%^&*()_+\-=[\]{};':"|,./<>?]{4,19}$/;

    if (!name.match(usernameRegex)) {
        messages.push('tên nên dài t? 5 d?n 20 ký t? và ph?i b?t d?u b?ng ch?');

    }

    if (!pass.match(passwordRegex)) {
        messages.push('m?t kh?u ph?i dài t? 5 d?n 20 ký t?');

    }

    if (messages.length > 0) {
        e.preventDefault();
        error.innerText = messages.join(', ');
    }


});


    