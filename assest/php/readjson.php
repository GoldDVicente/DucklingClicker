<?php
$data = file_get_contents("data/products.json");
$products = json_decode($data, true);

foreach ($products as $product) {
    echo '<pre>';
    print_r($product);
    echo '</pre>';
}
?>