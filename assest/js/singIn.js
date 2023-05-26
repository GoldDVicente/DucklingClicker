function redirect(user){
    //sessionStorage.SessionName =

    sessionStorage.setItem("id",user.texto[0].id_user);
    sessionStorage.setItem("username",user.texto[0].username);
    window.location.href = "ducklingClicker.html";
}

function singIn() {
    let inputUser = document.getElementById('user');
    let inputPasword = document.getElementById('password');
    let userError = document.getElementById('userError');
    userError.innerHTML = '';

    if (inputUser.value != "" && inputPasword != "")
        $.ajax({
            url: "http://localhost/clickerPHP/user/" + inputUser.value + "/" + inputPasword.value,
            method: "GET",
            success: (result) => {
                redirect(JSON.parse(result));
            },
            error: () => {
                userError.innerHTML = "Usuario y/o Contraseña no valida";
            },
        });
}

document.getElementById('singIn').addEventListener('click', singIn);