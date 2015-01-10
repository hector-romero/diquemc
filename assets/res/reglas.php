<?php

require(dirname(__FILE__) . '/../foro/SSI.php');
header( 'Content-Type:text/html; charset=UTF-8' );
header( 'Access-Control-Allow-Origin: http://localhost:9292' );
$result = ssi_fetchPosts(2,true, 'm') ;

echo "<h2>",$result[0]['subject'],"</h2>";
echo $result[0]['body'];
?>

