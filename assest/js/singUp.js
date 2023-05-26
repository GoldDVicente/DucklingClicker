let userInput = document.getElementById('user');
let emailInput = document.getElementById('email');
let passwordInput1 = document.getElementById('password1');
let passwordInput2 = document.getElementById('password2');
let validateUserbool = false;
let validateEmailbool = false;
let validatePasswordbool = false;


function validateUser() {
    validateUserbool = true;
    let userRegexp = new RegExp('^[a-zA-Z0-9]{3,10}$');
    let userError = document.getElementById('userError');
    let userTextError = 'El nombre de usuario tiene que tener un minimo de 3 caracteres hasta un maximo de 10';

    userError.innerHTML = '';

    if (!userRegexp.test(userInput.value)) {
        userError.innerHTML = userTextError;
        validateUserbool = false;
    }

    if (userInput.value != "") {
        $.ajax({
            url: "http://localhost/user/UserName/" + userInput.value,
            method: "GET",
            success: () => {
                userError.innerHTML = "Nombre de usuario no valido";
                validateUserbool = false;
            }
        })
    }

}

function validateEmail() {
    validateEmailbool = true;
    let emailRegexp = new RegExp('^(.+)@(\\S+)$');
    let emailError = document.getElementById('emailError');
    let emailTextError = 'Email no valido';

    emailError.innerHTML = '';

    if (!emailRegexp.test(emailInput.value)) {
        emailError.innerHTML = emailTextError;
        validateEmailbool = false;
    }

    if (emailInput.value != "")
        $.ajax({
            url: "http://localhost/user/Email/" + emailInput.value,
            method: "GET",
            success: () => {
                emailError.innerHTML = emailTextError;
                validateEmailbool = false;
            }
        })
}

function validatePassword() {
    validatePasswordbool = true;
    let patternPasword = new RegExp();
    let passwordError = document.getElementById('passwordError');
    let noMatchEmailText = 'Las contraseñas no coinciden';
    let passwordTextError = 'La contraseña tiene que tener un minimo de x caracteres y cómo maximo x caracteres y solo puedes x';

    passwordError.innerHTML = '';

    if (passwordInput1.value != passwordInput2.value) {
        passwordError.innerHTML += noMatchEmailText;
        validatePasswordbool = false;
    }

    if (!patternPasword.test(paswordInput1.value) || !patternPasword.test(paswordInput2)) {
        passwordError.innerHTML += passwordTextError;
        validatePasswordbool = false;
    }

}

function singUp() {
    if (validateUser && validateEmail && validatePassword) {
        $.ajax({
            url: "assest/php/user.php",
            method: "POST",
            data: {
                UserName: userInput.value,
                Email: emailInput.value,
                Password: passwordInput1.value,
                Rol: 0,
            },
            success: function (result) {
                userError.innerHTML = result;
            }
        });
    }
    return false;
}

userInput.addEventListener("focusout", validateUser);
emailInput.addEventListener("focusout", validateEmail);
passwordInput1.addEventListener("focusout", validatePassword);
passwordInput2.addEventListener("focusout", validatePassword);
document.getElementById('singUp').addEventListener('click', singUp);