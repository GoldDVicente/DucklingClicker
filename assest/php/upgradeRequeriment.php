<?php
include 'connection.php';
include 'queries.php';

//GET -> SELECT
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['id'])) {
        $select_value = "SELECT * FROM upgrade_requirement WHERE id_upgrade = " . $_GET['id'];

        SelectValues($connection, $select_value);
        exit();
    }

    $select_value = "SELECT * FROM upgrade_requirement";
    $result = mysqli_query($conexion, $tring);
    if (mysqli_num_rows($result) > 0) {
        $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
        $arrayjson = array();

        foreach ($rows as $row)
            
            $arrayjson[] = $row;

        OkRequest($arrayjson);


    SelectValues($connection, $select_value);
}

mysqli_close($conexion);
