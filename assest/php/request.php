<?php
function OkRequest($value)
{
    header("HTTP/1.1 200 OK");
    $input['codigo'] = 200;
    $input['texto'] = $value;
    echo json_encode($input);
}

function NotFoundRequest()
{
    header("HTTP/1.1 404 Not Found");
    $input['codigo'] = 404;
    $input['texto'] = "No encontrado";
    echo json_encode($input);
}

function BadRequest($connection)
{
    header("HTTP/1.1 400 Bad Request");
    $input['codigo'] = 400;
    $input['texto'] = mysqli_error($connection);
    echo json_encode($input);
}

?>