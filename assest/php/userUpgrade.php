<?php
include 'connection.php';
include 'queries.php';

//GET -> SELECT
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['id'])) {
        $select_value = "SELECT * FROM `upgrade` LEFT JOIN `user_upgrade` on `upgrade`.`id_upgrade` = user_upgrade.id_upgrade WHERE user_upgrade.id_user =" . $_GET['id'];

        SelectValues($connection, $select_value);
        exit();
    }

    $select_value = "SELECT * FROM `upgrade` LEFT JOIN `user_upgrade` on `upgrade`.`id_upgrade` = user_upgrade.id_upgrade";
    SelectValues($connection, $select_value);
}
/*
//POST -> CREATE
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $item = json_decode(file_get_contents('php://input'));
    $insert_value = "INSERT item(`name`,`description`,`image`,price,production) VALUES('$item->name','$item->description','$item->image',$item->price,$item->production)";

    $query = mysqli_query($connection, $insert_value);

    $query ? OkRequest($item->name) : BadRequest($connection);

    exit();
}

//PUT -> UPDATE
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    if (isset($_GET['id'])) {
        $item = json_decode(file_get_contents('php://input'));
        $update_Value = "UPDATE item SET `name`='$item->name', `description`='$item->description', `image`='$item->image',price=$item->price,production=$item->production";
    } else
        NotFoundRequest();
    exit();
}

//DELETE
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    if (isset($_GET['id'])) {
        $delete_value = "DELETE FROM item WHERE id_item=" - $_GET['id'];

        $query = mysqli_query($connection, $delete_value);

        $query ? NotFoundRequest() : BadRequest($connection);
    }
}
*/
mysqli_close($conexion);
