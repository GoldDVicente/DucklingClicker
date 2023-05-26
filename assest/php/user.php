<?php
include 'connection.php';
include 'queries.php';


//GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['id'])) {
        //$select_value = "SELECT * FROM `user` WHERE id_user =" . $_GET['id'];
        $select_value = "SELECT * FROM `user` WHERE id_user =" . $_GET['id'];
        SelectValues($connection, $select_value);
        exit();
    }

    if (isset($_GET['username']) & isset($_GET['password'])) {
        $select_value = "SELECT * FROM `user` WHERE username = '" . $_GET['username'] . "' AND `password` ='" . $_GET['password'] . "'";
        SelectValues($connection, $select_value);
        exit();
    }

    if (isset($_GET['username'])) {
        $select_value = "SELECT * FROM `user` WHERE username = '" . $_GET['username'] . "'";
        SelectValues($connection, $select_value);
        exit();
    }

    if (isset($_GET['email'])) {
        $select_value = "SELECT * FROM `user` WHERE email = '" . $_GET['email'] . "'";
        SelectValues($connection, $select_value);
        exit();
    }
    $select_value = "SELECT * FROM `user`";
    SelectValues($connection, $select_value);
    exit();

}

//POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //Create new user
    $user = json_decode(file_get_contents('php://input'));
    $insert_value = "INSERT INTO `user`(username, email,`password`,avatar,`role`) VALUES('" . $user->username . "','" . $user->email . "','" . $user->password . "','default.png'," . $user->role . ")";

    $query = mysqli_query($connection, $insert_value);

    $query ? OkRequest($user->username) : BadRequest($connection);

    exit();
}

//PUT
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    //Update USER 
    if (isset($_GET['id'])) {
        $user = json_decode(file_get_contents('php://input'));
        $update_Value = "UPDATE `user` SET username = '" . $user->username . "', email='" . $user->email . "', `password`='" . $user->password . "', role='" . $user->role . "' WHERE id_user=" . $_GET['id'];
        UpdateValues($connection, $update_Value, $user->username);
    } else
        NotFoundRequest();
    exit();
}

//DELETE
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    if (isset($_GET['id'])) {
        $delete_value = "DELETE FROM `user` WHERE id_user =" . $_GET['id'];

        $query = mysqli_query($connection, $delete_value);

        $query ? NotFoundRequest() : BadRequest($connection);

        exit();
    }
}

mysqli_close($connection);
?>