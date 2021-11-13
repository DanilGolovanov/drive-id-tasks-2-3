<?php 
    // get provided arguments
    if ($argc == 3) {
        $category = $argv[1];
        $limit = $argv[2];
    } else { // handle cases with wrong inputs
        echo "Wrong input.\nUsage: php file.php category limit";
        return;
    }
    
    // fetch data and read JSON file
    $API_URL = "https://api.publicapis.org/entries";
    $json_data = file_get_contents($API_URL);

    // decode JSON data to array
    $response_data = json_decode($json_data);

    // retrieve info from response data
    $entries_count = $response_data->count;
    $entries_data = $response_data->entries;

    // sort and print APIs in descending alphabetical order
    usort($entries_data, fn($a, $b) => -1 * strcmp($a->API, $b->API));

    $counter = 0;

    // loop through array of entries and print ones with matching category
    foreach ($entries_data as $entry) {
        if ($counter == $limit) { // make sure we not going over the limit
            break;
        }
        if ($entry->Category == $category) {
            echo $entry->API . "\n";
            $counter++;
        }
    }

    // print message if no entries matched provided category
    if ($counter == 0) {
        echo "No results";
    }
?>