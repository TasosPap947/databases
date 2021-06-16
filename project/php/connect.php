<?php
  $servername = "localhost";
  $username = "root";
  $password = "";
  $database_name = "db-ntua";
  // Create connection
  $conn = new mysqli($servername, $username, $password, $database_name) or die("Unable to connect");

  //Check connection
  if ($conn->connect_error) {
    die("Η σύνδεση με την βάση δεδομένων απέτυχε: " . $conn->connect_error);
  }
  else {
    echo nl2br("H σύνδεση με την βάση δεδομένων ήταν επιτυχής.\n");
  }
?>
