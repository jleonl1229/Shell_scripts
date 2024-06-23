<html>

<h2>Resutlado<h2>
<?php

function getit($number1, $number2)
{
	return ($number1 + $number2);
}

/* echo "This is \nthe main function"; */
$n1 = 2;	
$n2 = 4;
$n3 = 0;
$n3 = getit($n1, $n2);
echo "The result is: " . $n3;
?>
<h4>Loading (<?php echo $n3; ?>)</h4>
<?php 
	if ($n3 > 5)
		echo "<p>The result is greater than 5</p>";
	else
		echo "<p>The result is lower or equal than 5</p>";
?>

<form action="index.php" method="post">
	<input type="text" name="nombre"></input>
	<button type="submit">Sumbitme</button>
</form>

<a href="http://localhost:80/info.php">Php info page</a>

<?php
	if ($_SERVER["REQUEST_METHOD"] == "POST")
	{
		$i = 0;
		$nombre = $_POST["nombre"];
		$numy = getit($n1, $n2);
		echo $nombre . $numy . $n3;
		/* while ($nombre[$i]) */
		/* { */
		/* 	if ($i % 2 == 0) */
		/* 		echo $nombre[$i]; */
		/* 	$i++; */
		/* } */
		$file = fopen("nombres.txt", "a+");
		if ($file)
		{
			fwrite($file, $nombre);
			fwrite($file, "\n");
			fclose($file);
			/* header("Location: info.php"); */
			/* exit; */
		}
		else
			echo "Error opening the file";
	}
?>
<h1>Here i'll start with the database connection</h1>
<?php
	$servername = "localhost";
	$username = "php_user";
	$password = "12345";
	$dbname = "prueba";

	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error)
		die("Could not connect: " . $conn->connect_error);
	echo "Successfully connected to the database " . $dbaname;

	$stmt = $conn->prepare("INSERT INTO tabla (nombre) VALUES (?)");
	$stmt->bind_param("s", $nombre);

	if ($stmt->execute())
		echo "New name inserted in the database";
	else
		echo "Error ". $stmt->error;
	$stmt->close();
?>
<h1>Let's list all the users introduced on the table of my database</h1>
<?php
	$sql = "SELECT * FROM tabla";
	$result = $conn->query($sql);
	if ($result->num_rows > 0)
	{
		$usuarios = array();
		while ($row = $result->fetch_assoc())
			$usuarios[] = $row;
		foreach ($usuarios as $usuario)
			echo "ID: " . $usuario['id'] . " - Nombre: " . $usuario['nombre'] . "<br>";
	}
	else
		echo "No results found";
	$conn->close();
?>

<form action="index.php" method="post">
	<input type="text" name="query"></input>
	<button type="submit">SQLme</button>
</form>

<?php
	if ($_SERVER['REQUEST_METHOD'] == "POST")
		$query = $_POST['query'];

	$conn2 = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error)
		die("Could not connect: " . $conn2->connect_error);
	/* echo "Successfully connected to the database " . $dbaname; */
	$result = $conn2->query($query);
	if ($result->num_rows > 0)
	{
		$usuarios = array();
		while ($row = $result->fetch_assoc())
			$usuarios[] = $row;
		foreach ($usuarios as $usuario)
			echo $usuario->name . $usuario['id'] . " " .  $uuario->name . $usuario['nombre'] . "<br>";
	}
	else
		echo "No results found";
	$conn->close();
?>

</html>
