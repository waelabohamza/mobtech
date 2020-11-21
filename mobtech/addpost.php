<?php

include "connect.php" ;
 
$post = $_POST['post'] ;
$postuser = $_POST['postuser'];
$imagname = $_POST['imagename'] ;
$image64 = $_POST['image64'] ;
$image = base64_decode($image64) ;

print_r($_POST) ;

$sql = "INSERT INTO `post`( `post`, `post_user`  , `post_image`)
        VALUES             ( :post ,:postuser , :img )" ;

$stmt = $con->prepare($sql) ;
$stmt->execute(array(
	":post" => $post ,
	":postuser"   => $postuser ,
  ":img"   => $imagname
));

$count = $stmt->rowCount() ;

if ($count > 0) {

  file_put_contents("upload\\" . $imagname , $image) ;

	echo json_encode(array("status" => "success add")) ;
}
