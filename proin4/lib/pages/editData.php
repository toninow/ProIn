<?php

	include 'conexion.php';
	
	$id_usuario = $_POST['id_usuario'];
	$cuenta_usuario = $_POST['cuenta_usuario'];
	$password_usuario = $_POST['password_usuario'];
	$nombre_usuario = $_POST['nombre_usuario'];
	$connect->query("UPDATE usuario SET cuenta_usuario='".$cuenta_usuario."', password_usuario='".$password_usuario."', nombre='".$nombre."' WHERE id_usuario=". $id_usuario);
?>
