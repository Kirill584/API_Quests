<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Credentials: true');
header("Content-type: json/application");

require "connect.php";
require "functions.php";

$method = $_SERVER['REQUEST_METHOD'];

$q = $_GET["q"];
$params = explode('/', $q);

$type = $params[0];
if (isset($params[1]))
    $id = $params[1];
if (isset($params[2])){
    $type_2 = $params[2];
    $id_u = $params[1];
}
if (isset($params[3]))
    $id_q = $params[3];

switch ($method) {
    case 'GET':
        switch ($type) {
            case 'users':
                get_users($connect);
                break;
            case 'user':
                if (isset($id)) {
                    get_user_info($connect, $id);
                }
                break;
            case 'quests':
                get_quests($connect);
                break;
            case 'quest':
                if (isset($id)) {
                    get_quest($connect, $id);
                }
                break;
        }
        break;
    case 'POST':
        switch ($type) {
            case 'user':
                add_user($connect, $_POST);
                break;
            case 'quest':
                add_quest($connect, $_POST);
                break;
        }
        break;
    case 'PATCH':
        if(isset($id_u) and isset($id_q)) {
            quest_done($connect, $id_u, $id_q);
        }
        else if(isset($id_u) or isset($id_q)){
            choose_user();
        }
        break;
}
?>