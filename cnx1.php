<?php
	try{
		$connect = new PDO("mysql:host=127.0.0.1;dbname=projet", "root", "");
	}
	catch(PDOException $e){
		echo 'Echec'.$e->getMessage();
	}
?>