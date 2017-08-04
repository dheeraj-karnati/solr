
<?php


$ds = DIRECTORY_SEPARATOR;
$storeFolder = '../ead_uploads/';

if (!is_dir($storeFolder)) {
    mkdir($storeFolder);
}

if (!empty($_FILES)) {

    $tempFile = $_FILES['files']['tmp_name'];

    $targetPath = dirname( __FILE__ ) . $ds . $storeFolder . $ds;

    $fullPath = $storeFolder.rtrim($_POST['path'], "/.");
    $folder = substr($fullPath, 0, strrpos($fullPath, "/"));

    if (!is_dir($folder)) {
        $old = umask(0);
        mkdir($folder, 0777, true);
        umask($old);
    }

    if (move_uploaded_file($tempFile, $fullPath)) {
        die();
    } else {
        die('e');
    }
}
?>