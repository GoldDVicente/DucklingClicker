<?php
$connection = mysqli_connect("localhost", "root", "", "ducklingclicker");
if (!$connection) {
    echo ("Error de conexión");
    exit();
}
?>