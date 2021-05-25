<?php
return [
    'server' => [
        'path' => $_SERVER['DOCUMENT_ROOT']
    ],
    'database' => [
        'dbname' => '',
        'username' => '',
        'password' => '',
        'connection' => 'pgsql:host=127.0.0.1',
        'options' => [
            PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
        ]
    ]
];