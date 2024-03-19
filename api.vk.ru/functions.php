<?php

use function PHPSTORM_META\type;

function get_users($connect){
    $users = mysqli_query($connect, "SELECT * FROM `Users`");
    $usersList = [];

    while ($user = mysqli_fetch_assoc($users)){
         $usersList[] = $user;
    }

    echo json_encode($usersList);
}

function get_user_info($connect, $id){
    $user = mysqli_query($connect, "SELECT * FROM `Users` Where `id` = '$id'");
    if (mysqli_num_rows($user) === 0){
        http_response_code(404);
        $res = [
            "status"=> false,
            "message"=> "User not found"
        ];
        echo json_encode($res);
    }
    else{
        $user = mysqli_fetch_assoc($user);
        $res = [
            "name" => $user["name"],
            "balance" => $user["balance"],
            "quests"=> $user["quests"],
        ];
        echo json_encode($res);
    }
}

function add_user($connect, $data){
    if ($data['name']){
        mysqli_query($connect,"INSERT INTO `Users` (`id`, `name`, `balance`, `quests`) VALUES (NULL, '$data[name]', '0', NULL)");

        http_response_code(201);

        $res = [
            "status"=> true,
            "message"=> mysqli_insert_id($connect),
        ];
        echo json_encode($res);
    }
    else{
        http_response_code(400);

        $res = [
            "status"=> false,
            "message"=> "Напишите имя пользователя или проверьте правильность введенных данных",
        ];
        echo json_encode($res);
    }
}

function get_quests($connect){
    $quests = mysqli_query($connect, "SELECT * FROM `Quests`");
    $questsList = [];

    while ($quest = mysqli_fetch_assoc($quests)){
         $questsList[] = $quest;
    }

    echo json_encode($questsList);
}

function get_quest($connect, $id){
    $quest = mysqli_query($connect, "SELECT * FROM `Quests` Where `id` = '$id'");

    if (mysqli_num_rows($quest) === 0){
        http_response_code(404);
        $res = [
            "status"=> false,
            "message"=> "Quest not found"
        ];
        echo json_encode($res);
    }
    else{
        $quest = mysqli_fetch_assoc($quest);
        echo json_encode($quest);
    }
}

function add_quest($connect, $data){
    $name = $data['name'];
    $cost = intval($data['cost']);
    if($name and $cost and gettype($cost) === 'integer' and gettype($name) === 'string'){
        mysqli_query($connect,"INSERT INTO `Quests` (`id`, `name`, `cost`) VALUES (NULL, '$name', '$cost')");

        http_response_code(201);

        $res = [
            "status"=> true,
            "message"=> mysqli_insert_id($connect),
        ];
        echo json_encode($res);
    }  
    else{
        http_response_code(400);

        $res = [
            "status"=> false,
            "message"=> "Проверьте наличие введенных данных",
        ];
        echo json_encode($res);
    }
}

function quest_done($connect, $id_u, $id_q){
    $user = mysqli_query($connect, "SELECT * FROM `Users` Where `id` = '$id_u'");
    $quest = mysqli_query($connect, "SELECT * FROM `Quests` Where `id` = '$id_q'");
    $user = mysqli_fetch_assoc($user);
    $quest = mysqli_fetch_assoc($quest);
    $balance = $user['balance'] + $quest['cost'];
        if($user['quests'] !== null){
            $quests = $user['quests'] . "; " . $quest['id'];
        }
        else{
            $quests = $quest['id'];
        }
        mysqli_query($connect, "UPDATE `Users` SET `balance` = $balance, `quests` = '$quests' Where `id` = $id_u");

        http_response_code(200);

        $res = [
            "status"=> true,
            "message"=> 'Задание выполнено'
    ];

    echo json_encode($res);
}

function choose_user(){
    http_response_code(401);
    
    $res = [
        "status"=> false,
        "message"=> 'Выберите сначала пользователя'
    ];

    echo json_encode($res);
}