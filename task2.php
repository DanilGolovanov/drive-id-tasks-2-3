<?php 
    $API_URL = 'https://api.publicapis.org/entries';

    // fetch data and read JSON file
    $json_data = file_get_contents($API_URL);

    // decode JSON data to array
    $response_data = json_decode($json_data);

    // retrieve info from response data
    $entries_count = $response_data->count;
    $entries_data = $response_data->entries;

    $str = $entries_data[0]->API;
    echo $str;
?>