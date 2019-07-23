<?php

	include 'conexion.php';
	
	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$nivel = $_POST['nivel'];

	
	$connect->query("UPDATE usuarios SET username='".$username."', password='".$password."', nivel='".$nivel."' WHERE id=". $id);

?>