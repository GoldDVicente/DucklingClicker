<?php
include 'request.php';

function SelectValues($conexion, $tring)
{
    $result = mysqli_query($conexion, $tring);
    if (mysqli_num_rows($result) > 0) {
        $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
        $arrayjson = array();

        foreach ($rows as $row)
            $arrayjson[] = $row;

        OkRequest($arrayjson);
    } else
        NotFoundRequest();
    exit();
}

function UpdateValues($conexion, $string, $value)
{
    $result = mysqli_query($conexion, $string);
    $result ? OkRequest($value) : BadRequest($conexion);
    exit();
}
