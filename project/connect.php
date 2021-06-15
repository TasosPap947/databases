<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1> Example database </h1>
  </body>
</html>

<?php
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "db-ntua";

  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  else {
    echo nl2br("Connection succeeded.\n");
  }

  $sql = "SELECT id, firstname, lastname FROM MyGuests";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "<h1>"."id: " . $row["id"] . " - Name: " . $row["firstname"]. " " . $row["lastname"]."</h1>"."<br>";
    }
  }
  else {
    echo "0 results";
  }

  echo "Hello world!";

  $conn->close();
?>
