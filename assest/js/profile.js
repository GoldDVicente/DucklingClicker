let userInput = document.getElementById('user');
let emailInput = document.getElementById('email');
let avatarImg = document.getElementById('avatarImg');
let avatarInput = document.getElementById('avatar');
avatarInput.value = "";


function changeAvatar() {
    console.log(avatarInput.value);
    if (avatarInput.value != "") {
        var reader = new FileReader();
        reader.readAsDataURL(avatarInput.files[0]);
        reader.onload = (e) => {
            avatarImg.src = e.target.result;
        }

    }
}

function changeMode() {
    console.log("ChangeMode");
    userInput.disabled = !userInput.disabled;
    emailInput.disabled = !emailInput.disabled;
}
function saveChanges() {
    console.log("SaveMode");
    $.ajax({
        url: "assest/php/user.php",
        method: "PUT",
        data: {
            UserName: userInput.value,
            UserName: userInput.value,
            Email: emailInput.value,
            Password: passwordInput1.value,
        }
    });
}

avatarInput.addEventListener('change', changeAvatar);
document.getElementById('editButton').addEventListener('click', changeMode);
document.getElementById('saveButton').addEventListener('click', saveChanges);