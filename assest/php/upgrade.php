<?php
include 'connection.php';
include 'queries.php';

//GET -> SELECT
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if(isset($_GET['id'])){
        $select_value = "SELECT * FROM upgrade WHERE id_upgrade = ".$_GET['id'];

        SelectValues($connection, $select_value);
        exit();
    }

    $select_value = "SELECT * FROM upgrade";
    SelectValues($connection, $select_value);
}

//POST -> CREATE
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $upgrade = json_decode(file_get_contents('php://input'));
    $insert_value = "INSERT upgrade(`name`,`description`,`image`,price,production,id_item) VALUES('$upgrade->name','$upgrade->description','$upgrade->image',$upgrade->price,$upgrade->production,$upgrade->id_item)";

    $query = mysqli_query($connection, $insert_value);

    $query ? OkRequest($upgrade->name): BadRequest($connection);
    
    exit();
}

//PUT -> UPDATE
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    if (isset($_GET['id'])) {
        $upgrade = json_decode(file_get_contents('php://input'));
        $update_Value = "UPDATE upgrade SET `name`='$upgrade->name', `description`='$upgrade->description', `image`='$upgrade->image',price=$upgrade->price,production=$upgrade->production";
    }else
        NotFoundRequest();
    exit();
}

//DELETE
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    if(isset($_GET['id'])){
        $delete_value = "DELETE FROM upgrade WHERE id_upgrade="-$_GET['id'];

        $query = mysqli_query($connection, $delete_value);

        $query ? NotFoundRequest() : BadRequest($connection);
    }
}

mysqli_close($conexion);
?>