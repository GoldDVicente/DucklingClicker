<?php
include 'connection.php';
include 'queries.php';

//GET -> SELECT
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if(isset($_GET['id'])){
        $select_value = "SELECT * FROM achievement WHERE id_achievement = ".$_GET['id'];

        SelectValues($connection, $select_value);
        exit();
    }

    $select_value = "SELECT * FROM achievement";
    SelectValues($connection, $select_value);
}

//POST -> CREATE
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $achievement = json_decode(file_get_contents('php://input'));
    $insert_value = "INSERT achievement(`name`,`description`,id_item) 
                    VALUES('$achievement->name','$achievement->description','$achievement->id_item')";

    $query = mysqli_query($connection, $insert_value);

    $query ? OkRequest($achievement->name): BadRequest($connection);
    
    exit();
}

//PUT -> UPDATE
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    if (isset($_GET['id'])) {
        $achievement = json_decode(file_get_contents('php://input'));
        $update_Value = "UPDATE achievement SET `name`='$achievement->name', `description`='$achievement->description', `image`='$achievement->id_item'";
    }else
        NotFoundRequest();
    exit();
}

//DELETE
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    if(isset($_GET['id'])){
        $delete_value = "DELETE FROM achievement WHERE id_achievement="-$_GET['id'];

        $query = mysqli_query($connection, $delete_value);

        $query ? NotFoundRequest() : BadRequest($connection);
    }
}

mysqli_close($conexion);
?>