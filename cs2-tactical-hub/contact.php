<?php
// contact.php

// Povolit CORS v případě potřeby (pro lokální vývoj)
header("Access-Control-Allow-Origin: *");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = strip_tags(trim($_POST["name"]));
    $email = filter_var(trim($_POST["email"]), FILTER_SANITIZE_EMAIL);
    $message = strip_tags(trim($_POST["message"]));

    // Validace
    if (empty($name) || empty($message) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo "Prosím vyplňte všechna pole správně.";
        exit;
    }

    // Zde by bylo odeslání e-mailu: mail($to, $subject, $content, $headers);
    // Pro ukázku jen simulueme úspěch a uložíme do souboru
    
    $logEntry = date('Y-m-d H:i:s') . " | $name ($email): $message" . PHP_EOL;
    file_put_contents('messages.log', $logEntry, FILE_APPEND);

    http_response_code(200);
    echo "Díky, $name! Tvoje zpráva byla přijata.";
} else {
    http_response_code(403);
    echo "Nop. Tudy cesta nevede.";
}
?>
